
boxImage=imread(ffname);
boxImage=rgb2gray(boxImage);

figure;

imshow(boxImage);
title('Image of a Box');

%Read the target image containing in image


sceneImage = imread('classa.jpg');
sceneImage=rgb2gray(sceneImage);

figure;
imshow(sceneImage);
title('Image of a Cluttered Scene');


%Detect feature points in both images.


boxPoints = detectSURFFeatures(boxImage);
scenePoints = detectSURFFeatures(sceneImage);



%Visualize the strongest feature points found in the reference image.

figure;
imshow(boxImage);
title('100 Strongest Feature Points from Box Image');
hold on;
plot(selectStrongest(boxPoints, 100));


%Visualize the strongest feature points found in the target image.

figure;
imshow(sceneImage);
title('300 Strongest Feature Points from Scene Image');
hold on;
plot(selectStrongest(scenePoints, 300));

%Extract feature descriptors at the interest points in both images.

[boxFeatures, boxPoints] = extractFeatures(boxImage, boxPoints);
[sceneFeatures, scenePoints] = extractFeatures(sceneImage, scenePoints);

%Match the features using their descriptors.

boxPairs = matchFeatures(boxFeatures, sceneFeatures);
%Display putatively matched features.

matchedBoxPoints = boxPoints(boxPairs(:, 1), :);
matchedScenePoints = scenePoints(boxPairs(:, 2), :);
figure;
showMatchedFeatures(boxImage, sceneImage, matchedBoxPoints, ...
    matchedScenePoints, 'montage');
title('Putatively Matched Points (Including Outliers)');


[tform, inlierBoxPoints, inlierScenePoints] = ...
    estimateGeometricTransform(matchedBoxPoints, matchedScenePoints, 'affine');
%Display the matching point pairs with the outliers removed

figure;
showMatchedFeatures(boxImage, sceneImage, inlierBoxPoints, ...
    inlierScenePoints, 'montage');
title('Matched Points (Inliers Only)');


boxPolygon = [1, 1;...                           % top-left
        size(boxImage, 2), 1;...                 % top-right
        size(boxImage, 2), size(boxImage, 1);... % bottom-right
        1, size(boxImage, 1);...                 % bottom-left
        1, 1];                   % top-left again to close the polygon
   
    newBoxPolygon = transformPointsForward(tform, boxPolygon);
    
    
    figure;
imshow(sceneImage);
hold on;
line(newBoxPolygon(:, 1), newBoxPolygon(:, 2), 'Color', 'R');
title(ffname);

