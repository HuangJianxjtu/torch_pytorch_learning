-- tensor
a = torch.Tensor(5,3)   -- construct a 5*3 matrix, uninitialized
a = torch.rand(5,3)
print(a)

b = torch.rand(3,4)
print(b)

-- matrix multiplication, syntax 1
c = a*b

-- matrix multiplication, syntax 2
c = torch.mm(a,b)

-- matrix multiplication, syntax 3
c = torch.Tensor(5,4)
c:mm(a,b)   -- store the result of a*b in c
print(c)
