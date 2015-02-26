function Y=knn(testX,w,k)
[testn,d]=size(testX);
pts=reshape(w,[numel(w)/(d+1) d+1]);
trainY=pts(:,1);
trainX=pts(:,2:end);
[trainn, d]=size(trainX);
D=repmat(permute(trainX,[1 3 2]),[1 testn 1])- repmat(permute(testX,[3 1 2]),[trainn 1 1]);
D=sum(D.*D,3);
[D, P]=sort(D);%slow if many pts,but okay here
P=P(1:k,:);
Y=reshape(trainY(reshape(P,k*testn,1)),k,testn)';
Y=sum(Y,2)/k;