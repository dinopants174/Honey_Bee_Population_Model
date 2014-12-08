function res = honey_bee_iter1()
    e = 0.5;    %eclosion rate
    d = 0.14;    %natural death rate
    L = 2000;
    w = 27000;
    k = 0.25;    %rate at which worker bees respond to difference in H and F
    B_c = 12500;      %baby bee carrying capacity
    H_c = 35000;      %hive bee carrying capacity
    F_c = 12500;      %forager bee carrying capacity

    function res = derivs(t, W)
        B = W(1);
        H = W(2);
        F = W(3);
        dBdt = (L *((H+F)/(H+F+w)))*(1-B/B_c);
        dHdt = (e*B + k*(F-H))*(1-H/H_c);
%         if F > H
%             dHdt = (e*B + 0.75*(F-H) - 0.35*H) * (1-H/H_c);
%         else
%             dHdt = (e*B -0.35*H)*(1-H/H_c);
%         end
        dFdt = (-d*F + k*(H-F))*(1-F/F_c);

        res = [dBdt; dHdt; dFdt];
    end
        
    [T,Y] = ode45(@derivs,[0,100],[0, 0, 1000]);
    figure;
    hold on
    plot(T,Y(:, 1), 'b')    %baby bee population
    plot(T, Y(:,2) + Y(:,3), 'y');  %worker bee population
    plot(T, Y(:, 2), 'r')
    plot(T, Y(:, 3), 'g')

end