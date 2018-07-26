cam=ipcam('http://192.168.43.1:8080/videofeed');
preview(cam);

for n=1:1
    
c=snapshot(cam);

figure,imshow(c);
date =datetime('now');
m=datenum(date);
name=strcat('AUNT #.',num2str(m));

base = sprintf(' --%d',n);
total = strcat(name,base);
baseName = strcat(total,'.jpg');

path = cd;
gg = strcat(path,'\new');

fullfilename = fullfile(gg,baseName);
imwrite(c,fullfilename);

end

