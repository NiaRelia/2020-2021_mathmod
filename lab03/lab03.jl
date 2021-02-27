using Plots
using DifferentialEquations

v0 = [30030, 59010]
t = (0, 2)

function model_1(du, u, p, t)
    du[1] = -0.46 * u[1] - 0.58 * u[2] + abs(sin(2 * t) + 1)
    du[2] = -0.69 * u[1] - 0.23 * u[2] + abs(cos(t) + 1)
end

tmp1 = solve(ODEProblem(model_1, v0, t))
p1 = plot(tmp1)


function model_2(du, u, p, t)
    du[1] = -0.37 * u[1] - 0.71 * u[2] + abs(sin(2 * t) + 1)
    du[2] = -0.77 * u[1] * u[2] - 0.2 * u[2] + abs(cos(t) + 2)
end

tmp2 = solve(ODEProblem(model_2, v0, t), saveat = 0.1)
p2 = plot(tmp2)

plot(p1, p2)
