function res = pde1()
    inf = 0;
    ms = 0.5;
    m = 1;
    a_range = linspace(0, 21);
    %a_range = linspace(0, 3);
    t_range = linspace(0, 100);
    
    sol = pdepe(m, @pdefun, @icfun, @bcfun, a_range, t_range);
    S = sol(:,:,1);
    
    figure;
    surf(t_range, a_range, S);
    ylabel('Age');
    xlabel('Time');
    zlabel('Population');
    %figure;
    %plot(a_range, S(3, :));
    function[c, f, s] = pdefun(a, t, S, dSda)
        %c = -7;
        c = -1;
        f = S;
        %s = -inf*S/(-7) - ms*S/(-7);
        %s = -inf*S - ms*S;
        s = -dSda;
    end

    function u0 = icfun(a) 
        u0 = 60000*t;
    end

    function[p1, q1, p2, q2] = bcfun(xl, ul, xr, ur, t)
        p1 = -2000;
        %p1 = 0;
        q1 = 1;

        p2 = ur;
        q2 = 0;
        %p2 = 0;
        %q2 = 1;
    end

end