%W3Q5 my answer to question 5 of week's 3 homework at Coursera's Introduction to Image and Video Processing

%% 
% x(n1,n2) is defined as x(n1,n2)=(?1)n1+n2 when 0?n1,n2?2 and zero elsewhere.
% Denote by X(k1,k2), where 0?k1,k2?2, the DFT of x(n1,n2). 
% What is the value of X(1,2)?
%% 


n1 = 0:2;
n2 = 0:2;
[n1,n2]=meshgrid(n1,n2);

x = [2 1 1; 1 0 0; 0 0 0; 1 0 0];
X = zeros(size(x))+0.0j;
%x=(-1).^(n1+n2)
%X = zeros(size(x,1)+1,size(x,2))
for n1=0:3
    for n2=0:2
        for k1=0:3
            for k2=0:2
                X(k1+1,k2+1) = X(k1+1,k2+1) + x(n1+1,n2+1)*exp(-1j*((2*pi)/4)*n1*k1)*exp(-1j*((2*pi)/3)*n2*k2);
            end
        end
    end
end
X_=X';
fprintf ('X(1,2) = %4.2f\n ',X_(1,2));
