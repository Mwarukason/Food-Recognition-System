function loadin()
folder= dir([pwd,'\trainn\*.jpg']);
numbers=length(folder);
for i=1:numbers
    pic=imread([pwd,strcat('\trainn\',folder(i).name)]);
    pic=rgb2gray(pic);
    pic=im2double(pic);
    rawdata(:,i)=pic(:);
end

save([pwd,'\result\loadin.mat'],'rawdata');

end