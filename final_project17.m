%{
-??��?��?�數??�偶?��??��?��??
-奇數:中�?��?�出?��?��N/2??��?��??
-?��?��:?��便選�??�中??��?��?��??,從中??��?�左上�?��?��??
%}
function final_project17(N)
    output = clockwiseMatrix(N)
    sumDiagonal = diagonal(N)
    imagePrime(N)
end

function output = clockwiseMatrix(N)
    if(N == 1)
        A = 1;
    elseif(rem(N,2) == 0)% ?��?��??��?�?(補矩?��??�右，�??)
        A = zeros(N); % 建N*N??�矩?��
        B = clockwiseMatrix(N - 1); % N-1??��?�矩?��
        for ii = 1 : N - 1 
            % B[@,#]
            % 行@: 將那�?行�?�全?��?��字印?��
            % ???#: 將row1??��?後�??�數字�?��?��?次就+1
            A(ii,:) = [B(ii,:),B(1,end)+ii]; 
        end
        for k = 1 : N
            % 將矩?��??後�?行印?��
            % +1?��?��了�?��?後�?行�?�第�??�數字是屬於N^2
            % k表示last row??�next column
            A(N,k) = N * N + 1 - k; 
        end
    else %奇數??��?�?(補矩?��??�左，�??)
        A = zeros(N);
        B = clockwiseMatrix(N-1);
        for ii = 2:N
            % B[@,#]
            % 行@: 將last row??��?後�??�數字�?�N-ii+1??��?��?��?�ii?��每�?��?次�?��?�數
            % ???#: 將剩下�?��?�全?��?��字印?��
            A(ii,:) = [B(end,1)+N-ii+1,B(ii-1,:)];
        end
        for k = 1:N
            % row1
            A(1,k) = N * N - N + k;
        end
    end
    output = A;
end

function sumDiagonal = diagonal(N)
    sumDiagonal = 0-rem(N,2);
    for ii = 1:N
        sumDiagonal = (ii*ii-ii+1) + sumDiagonal;
        if(rem(ii,2) == 0)
            sumDiagonal = sumDiagonal + ii * ii + 1;
        else
            sumDiagonal = sumDiagonal + ii * ii;
        end
    end
end

function imagePrime(N)
    A = clockwiseMatrix(N);
    for ii = 1:N
        for jj = 1:N
            B(ii,jj) = isPrime(A(ii,jj));
        end
    end
    map = [0 0 0;1 1 1]; % 0:�� 1:��
    image(B);
    colormap(map);
end

function primeNum = isPrime(N)
    primeNum = 0;
    if N == 1
        primeNum = 2;
    end
    t = floor(sqrt(N));
    for ii = 2:t
        if (rem(N,ii) == 0)
            primeNum = 2;
            break;
        end
    end
end
