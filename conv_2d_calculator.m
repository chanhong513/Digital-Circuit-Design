A = [9 1 10 5; 10 6 10 1; 8 6 10 10; 1 3 1 8];  % Your 4x4 input matrix
B = [2 5 5; 5 3 5; 4 0 4];  % Your 3x3 filter matrix (rotated by 180 degrees)
C = conv2(A, B, 'valid')  % The 2D convolution of A and B