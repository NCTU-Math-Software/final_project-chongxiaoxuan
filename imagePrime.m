function imagePrime()
    % Output : graph of matrix A
    % example :
	% imagePrime()

    N=200; % 指定 N = 200
    
    % 利用 clockwiseMatrix.m 的程式碼造出矩陣
    A = clockwiseMatrix(N);
    
    % 將質數的位子變成黑色，其餘的白色
    A = clockwiseMatrix(N);
    for ii = 1:N
        for jj = 1:N
            B(ii,jj) = isPrimeNum(A(ii,jj));
        end
    end
    map = [0 0 0;1 1 1;238/255 44/255 44/255]; % 設定色盤，0:黑，1:白
    
    % 輸入一個數字判斷其是否為質數，並用紅色顯示它在矩陣中的位子
    x = input('Please enter a number and it will show its place: ');
    if x == 1
        f=msgbox('It is not a prime or composite!');
    elseif (~isPrimeNum(x))
        f=msgbox('It is Prime!');
    else
        f=msgbox('It is composite!');
    end
    pause(1.5);
    % 改變使用者輸入的數字的位子的顏色
    m = floor(sqrt(x));
    if rem(m,2) == 0
        ii = floor(N/2) + floor((m + 1) / 2);
        jj = floor(N/2) - floor((m + 1)/2) + 1;
        if x > m * m
            jj = jj - 1;
            if x > m * m + m + 1
                jj = jj + x - m * m  - m - 1;
                ii = ii - m;
            else
                ii = ii - x + m * m + 1;
            end
        end
    else
        ii = floor(N/2) - floor(m/2);
        jj = floor(N/2) + floor(m/2);
        if x > m * m
            jj = jj + 1;
            if x > m * m + m + 1
                jj = jj - x + m * m + m + 1;
                ii = ii + m;
            else
                ii = ii + x - m * m - 1;
            end 
        end
    end
    B(ii,jj) = 3;
    image(B); % show image
    colormap(map);
end

function primeNum = isPrimeNum(N)
    primeNum = 0; % 一開始假定全部都是質數
    if N == 1 % 1不是質數
        primeNum = 2;
    end
    t = floor(sqrt(N)); % 將N開根號再無條件捨棄小數點的值
    for ii = 2:t % 從2開始一直到t
        if (rem(N,ii) == 0) % 從2開始一直到t,如果與N相除後有餘數,即為質數，否則是合數
            primeNum = 2;
            break;
        end
    end
end