R=1;
B0=1;
lat1=-58;
lat2=-50;
theta1=20;
theta2=70;



subplot(1,2,1)

axis equal
rectangle('Position', [0-R,0-R,2*R,2*R], 'Curvature', [1 1],'EdgeColor', '#D95319','FaceColor','#D95319','linewidth',2);
set(gca,'Xlim',[-R*1.25 R*5]);
set(gca,'Ylim',[-R*2    R*2]);



hold on
lat=lat1;
p0=[R*cos(lat*pi/180) 0 R*sin(lat*pi/180)];
p1=p0;

for i=1:150
    B=mag_field(p1,R,B0);
    vec=0.1*R*B/norm(B);
    p2=p1+vec;
%     line([p1(1),p2(1)],[p1(2),p2(2)],[p1(3),p2(3)]);
    if norm(p1)>=0.999*R
        line([p1(1),p2(1)],[p1(3),p2(3)],'Color','#0072BD');
    else
        break
    end
    hold on
    p1=p2;
end


hold on
lat=lat2;
p0=[R*cos(lat*pi/180) 0 R*sin(lat*pi/180)];
p1=p0;
for i=1:150
    B=mag_field(p1,R,B0);
    vec=0.1*R*B/norm(B);
    p2=p1+vec;
%     line([p1(1),p2(1)],[p1(2),p2(2)],[p1(3),p2(3)]);
    if norm(p1)>=0.999*R
        line([p1(1),p2(1)],[p1(3),p2(3)],'Color','#0072BD');
    else
        break
    end
    hold on
    p1=p2;
end




q=1.6e-19;
m=1.6725e-27;

q=1;
m=1;

V0=0.8e-2;
sita=theta1*pi/180;
Vy=V0*sin(sita);
Vz=V0*cos(sita);
Vx=0;
c=[3.1*R,0,0,Vx,Vy,Vz];%给定初始量
[t,y]=ode45('cjxxfun',100*[0:1e-2:12],c,[],q,m,R,B0);%解微分方程组
% plot3(y(:,1),y(:,2),y(:,3),'linewidth',2);%绘制三维粒子运动轨迹
plot(y(:,1),y(:,3),'linewidth',2,'color','#77AC30');%绘制三维粒子运动轨迹
xlabel('x');
% ylabel('y');
zlabel('z');

grid on;

xlabel('M-shell');
% ylabel('M-shell');
% 
set(gca,'FontSize',20);
title(['eq=' num2str(theta1) '°']);



subplot(1,2,2)

axis equal
rectangle('Position', [0-R,0-R,2*R,2*R], 'Curvature', [1 1],'EdgeColor', '#D95319','FaceColor','#D95319','linewidth',2);
set(gca,'Xlim',[-R*1.25 R*5]);
set(gca,'Ylim',[-R*2    R*2]);



hold on
lat=lat1;
p0=[R*cos(lat*pi/180) 0 R*sin(lat*pi/180)];
p1=p0;

for i=1:150
    B=mag_field(p1,R,B0);
    vec=0.1*R*B/norm(B);
    p2=p1+vec;
%     line([p1(1),p2(1)],[p1(2),p2(2)],[p1(3),p2(3)]);
    if norm(p1)>=0.999*R
        line([p1(1),p2(1)],[p1(3),p2(3)],'Color','#0072BD');
    else
        break
    end
    hold on
    p1=p2;
end


hold on
lat=lat2;
p0=[R*cos(lat*pi/180) 0 R*sin(lat*pi/180)];
p1=p0;
for i=1:150
    B=mag_field(p1,R,B0);
    vec=0.1*R*B/norm(B);
    p2=p1+vec;
%     line([p1(1),p2(1)],[p1(2),p2(2)],[p1(3),p2(3)]);
    if norm(p1)>=0.999*R
        line([p1(1),p2(1)],[p1(3),p2(3)],'Color','#0072BD');
    else
        break
    end
    hold on
    p1=p2;
end




q=1.6e-19;
m=1.6725e-27;

q=1;
m=1;

V0=0.8e-2;
sita=theta2*pi/180;
Vy=V0*sin(sita);
Vz=V0*cos(sita);
Vx=0;
c=[3.1*R,0,0,Vx,Vy,Vz];%给定初始量
[t,y]=ode45('cjxxfun',100*[0:1e-2:12],c,[],q,m,R,B0);%解微分方程组
% plot3(y(:,1),y(:,2),y(:,3),'linewidth',2);%绘制三维粒子运动轨迹
plot(y(:,1),y(:,3),'linewidth',2,'color','#77AC30');%绘制三维粒子运动轨迹
xlabel('x');
% ylabel('y');
zlabel('z');

grid on;

xlabel('M-shell');
% ylabel('M-shell');
% 
set(gca,'FontSize',20);
title(['eq=' num2str(theta2) '°']);
