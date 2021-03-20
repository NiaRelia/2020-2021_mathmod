using DifferentialEquations
using Plots

a = 0.01
b = 0.02

N =12900
I = 190
R = 59
S = N - I - R

u0 = [S, I, R]
t = (0.0, 200.0)

function model_1(du, u, p, t)
    du[1] = 0
    du[2] = - b * u[2]
    du[3] = b * u[2]
end

function model_2(du, u, p, t)
    du[1] = - a * u[1]
    du[2] = a * u[1] - b * u[2]
    du[3] = b * u[2]
end

tmp1 = solve(ODEProblem(model_1, u0, t))
tmp2 = solve(ODEProblem(model_2, u0, t))

p1 = plot(tmp1)
p2 = plot(tmp2)

plot(p1, p2)
