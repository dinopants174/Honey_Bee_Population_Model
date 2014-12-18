function res = pde1() %takes length of pipe, diffusion coefficient, ana initial
%concentration as input
    m = 0;    %necessary for matlab to solve PDEs
    xmesh = linspace(0, 1000000, 100);   %solve for 100 intervals from 0 to length of pipe
    tspan = linspace(0, 100, 100);   %solve for 100 intervals from 0 seconds to 5s
    sol = pdepe(m, @pdefun, @icfun, @bcfun, xmesh, tspan);
    u = sol(:, :, 1);
    n0 = 0.2
    D = 0.05
    l = 1000000
   
    function[c, f, s] = pdefun(x, t, u, DuDx)   %describes the partial diff eq
        c = -7;
        f = S;
        s = 0;
    end

    function u0 = icfun(x)  %sets up the initial conditions of the system
        if x > 0.45*l && x < 0.55*l
            u0 = n_0;
        else
            u0 = 0;
        end
    end
    
    function[pl, ql, pr, qr] = bcfun(xl, ul, xr, ur, t) %sets up the boundary conditions
        %of the system
        pl = 0;
        ql = 1;
        pr = 0;
        qr = 1;
    end
    
    %plots the concentration of the dye over space and time
    surf(xmesh, tspan, u);
    xlabel('Position in Pipe (m)');
    ylabel('Time (s)');
    zlabel('Concentration of Dye (mol/m3)');
    title('Concentration of Dye in Pipe over Time and Space (D=2.3*10 ^-8)');
    
    %plots the concentration of the dye over space after the allotted time
    figure;
    plot(xmesh,u(end,:))
    xlabel('Position in Pipe (m)');
    ylabel('Concentration of Dye (mol/m3)');
    title('Concentation of Dye over Space after 1 Hour');
end

