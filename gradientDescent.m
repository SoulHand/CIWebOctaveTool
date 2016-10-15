function [Theta]=gradientDescent(Theta,X,Y,iters,ALPHA,lambda)	
	for i=1:iters
		m=length(Y);
		temp=Theta(:,:);
		temp(1)=0;
		temp*=(lambda/m);
		H=sigmoid(X*Theta);		
		grad=((((H-Y)'*X)')/m)+temp;			
		Theta=Theta-grad;
	end
end