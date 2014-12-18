function res = honey_bee_iter_v2()
    inf = 0.2;
    m_s = 0.01;
    m_i = 0.45;
    m = 1;
    a_range = linspace(0, 21);
    t_range = linspace(0, 100);
    
    sol = pdepe(m, @pdefun, @icfun, @bcfun, a_range, t_range);
    S = sol(:,:,1);
    I = sol(:,:,2);
    R = sol(:,:,3);
    
    figure;
    surf(a_range, t_range, S);
    xlabel('Age');
    ylabel('Time');
    zlabel('Susceptible Population');
    title('Susceptible Honey Bee Population as a function of Age and Time: Advective Flux');
    
    figure;
    surf(a_range, t_range, I);
    xlabel('Age');
    ylabel('Time');
    zlabel('Infected Population');
    
    figure;
    surf(a_range, t_range, R);
    xlabel('Age');
    ylabel('Time');
    zlabel('Dead Population');
    
    %function [c, f, s] = pdefun(a, t, S, I, R, dSda, dIda, dRda)
    function [c, f, s] = pdefun(a, t, u, DuDx)
        S = u(1);
        I = u(2);
        R = u(3);
        dSda = DuDx(1); dIda = DuDx(2); dRda = DuDx(3);
        c = [-1; -1; -1];
        f = [S; I; R];
        s = [-dSda + inf*S + m_s*S; -dIda - inf*S + m_i*I; -dRda-m_s*S-m_i*I] ;
    end

    function u0 = icfun(a) 
        u0 = [60000; 1000; 0];
    end

    function[p1, q1, p2, q2] = bcfun(xl, ul, xr, ur, t)
        p1 = [-2000; 0; 0];
        q1 = [1; 1; 1];

        p2 = [-ur(1); -ur(2); -ur(3)];
        q2 = [0; 0; 0];
    end

end