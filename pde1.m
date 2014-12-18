function res = pde1()
    inf = 0;
    m_s = 0;
    m = 1;
    a_range = linspace(0, 21);
    t_range = linspace(0, 100);
    
    sol = pdepe(m, @pdefun, @icfun, @bcfun, a_range, t_range);
    S = sol(:,:,1);
    figure;
    surf(a_range, t_range, S);
    xlabel('Age');
    ylabel('Time');
    zlabel('Susceptible Population');
    title('Susceptible Honey Bee Population as a function of Age and Time: Advective Flux');
    
    function[c, f, s] = pdefun(a, t, S, dSda)
        c = -1;
        f = S;
        s = -dSda + inf*S + m_s*S ;
    end

    function u0 = icfun(a) 
        u0 = 60000;
    end

    function[p1, q1, p2, q2] = bcfun(xl, ul, xr, ur, t)
        p1 = -2000;
        q1 = 1;

        p2 = -ur;
        q2 = 0;
    end

end