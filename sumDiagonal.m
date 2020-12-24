function sum = sumDiagonal(N)
    % Input : an integer N
    % Output : an integer sum
    % example :
    % sumDiagonal(5)
    % sum = 101
   
    sum = 0-rem(N,2); % 避免重複加到1，當N是奇數時
    for ii = 1:N
        sum = (ii*ii-ii+1) + sum; %對角線
        % 反對角線
        if(rem(ii,2)==0) % 偶數情況
            sum = sum + ii * ii + 1;
        else % 奇數情況
            sum = sum + ii * ii;
        end
    end
end