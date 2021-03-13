using DifferentialEquations
using Plots

u0 = [10, 20]
t = (0, 10)

function model(du, u, p, t)
    du[1] = -0.83u[1] + 0.043 * u[1] * u[2]
    du[2] = 0.84u[2] - 0.024 * u[1] * u[2]
end

tmp = solve(ODEProblem(model, u0, t), saveat = 0.1)
tmpX(u) = u[1]
tmpY(u) = u[2]

p1 = plot(tmp)
p2 = plot(tmpX.(tmp.u), tmpY.(tmp.u))

plot(p1, p2)
