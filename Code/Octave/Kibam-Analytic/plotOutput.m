%% Import data from text file.
% Script for importing data from the following text file:
%
%    /Users/leomr85/Dropbox/University/PPGEAS/Project/BatteryProject/Code/Octave/Kibam-Analytic/kibam-output.txt
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2016/03/02 11:07:28

hold off;

%% Initialize variables.
filename1 = '/Users/leomr85/Dropbox/University/PPGEAS/Project/BatteryProject/Code/Octave/Kibam-Analytic/kibam-output-01.txt';
filename2 = '/Users/leomr85/Dropbox/University/PPGEAS/Project/BatteryProject/Code/Octave/Kibam-Analytic/kibam-output-02.txt';
delimiter = ',';

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID1 = fopen(filename1,'r');
fileID2 = fopen(filename2,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray1 = textscan(fileID1, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
dataArray2 = textscan(fileID2, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID1);
fclose(fileID2);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
time1 = dataArray1{:, 1};
available1 = dataArray1{:, 2};
bound1 = dataArray1{:, 3};
unavailable1 = dataArray1{:, 4};
soc1 = dataArray1{:, 5};

time2 = dataArray2{:, 1};
available2 = dataArray2{:, 2};
bound2 = dataArray2{:, 3};
unavailable2 = dataArray2{:, 4};
soc2 = dataArray2{:, 5};

%% Plot #1
% plot(time,available,'b',time,bound,'r',time,unavailable,'g');
% grid on;
% size = legend('Available Charge','Bound Charge','Unavailable Charge');
% set(size,'FontSize',12);
% xlabel('Time (h)');
% ylabel('Capacity (As)');

%% Plot #2
title1 = 'Fast Discharge Curve';
title2 = 'Slow Discharge Curve';
fontsize = 13;
fontname = 'Times';

xlimit = 2;

ax1 = subplot(3,2,1);
plot(time1,available1,'b');
ax1.XLim = [0,xlimit];
% ax1.XTick = [0;1;5];
ax1.YLim = [1000,2500];
title(title1, 'FontSize', 13, 'FontName', 'Times');
ylabel('Available Charge (As)', 'FontSize', fontsize, 'FontName', fontname);
grid on;
set(gca, 'FontSize', 12, 'Box', 'on', 'FontName', 'Times');

ax2 = subplot(3,2,3);
plot(time1,bound1,'r');
ax2.XLim = [0,xlimit];
% ax1.XTick = [0;1;5];
ax2.YLim = [300,600];
title(title1, 'FontSize', 13, 'FontName', 'Times');
ylabel('Bound Charge (As)', 'FontSize', fontsize, 'FontName', fontname);
grid on;
set(gca, 'FontSize', 12, 'Box', 'on', 'FontName', 'Times');

ax3 = subplot(3,2,5);
plot(time1,unavailable1,'k');
ax3.XLim = [0,xlimit];
% ax1.XTick = [0;1;5];
ax3.YLim = [0,3];
title(title1, 'FontSize', 13, 'FontName', 'Times');
ylabel('Unavailable Charge (As)', 'FontSize', fontsize, 'FontName', fontname);
grid on;
set(gca, 'FontSize', 12, 'Box', 'on', 'FontName', 'Times');

xlabel('Time (h)', 'FontSize', fontsize, 'FontName', fontname);

ax4 = subplot(3,2,2);
plot(time2,available2,'b');
ax4.XLim = [0,xlimit];
% ax1.XTick = [0;1;5];
ax4.YLim = [1000,2500];
title(title2, 'FontSize', 13, 'FontName', 'Times');
ylabel('Available Charge (As)', 'FontSize', fontsize, 'FontName', fontname);
grid on;
set(gca, 'FontSize', 12, 'Box', 'on', 'FontName', 'Times');

ax5 = subplot(3,2,4);
plot(time2,bound2,'r');
ax5.XLim = [0,xlimit];
% ax1.XTick = [0;1;5];
ax5.YLim = [300,600];
title(title2, 'FontSize', 13, 'FontName', 'Times');
ylabel('Bound Charge (As)', 'FontSize', fontsize, 'FontName', fontname);
grid on;
set(gca, 'FontSize', 12, 'Box', 'on', 'FontName', 'Times');

ax6 = subplot(3,2,6);
plot(time2,unavailable2,'k');
ax6.XLim = [0,xlimit];
% ax1.XTick = [0;1;5];
ax6.YLim = [0,3];
title(title2, 'FontSize', 13, 'FontName', 'Times');
ylabel('Unavailable Charge (As)', 'FontSize', fontsize, 'FontName', fontname);
grid on;

xlabel('Time (h)', 'FontSize', fontsize, 'FontName', fontname);
set(gca, 'FontSize', 12, 'Box', 'on', 'FontName', 'Times');

%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans;