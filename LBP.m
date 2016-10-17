function [H new_img]=LBP(imD,t)
	H=zeros(256,1);
	[f,c,rgb]=size(imD);
	new_img=zeros(size(imD));
	for i=1:f
           for j=1:c
           	 	gr=round(sum(imD(i,j,:))/rgb);
               	byte=zeros(8,1);
               		if(j-1>=1)
               			if(round(sum(imD(i,j-1,:))/rgb)-gr>=t)
               				byte(1)=1;
               			end
               			if(i+1<=f)
	               			if(round(sum(imD(i+1,j-1,:))/rgb)-gr>=t)
	               				byte(2)=2;               			
	               			end
               			end
               			if(i-1>=1)
	               			if(round(sum(imD(i-1,j-1,:))/rgb)-gr>=t)
	               				byte(8)=128;               			
	               			end               				
               			end
               		end
               		if(j+1<=c)
               			if(i+1<=f)
	               			if(round(sum(imD(i+1,j+1,:))/rgb)-gr>=t)
	               				byte(4)=8;               			
	               			end
	               		end
	               		if(round(sum(imD(i,j+1,:))/rgb)-gr>=t)
	               			byte(5)=16;               			
	               		end
	               		if(i-1>=1)
	               			if(round(sum(imD(i-1,j+1,:))/rgb)-gr>=t)
	               				byte(6)=32;               			
	               			end               				
               			end
               		end


               		if(i+1<=f)
	               		if(round(sum(imD(i+1,j,:))/rgb)-gr>=t)	               			
	               			byte(3)=4;               			
	               		end
	               	end
	               	if(i-1>=1)
	               		if(round(sum(imD(i-1,j,:))/rgb)-gr>=t)	               		
	               			byte(7)=64;               			
	               		end
	               	end	               
	               	p=sum(byte(:));	               	             	
               		new_img(i,j,1)=p;
               		new_img(i,j,2)=p;
               		new_img(i,j,3)=p;
               		H(p+1)++;
           end
       end
end


