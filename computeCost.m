function J = computeCost(X, y, theta)
	m = length(y);
	H=sigmoid(X*theta);
	[v,n]=size(H);
	cost= sum((-y.*log(H))-((1.-y).*log(1.-H)));
	%cost= sum((y-H).^2);
	J = (1/(2*m))*cost;
	J=(1/length(J))*sum(J);
end
