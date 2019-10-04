
%r=8; %the dimension of hash code
[P,Q,X,Y]=Initial(Train,r, alpha, beta);
[B, D] =dpr_main(Train, P, Q, X, Y, alpha, beta);
[r,N]=size(B);
[r,M]=size(D);
for u=1:N
       pos=find(Test(u,:));
       neg=[1:M];
       neg(pos)=[];
       Bud=B(:,u)'*D; %1xM
       L1=length(pos);
       L2=length(neg);
       sig=zeros(1,L1);
    for i=1:L1
        a=B(:,u)'*D(:,pos(i))- B(:,u)'*D(:,neg)>0; 
        sig(i)=sum(a)/L2;
    end
        sigm1(u)=sum(sig)/L1;
end
AUC=sum(sigm1)/N   %the result of evaluation


