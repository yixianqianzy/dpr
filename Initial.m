function [P, Q, X, Y]=Initial(Train,r, alpha, beta);
[N,M]=size(Train); 
P=randn(r,N);
Q=randn(r,M);
Ia=1./sum(Train,2);
Is=1./(M-sum(Train,2));
times=20;
for t=1:times    
 X = UpdateSVD(P);
 Y = UpdateSVD(Q);
 P = Psub( Train, P, Q, X,r, N, M, Ia, Is, alpha, beta);
 Q = Qsub(Train, P, Q, Y, r, Ia, Is, N, M, alpha, beta);
end
end


