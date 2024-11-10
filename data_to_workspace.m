% Load the CSV file into a table
data = readtable('combined_solar_irradiance_data_1.csv');

% Display the first few rows of the table
head(data);

% Extract input features (latitude, longitude, month, day, hour)
X = data{:, {'latitude', 'longitude' ,'month', 'day', 'hour'}};

% Extract output values (solar_irradiance)
Y = data{:, 'solar_irradiance'};

% Display the input features and output values
disp('Input Features (X):');
disp(X(1:5, :));

disp('Output Values (Y):');
disp(Y(1:5));
