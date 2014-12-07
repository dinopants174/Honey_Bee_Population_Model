function res = honey_bee_iter1()
    e = 0.5;    %eclosion rate
    d = 0.14;    %natural death rate
    L = 2000;
    w = 27000;

    function res = derivs(t, W)
        B = W(1);
        H = W(2);
        F = W(3);       
        dBdt = (L *((H+F)/(H+F+w)))*(1-B/20000);
        %dHdt = (e*B + (F-H)*H)*(1-H/20000);
        dHdt = (e*B)*(1-H/20000);
        dFdt = ((H-F)*F - d*F)*(1-F/20000);
        
        res = [dBdt; dHdt; dFdt];
    end
        
    [T,Y] = ode45(@derivs,[0,100],[0, 10, 500]);
    figure;
    hold on
    plot(T,Y(:, 1), 'b')    %baby bee population
    plot(T, Y(:,2) + Y(:,3), 'y');  %worker bee population
    plot(T, Y(:, 2), 'r')
    plot(T, Y(:, 3), 'g')
%    res = Y;

end