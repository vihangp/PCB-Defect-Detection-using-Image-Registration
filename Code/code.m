clc
clear all
close all
a=imread('pcb_defective.jpg');
n1=imcomplement(a)
imshow(n1);