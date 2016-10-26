clear all
a=imread('C:\Users\Skywalker\Desktop\BE project\Database\pcb1.jpg');
a1=255-a;
a1=rgb2gray(a1);
img=input('enter the image to be checked')
b=imread(img);
b2=rgb2gray(b);
b1=255-b2;
[m n]=size(b1);
t=input('enter the threshold parameter:')
inp=input('enter the type of error to be checked from PCB 1-open cuts, 2-missing holes ,3-pinholes , 4-short circuit');
switch(inp)
case 1 %open circuit
for i=1:m
     for j=1:n
         if b1(i,j)<t
             b1(i,j)=0;
         else b1(i,j)=255;
         end
     end
end
 for i=1:m
     for j=1:n
         if a1(i,j)<t
             a1(i,j)=0;
         else a1(i,j)=255;
         end
     end
 end
sub=a1-b1;
rgbimg = repmat(sub,[1 1 3]);
[m,n]=size(sub);
asd=[];
for i=1:m
  for j=1:n
    if(sub(i,j,:)>100)
    rgbimg(i,j,:) = [192,0,0];
    asd=[asd; i j];
    end
  end
end
subplot(3,1,1),imshow(a1),title('original image')
subplot (3,1,2),imshow(b1),title('negative image')
subplot (3,1,3),imshow(rgbimg),title('subtracted image')
xlabel(sprintf('threshold value is %g',t))
case 2 % missing pinhole
    for i=1:m
     for j=1:n
         if b1(i,j)<t
             b1(i,j)=0;
         else b1(i,j)=255;
         end
     end
 end
%sub=b1;
sub=b1-a1;
d=sub-a1;
rgbimg = repmat(d,[1 1 3]);
[m,n]=size(d);
asd=[];
for i=1:m
  for j=1:n
    if(d(i,j,:)>100)
    rgbimg(i,j,:) = [100,100,255];
    asd=[asd; i j];
    end
  end
end
subplot(3,1,1),imshow(a1),title('original image')
subplot (3,1,2),imshow(b1),title('negative image')
subplot (3,1,3),imshow(rgbimg),title('defected PCB image with missing holes')
xlabel(sprintf('threshold value is %g',t))
 case 3 % pinholes
        for i=1:m
     for j=1:n
         if b1(i,j)<t
             b1(i,j)=0;
         else b1(i,j)=255;
         end
     end
end
 for i=1:m
     for j=1:n
         if a1(i,j)<t
             a1(i,j)=0;
         else a1(i,j)=255;
         end
     end
 end
sub=a1-b1;
rgbimg = repmat(sub,[1 1 3]);
[m,n]=size(sub);
asd=[];
for i=1:m
  for j=1:n
    if(sub(i,j,:)>100)
    rgbimg(i,j,:) = [175,185,190];
    asd=[asd; i j];
    end
  end
end
subplot(3,1,1),imshow(a1),title('original image')
subplot (3,1,2),imshow(b1),title('negative image')
subplot (3,1,3),imshow(rgbimg),title('subtracted image')
xlabel(sprintf('threshold value is %g',t))
case 4 %short ckt
    for i=1:m
     for j=1:n
         if b1(i,j)<t
             b1(i,j)=0;
         else b1(i,j)=255;
         end
     end
    end
%sub=b1;
sub=b1-a1;
d=sub-a1;
rgbimg = repmat(d,[1 1 3]);
[m,n]=size(d);
asd=[];
for i=1:m
  for j=1:n
    if(d(i,j,:)>100)
    rgbimg(i,j,:) = [200,200,200];
    asd=[asd; i j];
    end
  end
end
subplot(3,1,1),imshow(a1),title('original image')
subplot (3,1,2),imshow(b1),title('negative image')
subplot (3,1,3),imshow(rgbimg),title('defected PCB image with missing holes')
xlabel(sprintf('threshold value is %g',t))
end    