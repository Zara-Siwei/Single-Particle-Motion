R=1;
B0=-1;  %与地磁场相反  设为负值
lat1=58;
lat2=50;
theta1=-20;

%% 3D 
space_color = 'black';
npanels = 72;   
alpha   = 1; 
image_file = 'j.jpg';
erad = R; 
prad = R; 
figure('Color', space_color);
hold on;
set(gca, 'NextPlot','add', 'Visible','off');
axis equal;
axis auto;
axis vis3d;
[x, y, z] = ellipsoid(0, 0, 0, erad, erad, prad, npanels);
globe = surf(x, y, -z, 'FaceColor', 'none', 'EdgeColor', 0.5*[1 1 1]);
cdata = imread(image_file);
set(globe, 'FaceColor', 'texturemap', 'CData', cdata, 'FaceAlpha', alpha, 'EdgeColor', 'none');
m = 12;
n = 30;
view(m,n);
hold on;




axis equal
% rectangle('Position', [0-R,0-R,2*R,2*R], 'Curvature', [1 1],'EdgeColor', '#D95319','FaceColor','#D95319','linewidth',2);
set(gca,'Xlim',[-R*5 R*5]);
set(gca,'Ylim',[-R*5    R*5]);

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
        line([p1(1),p2(1)],[p1(2),p2(2)],[p1(3),p2(3)],'Color','#4DBEEE','linestyle','--');
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
        line([p1(1),p2(1)],[p1(2),p2(2)],[p1(3),p2(3)],'Color','#4DBEEE','linestyle','--');
    else
        break
    end
    hold on
    p1=p2;
end

hold on
xlabel('x');
ylabel('y');
zlabel('z');



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
[t,y]=ode45('cjxxfun',100*[0:1e-2:480],c,[],q,m,R,B0);%解微分方程组
% plot3(y(:,1),y(:,2),y(:,3),'linewidth',2);%绘制三维粒子运动轨迹



%% 保存为序列帧

p_past=[y(1,1),y(1,2),y(1,3)];
for i=1:100:length(y(:,1))
[xx, yy, zz] = ellipsoid(3.1*R*cos(i/240*2*pi/500), 3.1*R*sin(i/240*2*pi/500), 0, 0.1*erad, 0.1*erad, 0.1*prad, npanels);
globe1 = surf(xx, yy, -zz, 'FaceColor', 'none', 'EdgeColor', 0.5*[1 1 1]);
cdata = imread('m.jpg');
set(globe1, 'FaceColor', 'texturemap', 'CData', cdata, 'FaceAlpha', alpha, 'EdgeColor', 'none');
    
    
    
hh=plot3(y(i,1),y(i,2),y(i,3),'o-','MarkerFaceColor','#A2142F','color','#A2142F');
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
hold on
% line([p_past(1),y(i,1)],[p_past(2),y(i,2)],[p_past(3),y(i,3)],'color','#D95319');
% hold on
% pause(0.001)
%隔100张保存一次

%   c_eval('saveas(gcf,''D:\table\tupian\aaa?'',''png'');',(i-1)/100);
pause(0.02);

delete(hh)
delete(globe1)
p_past=[y(i,1),y(i,2),y(i,3)];

end



%% 仅仅看一下轨迹或者动态


% plot3(y(:,1),y(:,2),y(:,3),'linewidth',2,'color','#A2142F');%绘制三维粒子运动轨迹
% comet3(y(:,1),y(:,2),y(:,3),0.5);