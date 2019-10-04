function [Train, Test]=data_division(ratings)
I0=ratings(:,1);
J0=ratings(:,2);
VAL=ratings(:,3);
N=max(I0); M=max(J0);
R0 = sparse(I0, J0, VAL, N, M);
R=R0>0;        %Remove explicit ratings but keep the rating action: transform the explicit rating to implicit feedback
flg=1;
while flg 
    [n0,m0]=size(R);
    R(:,find(sum(R)<10))=[];
    R(find(sum(R,2)<10),:)=[];
    [n1,m1]=size(R);
    f1=n0-n1;
    f2=m0-m1;
    flg=f1+f2;
end
[N,M]=size(R);
%divide train & test datasets
for u=1:N
    [I,J,Val] = find(R(u,:));
    [train,test] = crossvalind('LeaveMOut',nnz(R(u,:)),1);  %for each user, select 1 rating for testing
    Train(u,:)=sparse(I(train), J(train), Val(train),1, M);
    Test(u,:)=sparse(I(test),J(test), Val(test), 1, M);
end
end



