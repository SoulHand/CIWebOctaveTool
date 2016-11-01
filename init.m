clc;
clear;
load './loadX.m';
load './test.m';
load './predict.m';
load './computeCost.m';
load './histogram.m';
load './sigmoid.m';
load './gradientDescent.m';
load './sigmoidGradient.m';
load './loadfor.m';
data=0;
X=[];
Y=[];
W=[];
Tetha1=[];
Theta2=[];
Theta3=[];
T=5e-1;
STEP=15;
sK=12e-1;
CANONICALW=64;
windW=350;
windH=200;
CANONICALH=128;
ALPHA=5e-1;
lambda=0;
clc;
fprintf('Inicializando los pesos ...\n');
menu=0;
while menu~=19,
	fprintf('Entrenamiento LBP Cascade\n1.-Añadir una imagen LBP\n2.-Calcular Funcion de Costo\n3.- Entrenar clasificador\n4.-Probar con una imagen\n5.-Reiniciar Pesos\n6.-Eliminar Entrenamiento\n7.- Importar datos\n8.-Guardar Cambios\n9.-Exportar Pesos\n10.-Cambiar tamano de la imagen canonical\n11.-Cambiar salto de redimencion\n12.-Cambiar valor de ALPHA\n13.-Añadir una estructura de imagenes\n14.-Exportar entrenamiento\n15.-Crear set neuronal\n16.-Calcular función de costo red neuronal\n17.-Entrenar red neuronal\n18.-Añadir set de entrenamientos\n19.-Salir\n');
	menu=input('Ingrese una opción:');
	switch menu
		case 1
			loadX;
		case 2
			fprintf('Calculando la Función de Costo\n');
			J=computeCost(X,Y,W);
			fprintf('Error aproximado: %f \n',J);
		case 3			
			iters=input('Ingrese epocas a entrenar:');
			W=gradientDescent(W,X,Y,iters,ALPHA,lambda);			
			J=computeCost(X,Y,W);
			fprintf('Error aproximado: %f \n',J);
		case 4
			test
		case 5
			row=input('Ingrese cantidad de filas:');
			col=input('Ingrese cantidad de Columnas:');
			W=rand(row,col);
			fprintf('Pesos reiniciados exitosamente...');
		case 6
			X=[];
			Y=[];
			fprintf('Entrenamientos eliminados...');
		case 7
			[FileName Path]=uigetfile({'*.txt;*.m'}, 'Seleccione data a importar');
			if !isequal(FileName,0)
				urlPath=strcat(Path,FileName);
				load(urlPath);
				fprintf('Importación completada con %d Registros...\n',length(X));
			else
				fprintf('Seleccione un archivo valido....\n');
			end
		case 8
			save './MathWork/data.m' X Y W CANONICALW CANONICALH sK windW windH T ALPHA Theta1 Theta2 Theta3 lambda;
			fprintf('Datos almacenados satisfactoriamente...');
		case 9
			save './weights/W.txt' W -ascii;
			fprintf('Cambios guardados exitosamente...');
		case 10
			CANONICALW=input('Ingrese ancho de la imagen canonical(W):');
			CANONICALH=input('Ingrese alto de la imagen canonical (H):');
			fprintf('Cambios realizados exitosamente...\nVentana compleya');

			windW=input('Ingrese ancho de la imagen(W):');
			windH=input('Ingrese alto de la imagen (H):');
			fprintf('Cambios realizados exitosamente...');
		case 11
			sK=double(input('Ingrese salto de redimencion:'));
			STEP=double(input('Ingrese salto de deslizamiento:'));
		case 12
			ALPHA=double(input('Ingrese valor de AlPHA:'));
		case 13
			loadfor
		case 14
			save './MathWork/input.m' X Y;
		case 15
			row=input('Ingrese cantidad de entradas:');
			med=input('Ingrese cantidad de neuronas:');
			col=input('Ingrese cantidad de salidas:');
			Theta1=rand(row,med);
			Theta2=rand(med+1,med+1);
			Theta3=rand(med+2,col);
			fprintf('set neuronal reiniciado exitosamente...');
		case 16
			fprintf('Calculando la Función de Costo\n');
			J=computeCostBrain(X,Y,Theta1,Theta2,Theta3);
			fprintf('Error aproximado: %f \n',J);
		case 17
			iters=input('Ingrese epocas a entrenar:');
			[Theta1 Theta2 Theta3]=gradientDescentBrain(X,Y,iters,ALPHA,Theta1,Theta2,Theta3);			
			J=computeCostBrain(X,Y,Theta1,Theta2,Theta3);
			fprintf('Error aproximado: %f \n',J);		
		case 18
			[FileName Path]=uigetfile({'*.txt;*.m'}, 'Seleccione data a importar');
			if !isequal(FileName,0)
				urlPath=strcat(Path,FileName);
				data=load(urlPath);
				n=length(X);
				X=cat(1,X,data.X);
				Y=cat(1,Y,data.Y);
				n=length(X)-n;
				fprintf('Importación completada con %d Registros...\n',n);
			else
				fprintf('Seleccione un archivo valido....\n');
			end
		end
	clc;
end
