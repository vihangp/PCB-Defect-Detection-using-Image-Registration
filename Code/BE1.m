clear all
a=imread('pcb1.jpg');
a1=255-a;
img=input('enter the image to be checked')
b=imread(img);
b2=rgb2gray(b);
b1=255-b2;
[m n]=size(b1);
t=input('enter the threshold parameter:')
inp=input('enter the type of error to be checked from PCB 1-open cuts, 2-missing holes ,3-holes , 4-short circuit');
for inp=1:4;
switch(inp)
case 1
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
subplot(3,1,1),imshow(a1),title('original image')
subplot (3,1,2),imshow(b1),title('negative image')
subplot (3,1,3),imshow(sub),title('subtracted image')
xlabel(sprintf('threshold value is %g',t))
case 2
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
subplot(3,1,1),imshow(a1),title('original image')
subplot (3,1,2),imshow(b1),title('negative image')
subplot (3,1,3),imshow(d),title('defected PCB image with missing holes')
xlabel(sprintf('threshold value is %g',t))
 case 3
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
subplot(3,1,1),imshow(a1),title('original image')
subplot (3,1,2),imshow(b1),title('negative image')
subplot (3,1,3),imshow(sub),title('subtracted image')
xlabel(sprintf('threshold value is %g',t))
case 4
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
subplot(3,1,1),imshow(a1),title('original image')
subplot (3,1,2),imshow(b1),title('negative image')
subplot (3,1,3),imshow(d),title('defected PCB image with missing holes')
xlabel(sprintf('threshold value is %g',t))
end
end
    