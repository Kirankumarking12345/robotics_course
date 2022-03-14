% In this function, you need to convert the rotation matrix R into axis-angle form

function [axang] = rotmtoaxang(R)
 
    %% Your code starts here
       theta = acos((trace(R) - 1) / 2);
    
    if theta == 0
      vec = [NaN NaN NaN];
      
    elseif theta == pi
        
        vec = zeros(2,3);
        
        if (R(2,3) > 0)
          vec(1,1) = sqrt(((R(1,1)+1)/2));
          vec(1,2) = sqrt(((R(2,2)+1)/2));
          vec(1,3) = sqrt(((R(3,3)+1)/2));
          vec(2,1) = -sqrt(((R(1,1)+1)/2));
          vec(2,2) = -sqrt(((R(2,2)+1)/2));
          vec(2,3) = -sqrt(((R(3,3)+1)/2));
        
        else
          vec(1,1) = sqrt(((R(1,1)+1)/2));
          vec(1,2) = sqrt(((R(2,2)+1)/2));
          vec(1,3) = -sqrt(((R(3,3)+1)/2));
          vec(2,1) = -sqrt(((R(1,1)+1)/2));
          vec(2,2) = -sqrt(((R(2,2)+1)/2));
          vec(2,3) = sqrt(((R(3,3)+1)/2));
        end
        
        theta = [theta; theta];
    else
        
      k = 1 / (2 * sin(theta));
      vec = k * [R(3, 2) - R(2, 3), R(1, 3) - R(3, 1), R(2, 1) - R(1, 2)];
    end 
    
    axang = [vec, theta];
    %% Your code ends here

end