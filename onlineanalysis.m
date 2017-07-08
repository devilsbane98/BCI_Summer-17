ppt

clc

load('class.mat');

while(1)
    
    sys=system('C:\Python27\python.exe "C:\Users\Asus\Dropbox\BCI Summer 17\do not touch\testepoc.PY"');
    a=load('data.csv');
    
    filtx=filter(bp1,a);
    modx=filtx(65:160,:);
    
    feat=featuresig(modx);
    
    s=char(predict(colorclass,feat));
    disp(s);

    if strcmp(s,'mental')
        x=3;
    elseif strcmp(s,'cube')
        x=1;
    elseif strcmp(s,'odd')
        x=4;
    else
        x=2;
    end
    
    ppt2
    clear s c c1 feat filtx a modx xmod;
end