% Nick McCullough, AerE 161, Project 1, Problem 1 Script

% created a function called "Problem1" for the weights of user inputs

clear,clc % clears all code 
% Start by entering all data for the aircraft.

% % we will be storing all values as variables listed in Instructions Table 1
emptyweight = 1471; % this is the empty weight of the airplane, pounds, fixed
cg = 85.9; % this is the center of gravity of the airplance, inches, fixed
FSMA = 85.5; % this is the Front Seats Moment Arm, inches
FTMA = 95; % this is the Fuel Tanks Moment Arm, inches
RSMA = 118.1; % this is the Rear Seats Moment Arm, inches
MaxRampWeight = 2400; % this is the Maximum Ramp Weight, pounds (cannot exceed this)
MaxFuel = 50; % this is the Maximum Fuel Capacity, US Gallons, 100LL fuel

while(1) % this is for while loop and exit script at the end.

disp('Hello, welcome to the Weight and Balance Calculator.') % simple welcome greeting
disp('This aircraft: 1965 Piper Cherokee PA-28-180') % naming the aircraft

[fuel,pilot,copilot,pass1,pass2] = Problem1; % calling the function Problem1
rampweight = (emptyweight + fuel + pilot + copilot + pass1 + pass2); 
% calculate rampweight using Problem 1 value, adding emptyweight value


    if rampweight > MaxRampWeight % create if statement for current rampweight and MaxRampWeight variable
    disp('The plane is too heavy to fly. Please remove weight.') % too heavy :(
    elseif rampweight <= MaxRampWeight % else if statement, less than or equal to
    disp('The aircraft is within the maximum weight.') % within weight
    else % else
    disp('Error. Please try again.') % Error statement for else
    end % end if statement

momentfront = (pilot + copilot)*FSMA; % using our rampweight function to find front seat moment
momentrear = (pass1 + pass2)*RSMA; % using our rampweight function to find rear seat moment
momentfueltank = (fuel)*FTMA; % using our rampweight function to find fuel tank moment
momentempty = (emptyweight)*85.9; % using our rampweight function to find empty moment
totalmoment = (momentfront + momentrear + momentfueltank + momentempty); % sum of moments

fprintf('The Total Moment of the aircraft is : %.2f\n',totalmoment)
% fprintf statement for the Total Moment

x = totalmoment; % variable for total moment
cgcalc = x / rampweight; % created variable to identify the calculated cg
% calculated center of gravity is x / rampweight

% per instructions, cgcalc should be between 85.8 and 95.8

    if cgcalc < 85.8 || cgcalc > 95.8 % calculated cg bounds statement per Instructions
    disp('Center of Gravity is off, aircraft not balanced')
    else
    disp('Aircraft is balanced. OK to fly.')
    end % end if statement

Z = input('\n\n Finished? \n Enter 1 to exit. \n'); % exit script for While(1) above
    if Z == 1 % exit variable 1 per instructions
        disp('Thank you for using the Weight and Balance Calculator.') % thank you
      break % break to exit
    end % end Finished? 
end % end while(1)