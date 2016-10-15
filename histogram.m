function hist=histogram(imD)
    %im = imread(imagen);   
    %imD = double(imagen);
    [f,c,rgb]=size(imD);
    h=zeros(256,1);
    for i=1:f
           for j=1:c 
            gr=0;         
              for g=1:rgb
                gr +=imD(i,j,g);                
               end
               k=round(gr/rgb);
               h(k+1)++;
           end
    end
    xmax=max(h);
    if(xmax>0)
      hist = h./xmax;
    else
      hist=h;
    end
end