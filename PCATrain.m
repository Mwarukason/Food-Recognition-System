function PCATrain(pc)

% To perform PCA Projection with ORLTest.mat
% Input Parameter: None

%load in face testing images


% load the trained parameters: average face and Eigenfaces
load([pwd,'\result\eigentrain.mat'])
load([pwd,'\result\loadin.mat'])

eigenfaces = eigenfaces(:,1:pc);

%-------------------------------------------------------------------------
% resize the test images to 50% of the original size
%-------------------------------------------------------------------------
[r, c] = size(rawdata);

for i = 1 : c
    im = reshape(rawdata(:,i),320, 240); % 96 x 84
    rim = imresize(im, 0.07);
    dTrainPCA(:,i) = rim(:); 
    % rim(:) - quick way to reshape a matrix into a column vector 
    % without using reshape()  
end    

sizea= size(rim);

%-------------------------------------------------------------------------
% PCA Projection
%-------------------------------------------------------------------------

A = dTrainPCA;
 
[void, number] = size(A);


for f = 1 : number
    
        im = A(:,f);
        im_norm = im - avgface(:);
        pcacoef(:, f) = eigenfaces' * im_norm;         
 end


save([pwd,'\result\training.mat'],'pcacoef','sizea'); 

