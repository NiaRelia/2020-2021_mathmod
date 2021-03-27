using DifferentialEquations
using Plots

N = 1600

f1(u, p, t) = (0.12 + 0.000039 * u) * (N - u)
tmp1 = solve(ODEProblem(f1, 13, (0.0, 20.0)))
p1 = plot(tmp1, label = "")

f2(u, p, t) = (0.000012 + 0.29 * u) * (N - u)
tmp2 = solve(ODEProblem(f2, 13, (0.0, 0.02)))
p2 = plot(tmp2, label = "")

f3(u, p, t) = (0.12 * cos(t) + 0.29 * cos(t) * u) * (N - u)
tmp3 = solve(ODEProblem(f3, 13, (0.0, 0.02)))
p3 = plot(tmp3, label = "")

plot(p1, p2, p3)
