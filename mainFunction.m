function mainFunction(choice,N)
    % Input: choice(1/2/3), an integer N
    % Output: 
    %(1) an N*N matrix  
    %(2) sum of diagonal  
    %(3) an image of prime number
    % example:
    % >> mainFunction(1,5)
    %{
    21 22 23 24 25
    20  7  8  9 10
    19  6  1  2 11
    18  5  4  3 12
    17 16 15 14 13
    %}
    % >> mainFunction(2,5)
    % sum = 101
    
    if choice == 1
        tic
        output = clockwiseMatrix(N)
        toc
    elseif choice==2
        tic
        sum = sumDiagonal(N)
        toc
    elseif choice==3
        tic
        imagePrime();
        toc
    end
end