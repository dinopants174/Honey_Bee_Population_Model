function res = pde1()
    inf = inf*-7;
    ms = 0*-7;
    m = 0;
    a_range = linspace(0, 1000000, 100);
    t_range = linspace(0, 100);
    
    sol = pdepe(m, @pdefun, @icfun, @bcfun, a_range, t_range);
    S = sol(:,:,1);
    
    figure;
    surf(a_range, t_range, S);
    xlabel('Age');
    ylabel('Time');
    zlabel('Population');

    function[c, f, s] = pdefun(a, t, S, dSda)
        c = 1/(-1/7);
        f = S;
        s = ;
    end

    function S0 = icfun(a)
        S0 = 60000;
    end

    function[p1, q1, p2, q2] = bcfun(xl, ul, xr, ur, t)
        q1 = 1;
        p1 = -2000;

        p2 = 0;
        q2 = 1;
    end

end