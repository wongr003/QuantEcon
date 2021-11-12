using LinearAlgebra, Statistics
using Distributions, Plots, Printf, Random

## Simulation
d = Categorical([0.5, 0.3, 0.1, 0.1]);
@show rand(d, 5);
@show supertype(typeof(d));
@show pdf(d, 4);
@show support(d);
@show pdf.(d, support(d));

function mc_sample_path(P; init = 1, sample_size = 1000)
    @assert size(P)[1] == size(P)[2] # square required
    N = size(P)[1]; # should be square
    
    # create vector of discrete RVs for each row of stochastic matrix P
    dists = [Categorical(P[i, :]) for i in 1:N]

    # set up Simulation
    X = fill(0, sample_size); # allocate memory, or zeros(Int64, sample_size)
    X[1] = init # set the initial state

    for t in 2:sample_size
        dist = dists[X[t - 1]];
        X[t] = rand(dist);
    end

    return X
end

P = [0.4 0.6; 0.2 0.8];

X = mc_sample_path(P, sample_size = 100_000); # note 100_000 = 100000
μ_1 = count(X .== 1) / length(X);  # .== broadcasts test for equality. Could use mean(X .== 1)