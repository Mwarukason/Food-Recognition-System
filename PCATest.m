function calc_PCAProjecttest(pc)

% To perform PCA Projection with ORLTest.mat
% Input Parameter: None

%load in face testing images

load([pwd,'\result\image.mat']);
% load the trained parameters: average face and Eigenfaces


load([pwd,'\result\eigentrain.mat'])

eigenfaces = eigenfaces(:,1:pc);

%-------------------------------------------------------------------------
% resize the test images to 50% of the original size
%-------------------------------------------------------------------------
[r, c] = size(img);

for i = 1 : c
    im = reshape(img,320, 240); % 173 x 250 
    rim = imresize(im, 0.07);
    dTrainPCA = rim(:); 
    % rim(:) - quick way to reshape a matrix into a column vector 
    % without using reshape()  
end    

sizea= size(rim);

%-------------------------------------------------------------------------
% PCA Projection
%-------------------------------------------------------------------------

A = dTrainPCA;
 
[void, no_user] = size(A);


for f = 1 : no_user
    
        im = A(:,f);
        im_norm = im - avgface(:);
        pcacoeftest(:, f) = eigenfaces' * im_norm;         
 end


save([pwd,'\result\testfeature.mat'],'pcacoeftest','sizea'); 

