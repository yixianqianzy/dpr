function P = Psub( Rt, P, Q, X,r, N, M, Ia, Is, alpha, beta)
%P-subproblem in the initialization
for u=1:N
    qa(:,u)=Q*Rt(u,:)'*Ia(u);  %rx1
    qs(:,u)=Q*(ones(M,1)-Rt(u,:)')*Is(u); %rx1
    Aua=(Q.*repmat(Rt(u,:),[r,1]))*Q'*Ia(u);
    Aus=(Q.*repmat((ones(1,M)-Rt(u,:)),[r,1]))*Q'*Is(u);
    P(:,u)=(Aua+Aus-qs(:,u)*qa(:,u)'-qa(:,u)*qs(:,u)'+alpha*N*eye(r,r))^-1*(qa(:,u)-qs(:,u)+alpha*N*X(:,u));
end
end