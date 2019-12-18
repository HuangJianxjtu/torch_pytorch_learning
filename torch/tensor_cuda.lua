-- cuda tensor

require 'cutorch'

a = torch.rand(5,3)
b = torch.rand(3,4)
c = torch.Tensor(5,4)

a = a:cuda()
b = b:cuda()
c = c:cuda()

c:mm(a,b)   -- done on GPU
print(c)

function addTensors(tensor_a, tensor_b)
    if(tensor_a:nElement() == tensor_b:nElement())
    then
        tensor_a:add(tensor_b)
        return tensor_a
    else
        return false
    end
end

print(addTensors(a,b))

d = torch.rand(5,3):cuda()
print(addTensors(a,d))
