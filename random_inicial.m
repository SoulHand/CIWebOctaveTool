function [theta1,theta2]=random_inicial(num_layer_input,num_layer_hidden,num_layer_ouput)
	theta1=rand(num_layer_input,num_layer_hidden);
	theta2=rand(num_layer_hidden+1,num_layer_ouput);
end
