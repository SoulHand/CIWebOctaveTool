function H=predict(Theta1,Theta2)
	[FileName Path]=uigetfile({'*.jpg;*.jpeg;*.gif;*.png'}, 'Seleccione las imagenes a procesar');
	if !isequal(FileName,0) 
		x=histogram(strcat(Path,FileName));
		plot(x);
		grid on;
		x=[1 x'];
		H1=sigmoid(x*Theta1);
		H=sigmoid([1 H1]*Theta2);
	end
end