function output = clockwiseMatrix(N)
    % Input : an integer N
    % Output : a N * N matrix A
    % example:
	% clockwiseMatrix(6)
    %{
        21 22 23 24 25 26
        20  7  8  9 10 27
        19  6  1  2 11 28
        18  5  4  3 12 29
        17 16 15 14 13 30
        36 35 34 33 32 31
    %}
    
    if(N == 1)
        A = 1;
    elseif(rem(N,2) == 0)% 偶數的狀況(補矩陣的右，下)
        A = zeros(N); % 建N*N的矩陣
        B = clockwiseMatrix(N - 1); % N-1項的矩陣
        for ii = 1 : N - 1 
            % B[@,#]
            % 行@: 將那一行的全部數字印出
            % 列#: 將row1的最後一個數字每跑一次就+1
            A(ii,:) = [B(ii,:),B(1,end)+ii]; 
        end
        for k = 1 : N
            % 將矩陣最後一行印出
            % +1是為了讓最後一行的第一個數字是屬於N^2
            % k表示last row的next column
            A(N,k) = N * N + 1 - k; 
        end
    else %奇數的狀況(補矩陣的左，上)
        A = zeros(N);
        B = clockwiseMatrix(N-1);
        for ii = 2:N
            % B[@,#]
            % 行@: 將last row的最後一個數字做N-ii+1的動作，ii是每做一次的行數
            % 列#: 將剩下的列全部數字印出
            A(ii,:) = [B(end,1)+N-ii+1,B(ii-1,:)];
        end
        for k = 1:N
            % row1
            A(1,k) = N * N - N + k;
        end
    end
    output = A;
end