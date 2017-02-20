function PCA()

% To generate eigenfaces by using ORLTrain.mat
% Input Parameter: none

%load in face training images

load([pwd,'\result\loadin.mat'])

%------------------------------------------------
% resize the images to 50% of the original size
%------------------------------------------------

[r, c] = size(rawdata);

for i = 1 : c
    im = reshape(rawdata(:,i),320, 240); % 96 x 84
    rim = imresize(im, 0.07);
    dTrainPCA(:,i) = rim(:); 
    % rim(:) - quick way to reshape a matrix into a column vector 
    % without using reshape()  
end    

%-------------------------------------------------
% PCA Training
%-------------------------------------------------

A = dTrainPCA;

num_faces = size(A,2);

% Average face
avgface = ((sum(A') / num_faces))';

% Subtract average face from each individual face
for row = 1:num_faces
   A(:, row) = A(:, row) - avgface;
end

% Covariance Matrix
st = A*A';

% Eigenvalue Decomposition
[Vt, Dt]=eig(st);

% Resort the eigenvalues and eigenvectors (EigenFaces) in descending order
[junk, index] = sort(-diag(Dt));
eigenfaces = Vt(:, index);

d = diag(Dt);
eigenvalues = d(index);


%----------------------------------------------------

   
save([pwd,'\result\eigentrain.mat'],'eigenfaces','eigenvalues','avgface'); 

