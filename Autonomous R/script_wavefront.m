clc;
%clear all;
close all;

load('map.mat');

tic,[value_map, trajectory] = wavefront(map, [30,20], [660,780]),toc;

[r,c] = size(value_map);

%show the trajectory vector
trajectory;

%2D potential map
figure,
imagesc(value_map);
colorbar

%Show the map as an image with different potentials in 3D
figure,
%Create a surface plot for the potential matrix
surf([1:c], [1:r], value_map);
hold on
imagesc(value_map);
colorbar
title('Potential Map');

%Display trajectory map
colormap=[1 1 1; 0 0 0; 1 0 0; 0 1 0; 0 0 1];
map_temp = map;
for i=1:size(trajectory,1)
    map_temp(trajectory(i,1), trajectory(i,2)) = 5;
end
figure,
%imagesc(map_temp);
imshow(uint8(map_temp), colormap);