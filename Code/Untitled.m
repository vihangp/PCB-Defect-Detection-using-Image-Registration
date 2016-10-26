I = imread('C:\Users\Skywalker\Desktop\BE project\Database\pcb1.jpg');
%J = imrotate(I,35,'bilinear');
figure(1);
imshow(I) 
%I = imread('cameraman.tif');
J = imread('C:\Users\Skywalker\Desktop\BE project\Database\pcb1_left.jpg');
figure(2);
imshow(J);
C = imfuse(I,J,'blend','Scaling','joint');
figure(3)
imshow(C);
imshowpair(I,J,'Scaling','joint');
[optimizer, metric]= imregconfig('multimodal')
tformEstimate = imregtform(J, I, 'affine', optimizer, metric);
moving_reg = imregister(J,I,'affine',optimizer,metric);
figure(4);
imshowpair(I,moving_reg,'Scaling','joint');
%imshowpair(I, moving_reg,'diff');