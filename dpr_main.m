function [B, D] =dpr_main(Train, P, Q, X, Y, alpha, beta)
[N,M]=size(Train);
[r,N]=size(P);
Ia=1./sum(Train,2);
Is=1./(M-sum(Train,2));
B=sign(P);
D=sign(Q); 
times=10;
for t=1:times   
 B  = Bsub1( Train, B, D, X,r, N, M, Ia, Is, alpha, beta);
 D = Dsub1(Train, B, D, Y, r, Ia, Is, N, M, alpha, beta);
 X = UpdateSVD(B);
 Y = UpdateSVD(D);
end
end


