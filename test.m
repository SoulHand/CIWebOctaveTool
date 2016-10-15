	T=5e-1;
	[FileName Path]=uigetfile({'*.jpg;*.jpeg;*.gif;*.png'}, 'Seleccione las imagenes a procesar');
	if !isequal(FileName,0)		
		urlPath=strcat(Path,FileName);
		imD = imread(urlPath);
		i=0;
			A=imresize(imD,[windH,windH]);
			[H A]=LBP(A,0);
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
				 		A1=[1 Hn'];
				 		H=sigmoid(A1*W);
				 		if(max(H)>=T)
					 		submenu=0;
					 		imshow(C);
					 		[u v]=size(H);
					 		for i=1: v
	   							fprintf('Probabilidad para (%d,%d): %f \n',x,y,H(i));
	   						end
	   						while(submenu==0)
	   							fprintf('\n1.-Añadir como falso positivo\n2.-Añadir como ventana positiva\n3.-Saltar\n');   						
								submenu=input('Ingrese una opción:');
								if(submenu==1)
									[mi S]=size(W);
									[file,limite]=size(X);
									if(S>1)
										temp=zeros(S,1);
									else
										temp=zeros(S,1)+1;
									end
									file++;
									X(file,:)=A1;
									Y(file,:)=temp(:);						
								else
									if(submenu==2)
										[mi S]=size(W);
										[file,limite]=size(X);
										temp=zeros(S,1);
										for i=1:S
											temp(i)=double(input(strcat('Ingrese el valor salida de (',int2str(i),')  deseado [0...1]:')));
											%Y(file,i)=double(input(strcat('Ingrese el valor salida de (',int2str(i),')  deseado [0...1]:')));
										end
										B=imresize(C,[CANONICALH,CANONICALW]);
										Hn=histogram(B);
										file++;								
										X(file,:)=[ 1 Hn'];
										Y(file,:)=temp(:);
									end
								end
							end
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