clear all
% a=imread('C:\Users\Skywalker\Desktop\BE project\Database\pcb1.jpg');
%a1=255-a;
%a1=rgb2gray(a1);
% img=input('enter the image to be checked')
% b=imread(img);
%b2=rgb2gray(b);

a=imread('C:\Users\Skywalker\Desktop\BE project\Database\pcb1.jpg');
a1=255-a;
a1=rgb2gray(a1);
img=input('enter the image to be checked')
b=imread(img);

%b2=imread('C:\Users\Skywalker\Desktop\BE project\Database\pcb1_openckt.jpg');
b1=rgb2gray(b);
b1=255-b1;
[m n]=size(a1);

[m n]=size(b1);
b2=b1;
a2=a1;
for i=1:m
     for j=1:n
         if b2(i,j)>0
             b2(i,j)=255;
         else b2(i,j)=0;
         end
     end
end
 for i=1:m
     for j=1:n
         if a2(i,j)>0
             a2(i,j)=255;
         else a2(i,j)=0;
         end
     end
 end
 figure;
 imshow(a2);
 figure;
 imshow(b2);
 Defective_black=0;
Defective_white=0;
 for i=1:m
      for j=1:n
         if b2(i,j)==0
         Defective_black=Defective_black+1;    
         else 
             Defective_white=Defective_white+1;
         end
     end
 end
Original_black=0;
Original_white=0;
 for i=1:m
     for j=1:n
         if a2(i,j)==0
             Original_black=Original_black+1;
         else 
             Original_white=Original_white+1;
         end
     end
 end
disp('Defective_white')
disp(Defective_white)
disp('Original_white')
disp(Original_white)
disp('Defective_black')
disp(Defective_black)
disp('Original_black')
disp(Original_black)
if (Defective_white<Original_white)&&(Defective_black>Original_black)
disp('the defect is either with missing hole or short ckt');
inp=2;
else
 disp('the defect is either with Extra pin hole or open ckt');   
inp=1;
end

[m n]=size(b2);

t=input('enter the threshold parameter:')
%inp=input('enter the type of error to be checked from PCB 1-open cuts or Pinholes , 2-missing holes or short circuit');
switch(inp)
case 1 %Open Cuts or Pinholes
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
asd1=[];asd2=[];
cnt_val=[];cnt1=0;iii=1;tru_val=0; fnd_val=0;
  xx=0;nw=0;jj=1;
for ii=1:length(asd)
    
   
    jj=jj+xx;
   
    if(jj<=length(asd))
    temp=asd(jj);
    temp
    xx=0;
    %if(asd(ii)~=temp)
   fnd_val=(strmatch(temp,asd(:,:)));
   fnd_val
   if(length(fnd_val)>1)
   tru_val=fnd_val(1);
   xx=length(fnd_val);
   xx
    else
        tru_val=fnd_val;
        xx=1;
   end
   %if(strmatch(asd(tru_val),asd1(:,:))==0)
       cnt_val=[cnt_val; xx];
       asd1=[asd1 asd(sum(cnt_val))];     
    end
%   nw=xx;
%   nw

end
defect_val=[];
% for i=1:length(asd)
%     rw=asd(i,1);
%     cl=asd(i,2);
%     defect_val=[defect_val; rgbimg(rw,cl)];
% end
      % tru_val=fnd_val(1);
        %if(strmatch(asd(tru_val),asd1(:,:))==0)
        %asd1=[asd1; asd(tru_val) ] ;
       nw_cnt=0;nw_mat=[];
       for ii=1:length(cnt_val)-1
           nw_cnt=0;
           if (cnt_val(ii+1)==cnt_val(ii)&& (cnt_val(ii)==1))
               nw_cnt=nw_cnt+1;
               nw_mat=[nw_mat; nw_cnt];
           end
       end
           if(nw_mat~=0)
               disp('Defective PCB with open circuit');
               
           else
               disp('Defective PCB with extra pinholes');
               
           end
subplot(3,1,1),imshow(a1),title('original image')
subplot (3,1,2),imshow(b1),title('negative image')
subplot (3,1,3),imshow(rgbimg),title('subtracted image')
xlabel(sprintf('threshold value is %g',t))
case 2 % Short Ckt or Missing holes
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
% asd1=[];
% cnt=0;
% for ii=1:length(asd)
%     temp=asd(1,1);
%     if(asd(ii,1)~=temp)
%         asd1=asd;
%         cnt=cnt+1;
%     end
% end
%     if(cnt>1)
%         disp('it is opencut');
%     else
%         disp('it is pinhole');
%     end
subplot(3,1,1),imshow(a1),title('original image')
subplot (3,1,2),imshow(b1),title('negative image')
subplot (3,1,3),imshow(rgbimg),title('defected PCB image with missing holes')
xlabel(sprintf('threshold value is %g',t))
end
%  case 3 % pinholes
%         for i=1:m
%      for j=1:n
%          if b1(i,j)<t
%              b1(i,j)=0;
%          else b1(i,j)=255;
%          end
%      end
% end
%  for i=1:m
%      for j=1:n
%          if a1(i,j)<t
%              a1(i,j)=0;
%          else a1(i,j)=255;
%          end
%      end
%  end
% sub=a1-b1;
% rgbimg = repmat(sub,[1 1 3]);
% [m,n]=size(sub);
% asd=[];
% for i=1:m
%   for j=1:n
%     if(sub(i,j,:)>100)
%     rgbimg(i,j,:) = [0,185,0];
%     asd=[asd; i j];
%     end
%   end
% end
% asd1=[];asd2=[];
% cnt=0;cnt1=0;iii=1;
% for iii=1:10
% for ii=1+cnt1:length(asd)
%     jj=1;
%     %cnt1=0;
%     cnt=0;
%    % asd1=[];
%     temp=asd(jj+cnt1,1);
%     if(asd(ii,1)~=temp)
%         
%         
%         asd1=[asd1; ii ] ;
%         cnt=cnt+1;
%         
%     
%          %cnt1=cnt;
%          
% %         asd1=[];
% %         
%         %cnt=cnt+1;
%     end
%     cnt1
%     
%    
%     cnt=0; 
% end
% cnt1=cnt;
% asd2(iii)= length(asd1);
% asd1=[];
% end
% % asd2=[];
% % for i=1:length(asd)
% %     if (asd~=asd1)
% %         asd2=asd;
% %     end
% % end
%     if(cnt>1)
%         disp('it is opencut');
%     else
%         disp('it is pinhole');
%     end
% 
% subplot(3,1,1),imshow(a1),title('original image')
% subplot (3,1,2),imshow(b1),title('negative image')
% subplot (3,1,3),imshow(rgbimg),title('subtracted image')
% xlabel(sprintf('threshold value is %g',t))
% case 4 %short ckt
%     for i=1:m
%      for j=1:n
%          if b1(i,j)<t
%              b1(i,j)=0;
%          else b1(i,j)=255;
%          end
%      end
%     end
% %sub=b1;
% sub=b1-a1;
% d=sub-a1;
% rgbimg = repmat(d,[1 1 3]);
% [m,n]=size(d);
% asd=[];
% for i=1:m
%   for j=1:n
%     if(d(i,j,:)>100)
%     rgbimg(i,j,:) = [200,200,200];
%     asd=[asd; i j];
%     end
%   end
% end
% end
% subplot(3,1,1),imshow(a1),title('original image')
% subplot (3,1,2),imshow(b1),title('negative image')
% subplot (3,1,3),imshow(rgbimg),title('defected PCB image with missing holes')
% xlabel(sprintf('threshold value is %g',t))    