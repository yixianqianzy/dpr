function Q =Qsub(Rt, P, Q, Y, r, Ia, Is, N, M, alpha, beta)
%Q-subproblem in the initialization
for u=1:N
       qa(:,u)=Q*Rt(u,:)'*Ia(u);  %rx1
       qs(:,u)=Q*(ones(M,1)-Rt(u,:)')*Is(u); %rx1
       PQa(u)=P(:,u)'*qa(:,u);
       PQs(u)=P(:,u)'*qs(:,u); 
end
for i=1:M
    pa(:,i)=P*(Rt(:,i).*Ia);  %rx1
    ps(:,i)=P*((ones(N,1)-Rt(:,i)).*Is); %rx1
    Ba=(P.*repmat(Ia'.*Rt(:,i)',[r,1]))*P'; %r*r
    Bs=(P.*repmat(Is'.*(ones(1,N)-Rt(:,i)'),[r,1]))*P'; %r*r
    ppqa=P*(Ia'.*Rt(:,i)'.*PQs)';
    ppqs=P*(Is'.*(1-Rt(u,i)).*PQa)';  
    Q(:,i)=(Bs+Ba+beta*N*eye(r,r))^-1*(ppqs+ppqa+pa(:,i)-ps(:,i)+beta*N*Y(:,i));
end
end