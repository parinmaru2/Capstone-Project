R = [5 3 0 1; 4 0 0 1; 1 1 0 5; 1 0 0 4; 0 1 5 4];
N = length(R(:,1));
M = length(R(1,:));
K = 2;

P = rand(N,K);
Q = rand(M,K);
alpha = 0.0002;
beta = 0.02;

Q = Q';

for step = 1:5000
    for i = 1:N
        for j = 1:M
            if (R(i,j) > 0)
                eij = R(i,j) - P(i,:) * Q(:,j);
                    for k = 1:2
                        P(i,k) = P(i,k) + alpha * (2 * eij * Q(k,j) - beta * P(i,k));
                        Q(k,j) = Q(k,j) + alpha * (2 * eij * P(i,k) - beta * Q(k,j));
                    end
            end
        end
    end
    eR = P * Q;
    e = 0;
    for i = 1:N
        for j = 1:M
            if (R(i,j) > 0)
                e = e + power(R(i,j) - P(i,:) * Q(:,j), 2);
                for k= 1:K
                    e = e + (beta/2) * (power(P(i,k),2) + power(Q(k,j),2));
                end
            end
        end
    end
    if (e < 0.001)
        break;
    end
end

R = P * Q;

