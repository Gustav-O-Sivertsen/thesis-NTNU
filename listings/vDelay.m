function y = vDelay(timeStamp, d_Start, step, duration, d_Delay)
% Calculates a delay level, given input parameters 
%
   % The delay level is calculated using a step-wise function
   % gradully approacing a level of one during the attack duration.
   % this function is multiplied by d_Delay/steps in order to reach the
   % specified delay level of d_Delay in an number of steps specified 
   % by the variable "steps".
   %
% y: calculated delay level.
% timestamp: The timestam to calculate the delay for.
% d_start: The initiation time of the delay.
% step: Make setep-wise delay if true, otherwise the delay is instant.
% duration: The length of the active delay, in seconds.

    if ((d_Delay == 0 ) || ...
            ((timeStamp < d_Start) || (timeStamp >= (d_Start+duration))))
        % No delay 8d_Delaydelay = 0) in any of these cases:
        % * d_Delay== 0: The delay level is explicitly set to zero.
        % - (timeStamp < d_Start): Time before d_start. 
        % - (timeStamp >= (d_Start+duration)): Time after specified time
        % frame of attack
     
        y=0; % Set the delay level equal to Zero.

    else % There should be a delay level greater than Zero.

        if (step == false) % The attack should not be Step-wise:
            % Use one step to reach the specified delay level.
            steps=1;

        else % Use n steps to reach a delay level of n
            steps=d_Delay;
        
        end
       % The delay level is calculated using a step-wise function
       % gradully approacing a level of one during the attack duration.
       % this function is multiplied by d_Delay/steps in order to reach the
       % specified delay level of d_Delay in an number of steps specified 
       % by the variable "steps".
       %
       y=ceil(rem((timeStamp-d_Start),(d_Start+duration)) )*d_Delay/steps;

       % In case the formula results in a too high delay level
     if (y > d_Delay) 
         % limit the delay level to the specified level
            y = d_Delay;
     end

   end
end

