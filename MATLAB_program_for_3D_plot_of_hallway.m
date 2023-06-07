n = 0;
s = serialport("COM3", 115200);
lists = [];
a = length(lists);
count = 0;
while n<256
    x = readline(s);
    lists(end+1) = x;
    n = n+1;
    if mod(n,32) == 0 && n > 0
        count = count + 1;
        disp("Scan complete, pausing")
        pause(15);
        disp("Ready");
    end
    if count == 8
        break
    end
end

x = [];
y = [];
z = [];
count2 = 1;
xlen = length(x);
theta = 11.25;
for i=1:256
    tempy = lists(1,i);
    x(end+1) = count2;
    if mod(xlen,32) == 0 && xlen > 0
        count2 = count2 + 1;
    end
    y(end+1) = tempy*cos(theta);
    z(end+1) = tempy*sin(theta);
    theta = theta + 11.25;
end

    
plot3(x,y,z);