-- network model
require 'nn'
net = nn.Sequential()
-- 1 input image channel, 6 output channels, 5x5 convolution kernel
net:add(nn.SpatialConvolution(1,6,5,5))
net:add(nn.ReLU()) -- non-linearity
-- A max-pooling operation that looks at 2x2 windows and finds the max.
net:add(nn.SpatialMaxPooling(2,2,2,2))
net:add(nn.SpatialConvolution(6,16,5,5))
net:add(nn.ReLU()) -- non-linearity
net:add(nn.SpatialMaxPooling(2,2,2,2))
 -- reshapes from a 3D tensor of 16x5x5 into 1D tensor of 16*5*5
net:add(nn.View(16*5*5))
-- fully connected layer (matrix multiplication between input and weights)
net:add(nn.Linear(16*5*5,120))
net:add(nn.ReLU())
net:add(nn.Linear(120,84))
net:add(nn.ReLU())
 -- 10 is the number of outputs of the network (in this case, 10 digits)
net:add(nn.Linear(84,10))
-- converts the output to a log-probability. Useful for classification problems
-- softmax后，所有输出都在0与1之间，所有输出的和为1
-- log_softmax是在softmax之后再进行log操作
net:add(nn.LogSoftMax())

print('Lenet5\n' .. net:__tostring());

input = torch.rand(1,32,32)
output = net:forward(input)
print(output)

-- zero the internal gradient buffers of the network 
net:zeroGradParameters()
gradInput = net:backward(input, torch.rand(10))
print(#gradInput)

-- loss function --  the function that computes an objective measure of the model's performance
criterion = nn.ClassNLLCriterion()   -- a negative log-likelihood criterion for multi-class classification
criterion:forward(output, 3)    -- the groundtruth was class number: 3
gradients = criterion:backward(output, 3)
print("gradients:\n")
print(gradients)
gradInput = net:backward(input, gradients)

-- weights
m = nn.SpatialConvolution(1,3,2,2) -- learn 3 2x2 kernels
print(m.weight) -- initially, the weights are randomly initialized
print(m.bias) -- The operation in a convolution layer is: output = convolution(input,weight) + bias
