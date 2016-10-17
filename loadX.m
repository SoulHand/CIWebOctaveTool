load ('histogram.m');
load ('LBP.m');
[mi S]=size(W);
fin=false;
[file,limite]=size(X);
file++;
while fin==false
	[FileName Path]=uigetfile({'*.jpg;*.jpeg;*.gif;*.png'}, 'Seleccione las imagenes a procesar');
	if !isequal(FileName,0)
		urlPath=strcat(Path,FileName);
		imD = imread(urlPath);
   	 	[H new_image]=LBP(imD,0);
       	temp=zeros(S,1);
		for i=1:S
			temp(i)=double(input(strcat('Ingrese el valor salida de (',int2str(i),')  deseado [0...1]:')));
			%Y(file,i)=double(input(strcat('Ingrese el valor salida de (',int2str(i),')  deseado [0...1]:')));
		end
		clc;
		fprintf('Procesando espere....\n');
		xmax=max(temp(:));
		display(S);
		if((S>1 && xmax==1) || (S==1 && xmax==0))
			B=imresize(new_image,[CANONICALH,CANONICALW]);
			Hn=histogram(B);
			X(file,:)=[ 1 Hn'];
			Y(file,:)=temp(:);
			file++;			
		else
			i=0;
			A=imresize(new_image,[windH,windH]);
			[h,w]=size(A);
			newW=w/sK^i;
			newH=h/sK^i;
			while(newW>CANONICALW && newH>CANONICALH)
				B=imresize(A,[newH,newW]);
				[h1,w1 gr]=size(B);
				x=1;
				y=1;
				xend=x+(CANONICALW-1);
				yend=y+(CANONICALH-1);
				while(yend<=h1)
					while(xend<=w1)
						C=B(y:yend,x:xend,:);
						Hn=histogram(C);
						A=[ 1 Hn'];
						hypo=sigmoid(A*W);
						if((hypo<T && S==1 && xmax>0) || (max(hypo)>=T && S>1 && xmax==0))
							X(file,:)=A;
							Y(file,:)=temp(:);
							file++;
						end
						x+=STEP;
						xend=x+(CANONICALW-1);						
					end					
					y+=STEP;
					yend=y+CANONICALH-1;
				end
				i++;
				newW=w/sK^i;
				newH=h/sK^i;
			end
		end		
	end	
	opc=questdlg('¿Desea Agregar otra imagen?','SALIR','Si','No','No');
	if  strcmp(opc,'No')
		fin=true;
	end
	file++;
end
fprintf('Reescalado y deslizamiento completado...\n');
[m n]=size(X);
fprintf('Los archivos han sido añadidos satisfactoriamente... \nTotal entrenamiento : %d imagenes \n',m);
pause;