clc;
close all;
clear all;
     %input image
     [fname path]=uigetfile('*.*','Input  Image-1');
     fname=strcat(path,fname);
     im1=imread(fname);
     %im1=imread('C:\Program Files\MATLAB\R2017a\toolbox\images\imdemos\1.jpg');
     im1=rgb2gray(im1);

     %key image
     %k=imread('C:\Program Files\MATLAB\R2017a\toolbox\images\imdemos\2.jpg');
     [fname path]=uigetfile('*.*','Input the key image');
     fname=strcat(path,fname);
     k=imread(fname);
     k=rgb2gray(k);
     %secret image 1
     %s1 =imread('C:\Program Files\MATLAB\R2017a\toolbox\images\imdemos\3.jpg');
     [fname path]=uigetfile('*.*','Input the Secret image 1');
     fname=strcat(path,fname);
     s1=imread(fname); 
     s1=rgb2gray(s1);
     c1 = bitxor(k,s1);
     h11=bitxor(c1,im1);
     h12=bitxor(s1,h11);

    %second level input image
     im2 = [h11,h12];

     %sec2 =imread('C:\Program Files\MATLAB\R2017a\toolbox\images\imdemos\4.jpg');
     [fname path]=uigetfile('*.*','Input the Secret image 2');
     fname=strcat(path,fname);
     sec2=imread(fname); 
     sec2=rgb2gray(sec2);
     s2 = imresize(sec2,[160,320]);

     k2 = imresize(k,[160,320]);
     c2 = bitxor(k2,s2);

h21=bitxor(c2,im2);
     h22=bitxor(s2,h21);

%Third level input image
     im3 = [h21,h22];

     %sec3 =imread('C:\Program Files\MATLAB\R2017a\toolbox\images\imdemos\5.jpg');
     [fname path]=uigetfile('*.*','Input the Secret image 3');
     fname=strcat(path,fname);
     sec3=imread(fname); 
     sec3=rgb2gray(sec3);
     s3 = imresize(sec3,[160,640]);

     k3 = imresize(k,[160,640]);
c3 = bitxor(k3,s3);

     h31=bitxor(c3,im3);
h32=bitxor(s3,h31);
figure(1), imshow(h31);
figure(2), imshow(h32);


     % Decryption Process

     %Third Level Secret image
     sec3 = bitxor(h31,h32);
     secret3 = imresize(sec3,[160,640]);
figure(3), imshow(secret3);

     key3 = imresize(k,[160,640]);
     com3=bitxor(sec3,key3);
     image3=bitxor(com3,h31);

     share21 = image3(1:160,1:320,:);figure(4);imshow(share21);
     share22 = image3(1:160,321:640,:);figure(5);imshow(share22);

     %second level secret image
     sec2=bitxor(share21,share22);
     secret2 = imresize(sec2,[160,320]);
figure(6), imshow(secret2);

     key2 = imresize(k,[160,320]);
     com2=bitxor(sec2,key2);
     image2=bitxor(com2,h21);

     share11 = image2(1:160,1:160,:);figure(7);imshow(share11);
     share12 = image2(1:160,161:320,:);figure(8);imshow(share12);

     % first level secret image
      sec1=bitxor(share11,share12);
figure(9), imshow(sec1);

      com1=bitxor(sec1,k);

      image1=bitxor(com1,share11);
figure(10), imshow(image1);

