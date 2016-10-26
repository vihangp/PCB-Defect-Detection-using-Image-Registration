clear all
a=imread('pcb1.jpg');
a1=255-a;
b=imread('pcb1_openckt.jpg');
b2=rgb2gray(b);
b1=255-b2;
[m n]=size(b1);
t=input('enter the threshold parameter:')
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
subplot(2,2,1),imshow(a1),title('original image')
subplot (2,2,2),imshow(b1),title('negative image')
subplot (2,2,3),imshow(d),title('subtraction')
subplot (2,2,4),imshow(sub),title('subtracted image')
xlabel(sprintf('threshold value is %g',t))
