function hist=histogram(imD)
    %im = imread(imagen);   
    %imD = double(imagen);
    [f,c,rgb]=size(imD);
    hist=zeros(256,1);
    for i=1:f
           for j=1:c 
            gr=round(sum(imD(i,j,:))/rgb);
            hist(gr+1)++;
           end
    end
    xmax=max(hist);
    if(xmax>0)
      hist = hist./xmax;    
    end
end