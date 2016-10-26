img = imread('C:\Users\Skywalker\Desktop\BE project\pcb1.jpg');
rgbimg = repmat(img,[1 1 3]);
imshow(rgbimg);
[m,n]=size(img);
for i=1:m
  for j=1:n
    if(img(i,j,:)>100)
    rgbimg(i,j,:) = [100,69,96];
    end
  end
end
imshow(rgbimg);