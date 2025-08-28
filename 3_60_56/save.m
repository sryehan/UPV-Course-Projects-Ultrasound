% Load the CSV file data
filename = 'echo_3_60_56_Ascan.csv'; % Replace with your actual file name
data = readtable(filename); % Read the data from the CSV file

% Extracting the columns from the CSV (Assuming the data contains time and amplitude)
time = data.Time; % Modify this based on actual column names in the CSV
amplitude = data.Amplitude; % Modify this based on actual column names in the CSV

% Configuration Settings (Extracted from the CFG file)
Gain = 21.40; % Gain in dB
Delay = 0.00; % Delay in microseconds (us)
Scale = 18.75; % Time scale in us/div

% Adjust the data based on Gain and Delay
amplitude_adjusted = amplitude * 10^(Gain / 20); % Apply gain to amplitude
time_adjusted = time - Delay; % Adjust the time axis based on the delay

% Plot the A-scan data
figure;
plot(time_adjusted, amplitude_adjusted, 'LineWidth', 1.5);
xlabel('Time (us)');
ylabel('Amplitude (dB)');
title('Pulse-Echo A-scan');
grid on;

% Extract Gate Settings from the configuration
Gate1_Position = 17.85; % us
Gate1_Width = 0.07; % us
Gate1_Threshold = 40.00; % %

Gate2_Position = 35.25; % us
Gate2_Width = 0.12; % us
Gate2_Threshold = 21.00; % %

Gate3_Position = 77.12; % us
Gate3_Width = 0.50; % us
Gate3_Threshold = 5.00; % %

% Add gates to the plot
hold on;
plot([Gate1_Position, Gate1_Position + Gate1_Width], [0, 0], 'r--', 'LineWidth', 2); % Gate 1
plot([Gate2_Position, Gate2_Position + Gate2_Width], [0, 0], 'g--', 'LineWidth', 2); % Gate 2
plot([Gate3_Position, Gate3_Position + Gate3_Width], [0, 0], 'b--', 'LineWidth', 2); % Gate 3
legend('A-scan Data', 'Gate 1', 'Gate 2', 'Gate 3');

% Display the adjusted plot
hold off;
