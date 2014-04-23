%W3Q7 my answer to question 7 of week's 3 homework at Coursera's Introduction to Image and Video Processing
% X(k1,k2) is real
% X(1,k2)=X(2,k2) for 0≤k2≤2
% X(k1,0)=X(k1,2) for 0≤k1≤3	
% X(k1,k2)=X(k2,k1) for 0≤k1,k2≤2
% X(0,0)=6
clear;clc;
x=[1,0,0,0;1,0,0,0;2,1,0,1]

%x(8,8)=0;
% After zero padding, the matrix size in spatial domain is enlarged and 
% therefore the spacing in frequency domain is narrower. 
% The frequency (for instance X(2,2) ) in 8x8 matrix 
% isn't corresponding to the same frequency of X (2,2,) in 3X4 matrix.
X=fft2(x);
for i=1:size(X,1)
    for j=1:size(X,2)
        fprintf('real: %d;  ',isreal(X(i,i))),
    end
end

X=uint8(real(X))

for k=1:3
fprintf ('X(1+1,k)==X(2+1,k): %d\n',X(1+1,k)==X(2+1,k)),
end

for k1=1:3
    for k2=1:3
       fprintf ('X(k1,k2)==X(k2,k1): %d\n',X(k1,k2)==X(k2,k1)),
    end
end
fprintf('-----------------------------------\n');
fprintf ('X(0,0): %d\n',X(1,1));

%%output:
% x =
% 
%      1     0     0     0
%      1     0     0     0
%      2     1     0     1
% 
% real: 1;  real: 1;  real: 1;  real: 1;  real: 0;  real: 0;  real: 0;  real: 0;  real: 0;  real: 0;  real: 0;  real: 0;  
% X =
% 
%     6    4    2    4
%     0    0    1    0
%     0    0    1    0
% 
% X(1+1,k)==X(2+1,k): 1
% X(1+1,k)==X(2+1,k): 1
% X(1+1,k)==X(2+1,k): 1
% X(k1,k2)==X(k2,k1): 1
% X(k1,k2)==X(k2,k1): 0
% X(k1,k2)==X(k2,k1): 0
% X(k1,k2)==X(k2,k1): 0
% X(k1,k2)==X(k2,k1): 1
% X(k1,k2)==X(k2,k1): 0
% X(k1,k2)==X(k2,k1): 0
% X(k1,k2)==X(k2,k1): 0
% X(k1,k2)==X(k2,k1): 1
% -----------------------------------
% X(0,0): 6
