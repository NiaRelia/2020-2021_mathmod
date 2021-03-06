using DifferentialEquations
using Plots

u0 = [1.2, 1]
t = (0.0, 42.0)
dt = 0.05

function model_1(du, u, p, t)
    du[1] = u[2]
    du[2] = -7.5 * u[1]
end
function model_2(du, u, p, t)
    du[1] = u[2]
    du[2] = -2 * du[1] - 5.5 * u[1]
end
function model_3(du, u, p, t)
    du[1] = u[2]
    du[2] = -2.4 * du[1] - 5 * u[1] + 5.2 * sin(2 * t)
end

tmp1 = solve(ODEProblem(model_1, u0, t), saveat = dt)
tmp2 = solve(ODEProblem(model_2, u0, t), saveat = dt)
tmp3 = solve(ODEProblem(model_3, u0, t), saveat = dt)

tmpX(u) = u[1]
tmpY(u) = u[2]

p1 = plot(tmpX.(tmp1.u), tmpY.(tmp1.u))
p2 = plot(tmpX.(tmp2.u), tmpY.(tmp2.u))
p3 = plot(tmpX.(tmp3.u), tmpY.(tmp3.u))

plot(p1, p2, p3)
