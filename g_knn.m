% load -ascii class2d.ascii
load handwriting.data
trainX= handwriting(1:1000,3:end);
trainY= handwriting(1:1000,1);
% trainX= class2d(:,1:2);
% trainY= class2d(:,3);
fnum=1;
ks=15;
for k=ks
w=knntrain(trainX,trainY,k);
subplot(2,2,fnum);
%figure(fnum);
fnum=fnum+1;
plotall(trainX,trainY,@knn,200,w,k);
title(sprintf('k-NN,k=%d',k));
end;


