using Plots

k = 15.5
v = 3.5
x1 = k / (v - 1)
x2 = k / (v + 1)

t1 = 0
t2 = -pi
t0 = 2pi / 5
x0 = 0:0.2:40
f0(r) = t0

Int_f(x) = log(x) * sqrt(v*v - 1)
c1 = t1 - Int_f(x1)
c2 = t2 - Int_f(x2)

f1(r) = t1
g1(r) = Int_f(r) + c1
f2(r) = t2
g2(r) = Int_f(r) + c2

x1_f = x1:0.1:k
x1_s = x1:0.2:40
x2_f = x2:0.1:k
x2_s = x2:0.2:40

plot(f1.(x1_f), x1_f, color = [:red])
plot!(g1.(x1_s), x1_s, color = [:red])
tmp1 = plot!(f0.(x0), x0, color = [:blue], proj=:polar)

plot(f2.(x2_f), x2_f, color = [:red])
plot!(g2.(x2_s), x2_s, color = [:red])
tmp2 = plot!(f0.(x0), x0, color = [:blue], proj=:polar)

plot(tmp1, tmp2)

point_r1 = exp((t0 - c1) / sqrt(11.25))
point_t1 = t0
point_r2 = exp((t0 - c2) / sqrt(11.25))
point_t2 = t0
