using LinearAlgebra, Statistics, Plots

x_vals = [0 0 0; 2 -3 -4];
y_vals = [0 0 0; 4 3 -3.5];

plot(x_vals, y_vals, arrow = true, color = :blue,
     legend = :none, xlims = (-5, 5), ylims = (-5,5),
     annotations = [(2.2, 4.4, "[2, 4]"),
                    (-3.3, 3.3, "[-3, 3]"),
                    (-4.4, -3.85, "[-4, -3.5]")],
    xticks = -5:1:5, yticks = -5:1:5,
    framestyle = :origin)

 # Illustrate scalar multiplication
 x = [2];
 scalars = [-2 1 2];  
 vals = [0 0 0; x * scalars]
 labels = [(-3.6, -4.2, "-2x"), (2.4, 1.8, "x"), (4.4, 3.8, "2x")]
 
 plot(vals, vals, arrow = true, color = [:red :red :blue],
     legend = :none, xlims = (-5, 5), ylims = (-5, 5),
     annotations = labels, xticks = -5:1:5, yticks = -5:1:5,
     framestyle = :origin)

x = ones(3);
y = [2, 4, 6];
x + y;
4x; # equivalent to 4 * x and 4 .* x

dot(x, y); 
norm(x); # Norm of x
sqrt(sum(abs2, x)); # Give the same result

# fixed linear function, to generate a plane
f(x, y) = 0.2x + 0.1y;

# lines to vectors
x_vec = [0 0; 3 3]
y_vec = [0 0; 4 -4]
z_vec = [0 0; f(3, 4) f(3, -4)]

# draw the plane
n = 20
grid = range(-5, 5, length = n)
z2 = [ f(grid[row], grid[col]) for row in 1:n, col in 1:n ]
wireframe(grid, grid, z2, fill = :blues, gridalpha =1 )
plot!(x_vec, y_vec, z_vec, color = [:blue :green], linewidth = 3, labels = "",
      colorbar = false)

A = [1 2
     3 4]
A'
A = ones(3,3);
2I
A + I

# Solve Linear Equations
A = [1.0 2.0; 3.0 4.0];
y = ones(2,1);
det(A);
A_inv = inv(A)
x = A_inv * y # solution
A * x # should equal y (a vector of ones)
A \ y # produces the same solution

A = [1.0 2.0; 2.0 1.0];
evals, evecs = eigen(A);

