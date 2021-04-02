using DifferentialEquations
using Plots

M0_1 = 4.4
M0_2 = 3.1
p_cr = 33
N = 44
q = 1
t1 = 22
t2 = 13
p1 = 7.7
p2 = 10.7

a1 = p_cr / (t1^2 * p1^2 * N * q)
a2 = p_cr / (t2^2 * p2^2 * N * q)
b = p_cr / (t1^2 * p1^2 * t2^2 * p2^2 * N * q)
c1 = (p_cr - p1) / (t1 * p1)
c2 = (p_cr - p2) / (t2 * p2)

function f1(dM, M, p, t)
    dM[1] = M[1] - b / c1 * M[1] * M[2] - a1 / c1 * M[1]^2
    dM[2] = c2 / c1 * M[2] - b / c1 * M[1] * M[2] - a2 / c1 * M[2]^2
end

tmp1 = solve(ODEProblem(f1, [M0_1, M0_2], (0.0, 15.0)))
p1 = plot(tmp1, label = ["Фирма 1" "Фирма 2"])

function f2(dM, M, p, t)
    dM[1] = M[1] - b / c1 * M[1] * M[2] - a1 / c1 * M[1]^2
    dM[2] = c2 / c1 * M[2] - (b / c1 + 0.00094) * M[1] * M[2] - a2 / c1 * M[2]^2
end

tmp2 = solve(ODEProblem(f2, [M0_1, M0_2], (0.0, 15.0)))
p2 = plot(tmp2, label = ["Фирма 1" "Фирма 2"])

plot(p1, p2)
