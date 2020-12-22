%{
-??†æ?å?‡æ•¸??Œå¶?•¸??„æ?…æ??
-å¥‡æ•¸:ä¸­é?“æ?ƒå‡º?¾?œ¨N/2??„é?²ä??
-?¶?•¸:?š¨ä¾¿é¸ä¸??‹ä¸­??“ç?„ä?å??,å¾ä¸­??“ç?„å·¦ä¸Šè?’é?‹å??
%}
function final_project17(N)
    output = clockwiseMatrix(N)
    sumDiagonal = diagonal(N)
    imagePrime(N)
end

function output = clockwiseMatrix(N)
    if(N == 1)
        A = 1;
    elseif(rem(N,2) == 0)% ?¶?•¸??„ç?æ³?(è£œçŸ©?™£??„å³ï¼Œä??)
        A = zeros(N); % å»ºN*N??„çŸ©?™£
        B = clockwiseMatrix(N - 1); % N-1??…ç?„çŸ©?™£
        for ii = 1 : N - 1 
            % B[@,#]
            % è¡Œ@: å°‡é‚£ä¸?è¡Œç?„å…¨?ƒ¨?•¸å­—å°?‡º
            % ???#: å°‡row1??„æ?å¾Œä??‹æ•¸å­—æ?è?‘ä?æ¬¡å°±+1
            A(ii,:) = [B(ii,:),B(1,end)+ii]; 
        end
        for k = 1 : N
            % å°‡çŸ©?™£??å¾Œä?è¡Œå°?‡º
            % +1?˜¯?‚ºäº†è?“æ?å¾Œä?è¡Œç?„ç¬¬ä¸??‹æ•¸å­—æ˜¯å±¬æ–¼N^2
            % kè¡¨ç¤ºlast row??„next column
            A(N,k) = N * N + 1 - k; 
        end
    else %å¥‡æ•¸??„ç?æ³?(è£œçŸ©?™£??„å·¦ï¼Œä??)
        A = zeros(N);
        B = clockwiseMatrix(N-1);
        for ii = 2:N
            % B[@,#]
            % è¡Œ@: å°‡last row??„æ?å¾Œä??‹æ•¸å­—å?šN-ii+1??„å?•ä?œï?Œii?˜¯æ¯å?šä?æ¬¡ç?„è?Œæ•¸
            % ???#: å°‡å‰©ä¸‹ç?„å?—å…¨?ƒ¨?•¸å­—å°?‡º
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
    map = [0 0 0;1 1 1]; % 0:¶Â 1:¥Õ
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
