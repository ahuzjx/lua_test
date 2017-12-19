a={}
a.x=1
a.y=0

b={}
b.x=1
b.y=0

c=a
print(c==a)
print(a==b)


w={x=0,y=0,label="console"}
x={math.sin(0),math.sin(1),math.sin(2)}
w[1]="another field"
x.f=w
print(w["x"])
print(w[1])
print(x.f[1])
w.x=nil

do
    local a2=2*a
    local d=math.sqrt(b^2-4*a*c)
    x1=(-b+d)/a2
    x2=(-b-d)/a2
end
