%
%
a_range = 21;
t_range = 1000;
%make matrices in which to store S(a,t)
S = ones([a_range t_range])

%define init conditions
dSdt

%define boundaries
S(0,:) = deal(2000);


for t=0:t_range
    for a = 0:a_range
        dSdt = 
    end
end

%make advection matrices

%define i.c. functions and b.c.s

%loop through and run pde solver

%plotplotplot

% def make_advection_matrices(z, r):
%     """Return matrices A and M for advection equations"""
%     ones = np.ones(len(z))
%     A = spdiags( [-beta*r, ones, beta*r], (-1,0,1), len(z), len(z) )
%     M = spdiags( [(1-beta) * r, ones, -(1-beta) * r], (-1,0,1), len(z), len(z) )
%     return A.tocsr(), M.tocsr()
% 
% def plot_iteration(z, u, iteration):
%     """Plot the solver progress"""
%     pylab.plot(z, u, label="Iteration %d" % iteration)
% 
% # Set up basic constants
% beta = 0.5
% J = 200 # total number of mesh points
% z = np.linspace(-10,10,J) # vertices
% dz = abs(z[1]-z[0]) # space step
% dt = 0.2    # time step
% v = 2 * np.ones(len(z)) # velocity field (constant)
% r = v / 2 * dt / dz
% 

% 
% A, M = make_advection_matrices(z, r)
% u = u_init
% for i in range(10):
%     u = spsolve(A, M * u)
%     plot_iteration(z, u, i)
