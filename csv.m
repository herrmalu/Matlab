fid = fopen('TEST1_58_1.csv', 'rt');% split: ','


C = textscan(fid, '%s', 'HeaderLines', 1, 'CollectOutput', false,'Delimiter', '\n');
fclose(fid);

%% Get dyn-data
content = C{1,1};

l = length(content);

% TEST
% N = 100000;
% if l > N
%     l = N;
% end

t = zeros(l,1);
 
x = zeros(l,1);
y = zeros(l,1);
z = zeros(l,1);


%%
for i = 1:l 

    line = regexp(content{i},',','split');

    column = 1;

    t(i) = str2double(line(column)); column = column+1; %1

    fx(i) = str2double(line(column)); column = column+1; %
    fy(i) = str2double(line(column)); column = column+1; %
    fz(i) = str2double(line(column)); column = column+1; %

    gx(i) = str2double(line(column)); column = column+1; %
    gy(i) = str2double(line(column)); column = column+1; %
    gz(i) = str2double(line(column)); column = column+1; %
    
    
end

%% 
figure(1); clf;
 
subplot(321);
plot(fx, 'r');
legend('acc x');
 
subplot(323);
plot(fy, 'g');
legend('acc y');
 
subplot(325);
plot(fz, 'b');
legend('acc z');

subplot(322);
plot(gx, 'r');
legend('gyro x');

subplot(324);
plot(gy, 'g');
legend('gyro y');

subplot(326);
plot(gz,'b');
legend('gyro z');
