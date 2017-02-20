function [value class] = kNN(Class1, Class2, Class3,newSample, k)

numClass1 = size(Class1,1);
numClass2 = size(Class2,1);
numClass3 = size(Class3,1);
totalSamples = numClass1+numClass2+numClass3;
combinedSamples = [Class1;Class2;Class3];
trueClass = [zeros(numClass1,1)+1;zeros(numClass2,1)+2;zeros(numClass3,1)+3];
testMatrix = repmat(newSample,totalSamples,1);
absDiff = abs(combinedSamples-testMatrix);
absDiff = absDiff.^2;
dist = sum(absDiff,2);
[Y,I] = sort(dist);
neighborsInd = I(1:k);
neighbors = trueClass(neighborsInd);
class1=find(neighbors == 1);
class2=find(neighbors == 2);
class3=find(neighbors == 3);
joint = [size(class1,1);size(class2,1);size(class3,1)];
[value class] = max(joint);