%% Initialization
clear ; close all; clc

%% Load Data
%  The first two columns contains the exam scores and the third column
%  contains the label.

data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);

%% ==================== Part 1: Plotting ====================
%  We start the exercise by first plotting the data to understand the
%  the problem we are working with.

fprintf(['Plotting data with + indicating (y = 1) examples and o ' ...
         'indicating (y = 0) examples.\n']);

## plotData(X, y);

## % Put some labels
## hold on;
## % Labels and Legend
## xlabel('Exam 1 score')
## ylabel('Exam 2 score')

## % Specified in plot order
## legend('Admitted', 'Not admitted')
## hold off;

## fprintf('\nProgram paused. Press enter to continue.\n');
## pause;


%% ============ Part 2: Compute Cost and Gradient ============
%  In this part of the exercise, you will implement the cost and gradient
%  for logistic regression. You neeed to complete the code in
%  costFunction.m

%  Setup the data matrix appropriately, and add ones for the intercept term
[m, n] = size(X);

% Add intercept term to x and X_test
X = [ones(m, 1) X];

% Initialize fitting parameters
initial_theta = zeros(2 , 1);
initial_theta = [-24; 0.2];
X = X(:,[1 3]);
temp = zeros(400, 3);
% Compute and display initial cost and gradient
for i = 1 : 400,
  [cost, grad] = costFunction(initial_theta, X, y);
  temp(i, 1) = initial_theta(2, 1);
  temp(i, 2) = cost;
  temp(i, 3) = sigmoid(X * initial_theta)(1, 1);
  initial_theta = initial_theta + 0.003;
end;
temp
hold on;
plot(temp(:,1), temp(:,2), 'r');
hold off;
