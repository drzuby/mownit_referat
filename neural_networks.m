%% przyk³ad 1 - dopasowywanie danych na p³aszczyŸnie
close all

input = [0.1 0.2 0.3 0.5 0.7 1 2 3 5 7 10];
target = [0.455 0.459 0.462 0.468 0.473 0.480 0.498 0.512 0.532 0.545 0.561];

input = input';
target = target';
f1 = fit(input, target, 'poly1');
f3 = fit(input, target, 'poly3');

figure
h = plot(input, target, 'or');
set(h, 'LineWidth', 2, 'markers', 10);
hold on
h = plot(f1, 'b');
set(h, 'LineWidth', 2);
hold on
h = plot(f3, 'm');
set(h, 'LineWidth', 2);
legend('hide');
xlabel('x'); ylabel('y');

%% przyk³ad 1 cd.
hold on
h = plot(input, output, 'x-k');
set(h, 'LineWidth', 2, 'markers', 7);

%% przyk³ad 2 - dopasowywanie danych w przestrzeni
close all;

input = [   1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 4 4 4 4 4 5 5 5 5 5;
            1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5];
target = [  4 5 7 2 3 4 6 8 4 3 6 9 4 5 3 0 5 8 4 6 3 9 7 2 4];

input = input';
target = target';
f11 = fit([input(:, 1), input(:, 2)], target, 'poly11');
f33 = fit([input(:, 1), input(:, 2)], target, 'poly33');
input = input';
target = target';

figure
h = plot3(input(1, :), input(2, :), target, 'or');
set(h, 'LineWidth', 3);
hold on
plot(f11);
figure
h = plot3(input(1, :), input(2, :), target, 'or');
set(h, 'LineWidth', 3);
hold on
plot(f33);
xlabel('x'); ylabel('y'); zlabel('z');

%% przyk³ad 2 - cd.
close all;

figure
h = plot3(input(1, :), input(2, :), target, 'or');
set(h, 'LineWidth', 3);
hold on
h = plot3(input(1, :), input(2, :), output, 'xk');
set(h, 'LineWidth', 3);
hold on
plot(f33);
hold on
plot(f11);
xlabel('x'); ylabel('y'); zlabel('z');

%% przyk³ad 3 - klasyfikacja dwóch zbiorów na p³aszczyŸnie
close all

mu = [3 3];
sigma = [1 0.3; 0.3 0.6];
input = mvnrnd(mu, sigma, 100);
groups = zeros(100, 1);

input = input';
[~, I] = sort(input(1, :));
input = input(:, I);
input = input';

for i = 1:1:35
    groups(i, 1) = 1;
end
for i = 36:1:65
    p = rand();
    if p < 0.5
        groups(i, 1) = 1;
    end
end

h = gscatter(input(:, 1), input(:, 2), groups, 'rb', 'o+');
set(h, 'LineWidth', 2);
xlabel('x'); ylabel('y');

[x, y] = meshgrid(linspace(0, 6), linspace(0, 6));
x = x(:);
y = y(:);

[C, ~, ~, ~, coeff] = classify([x y], [input(:, 1) input(:, 2)], groups, 'Quadratic');

hold on
gscatter(x, y, C, 'rb', '.', 4, 'off');
K = coeff(1, 2).const;
L = coeff(1, 2).linear;
Q = coeff(1, 2).quadratic;
f = @(x, y) K + [x y]*L + sum(([x y]*Q) .* [x y], 2);

hold on
h = ezplot(f, [0 6 0 6]);
set(h, 'Color', 'k', 'LineWidth', 2);
axis([0 6 0 6]);
legend('hide');
title('');

%% przyk³ad 3 - cd.

output = output';
for i = 1:1:numel(output)
    if output(i, 1) < 0.5
        output(i, 1) = 0;
    else
        output(i, 1) = 1;
    end
end

figure
h = gscatter(input(:, 1), input(:, 2), groups, 'rb', 'o+');
set(h, 'LineWidth', 2);
xlabel('x'); ylabel('y');
hold on
gscatter(x, y, C, 'rb', '.', 4, 'off');
hold on
h = ezplot(f, [0 6 0 6]);
set(h, 'Color', 'k', 'LineWidth', 2);
hold on
h = gscatter(input(:, 1), input(:, 2), output, 'mc', '+o');
set(h, 'LineWidth', 2);
axis([0 6 0 6]);
legend('hide');
title('');

%% przyk³ad 4 - klasyfikacja trzech zbiorów na p³aszczyŸnie
close all

mu = [3 3];
sigma = [1 0.3; 0.3 0.6];
input = mvnrnd(mu, sigma, 125);
groups = zeros(125, 1);
groups_net = zeros(125, 3);

input = input';
[~, I] = sort(input(1, :));
input = input(:, I);
input = input';

for i = 1:1:25
    groups(i, 1) = 1;
    groups(i + 50, 1) = 2;
    
    groups_net(i, 1) = 1;
    groups_net(i + 50, 2) = 1;
    groups_net(i + 100, 3) = 1;
end
for i = 26:1:50
    p = rand();
    if p < 0.5
        groups(i, 1) = 1;
        groups_net(i, 1) = 1;
    else
        groups(i, 1) = 2;
        groups_net(i, 2) = 1;
    end
    p = rand();
    if p < 0.5
        groups(i + 50, 1) = 2;
        groups_net(i + 50, 2) = 1;
    else
        groups_net(i + 50, 3) = 1;
    end
end

h = gscatter(input(:, 1), input(:, 2), groups, 'rbk', '+');
set(h, 'LineWidth', 2);
xlabel('x'); ylabel('y');

[x, y] = meshgrid(linspace(0, 6), linspace(0, 6));
x = x(:);
y = y(:);

[C, ~, ~, ~, ~] = classify([x y], [input(:, 1) input(:, 2)], groups, 'Quadratic');

hold on
gscatter(x, y, C, 'rbk', '.', 4, 'off');
axis([0 6 0 6]);
legend('hide');
title('');

%% przyk³ad 4 - cd.
output = output';

for i = 1:1:125
    a = output(i, 1);
    b = output(i, 2);
    c = output(i, 3);
    if a > b
        if a > c
            groups(i, 1) = 1;
        else
            groups(i, 1) = 0;
        end
    else
        if c > b
            groups(i, 1) = 0;
        else
            groups(i, 1) = 2;
        end        
    end
end

h = gscatter(input(:, 1), input(:, 2), groups, 'rbk', 'o');
set(h, 'LineWidth', 2);
xlabel('x'); ylabel('y');

[C, err, P, logp, coeff] = classify([x y], [input(:, 1) input(:, 2)], groups, 'Quadratic');

hold on
gscatter(x, y, C, 'rbk', '.', 4, 'off');
axis([0 6 0 6]);
legend('hide');
title('');