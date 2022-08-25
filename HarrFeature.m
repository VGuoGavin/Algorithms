%%HarrFeature Extracte 
clear all
close all
clc

IMAGE_WIDTH = 24;
IMAGE_HEIGHT = 24;
image = randi([0,255],IMAGE_WIDTH,IMAGE_HEIGHT); %generate a  24*24 randam image data
filter_size = [[1,2],[1,3],[2,1],[3,1],[2,2]];  %5 kinds of filter

initial_filter_wide = filter_size(1,2);     % first filter width
initial_filter_height = filter_size(1,1);   % first filter height
feature = [];   % changable vertor for storing feature datas
counter = 1;    % feature vector index
filter_wide = 0;    % actual extending filter model size
filter_height = 0;  % actual extending filter model size
%% for filter model 1
for x=1:1:IMAGE_WIDTH   % traverse all vertical numbers 
    for y=1:1:IMAGE_HEIGHT  % traverse all hersional numbers 
        for filter_wide = initial_filter_wide: initial_filter_wide: 24-x + 1    % changing filter size
            for filter_height = initial_filter_height: initial_filter_height: 24-y+1    % changing filter size
                white_sum = 0;  % store sum white part num
                black_sum = 0;  % store sum black part num
                for i=x: 1 : x + filter_wide-1  % traverse whole filter metrix 
                    for j=y: 1 : y + filter_height-1
                        if(i <= x + filter_wide/2)
                            white_sum = image(i,j)+ white_sum;  
                        else
                            black_sum = black_sum + image(i,j);
                        end
                    end
                end
                feature(1,counter) = white_sum - black_sum; % store features
                counter = counter+1;
            end
        end
    end
end

%% for filter model 2
%% for filter model 3
%% for filter model 4
%% for filter model 5
imshow(image);


