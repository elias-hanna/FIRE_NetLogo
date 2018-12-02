%% Clear
close all;
clear all;
clc;
%% Main

time = 1:200;

files = dir("wwr_wcr/*.*");

UG = zeros(1, (length(files)-2)/3);
z = 0;
k = 1;

for i=3:length(files)
    tmp = csvread("wwr_wcr/" + files(i).name);
    z = z + tmp(end);
    if mod(i - 2, 3) == 0
        UG(k) = z/3;
        z = 0;
        k = k + 1;
    end
end
X = [ 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1 1 1 1 1 1 1 1 1 2.5 2.5 2.5 2.5 2.5 2.5 2.5 2.5 2.5 2 2 2 2 2 2 2 2 2 3.5 3.5 3.5 3.5 3.5 3.5 3.5 3.5 3.5 3 3 3 3 3 3 3 3 3 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4 4 4 4 4 4 4 4 4];
Y = [ 0.5 1.5 1 2.5 2 3.5 3 4.5 4 0.5 1.5 1 2.5 2 3.5 3 4.5 4 0.5 1.5 1 2.5 2 3.5 3 4.5 4 0.5 1.5 1 2.5 2 3.5 3 4.5 4 0.5 1.5 1 2.5 2 3.5 3 4.5 4 0.5 1.5 1 2.5 2 3.5 3 4.5 4 0.5 1.5 1 2.5 2 3.5 3 4.5 4 0.5 1.5 1 2.5 2 3.5 3 4.5 4 0.5 1.5 1 2.5 2 3.5 3 4.5 4];
    
stem3(X, Y, UG);

% xlin = linspace(min(X),max(X),33);
% ylin = linspace(min(Y),max(Y),33);
% [x,y] = meshgrid(xlin,ylin);
% f = scatteredInterpolant(X',Y',UG');
% z = f(x, y);
% 
% figure;
% mesh(x,y,z);
% axis tight; hold on;
% plot3(X, Y, UG, '.', 'MarkerSize', 15)

dt = delaunayTriangulation(X',Y') ;
tri = dt.ConnectivityList ;
Xi = dt.Points(:,1) ; Yi = dt.Points(:,2) ;
F = scatteredInterpolant(X',Y',UG');
Zi = F(Xi,Yi) ;
trisurf(tri,Xi,Yi,Zi) 
shading interp
xlabel("Ww"); ylabel("Wc"); zlabel("UG");
title("Influence des poids Ww et Wc sur l'UG");