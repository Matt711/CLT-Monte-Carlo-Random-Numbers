function Approx(size, iterations)
answer = rand(iterations,1);
for m = 1:iterations
    X = rand(size, 1);
    for n = 1:size
        X(n) = (X(n) * 3) - 1.5;
    end
    Y = rand(size, 1);
    for n = 1:size
        Y(n) = (Y(n) * 3) - 1.5;
    end
    g = rand(size, 1);
    for n = 1:size
        g(n) = abs(X(n)) + abs(Y(n));
    end
    f = sum(g);
    answer(m) = f / size;
end
disp(mean(answer));