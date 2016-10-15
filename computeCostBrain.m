function J=computeCostBrain(X,Y,Theta1,Theta2,Theta3)
	m=length(Y);
	h1=sigmoid(X*Theta1);
	h2=sigmoid([ones(size(h1), 1) h1]*Theta2);
	h3=sigmoid([ones(size(h1), 1) h2]*Theta3);	
	cost= sum((-Y.*log(h3))-((1.-Y).*log(1.-h3)));
	J=(1/(2*m))*cost;
	J=(1/length(J))*sum(J);
end