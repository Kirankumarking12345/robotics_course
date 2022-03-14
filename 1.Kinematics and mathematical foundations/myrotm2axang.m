function [axang] = myrotm2axang(R)
 
    %% Your code starts here
    theta(1) = acos((trace(R) - 1)/2);
    
    vec(1, :) = 1/(2*sin(theta(1)))*[(R(3,2) - R(2,3)) , (R(1,3)-R(3,1)) ,(R(2,1)-R(1,2))];
    %if theta = 0 | 3.14 |-3.14 then there is infinite no of sol vec so the
    %below will help
    if (theta == pi)
        rx = sqrt((R(1,1)+1)/2);
        ry = sqrt((R(2,2)+1)/2);
        rz = sqrt((R(3,3)+1)/2);
        
        vec = [rx ry rz];
        theta(2) = theta(1);
        vec(2, :)= vec(1,:);
        vec(1, :)= -1.*vec(1,:);
    end
    theta = theta';
    axang = [vec, theta];

    %% Your code ends here

end