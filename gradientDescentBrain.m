function [Theta1 Theta2 Theta3]=gradientDescentBrain(X,Y,iters,ALPHA,Theta1,Theta2,Theta3)		
		Theta_grad1=zeros(size(Theta1));
		Theta_grad2=zeros(size(Theta2));
		Theta_grad3=zeros(size(Theta3));
	for i=1:iters
		m=length(Y);
		A2= sigmoid(X*Theta1);
		A2 = [ones(size(A2), 1) A2];
		A3=sigmoid(A2*Theta2);
		A3 = [ones(size(A3), 1) A3];
		A4=sigmoid(A3*Theta3);
		grad4=A4-Y;
		grad3=(Theta3*grad4')'.*sigmoidGradient(A3);
		grad2=(Theta2*grad3(:,2:end)')'.*sigmoidGradient(A2);
		Theta_grad3=Theta_grad3+(grad4'*A3)'(:,2:end);
		Theta_grad2=Theta_grad2+(grad3'*A2)'(:,2:end);
		Theta_grad1=Theta_grad1+(grad2'*X)'(:,2:end);
	end
	Theta1=Theta1-Theta_grad1;
	Theta2=Theta2-Theta_grad2;
	Theta3=Theta3-Theta_grad3;
end