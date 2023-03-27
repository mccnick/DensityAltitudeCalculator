% Nick McCullough, AerE 161, Project 1, Problem 1 function

function [fuel,pilot,copilot,pass1,pass2] = Problem1
% create function "Problem1" using variables below

fuel = input('How much fuel, in US Gallons, is on board the airplane?: '); % input statement
while (fuel<0) || fuel> 50 % create while statement for bounds
    disp('Error! Please Try Again. Fuel must be between 0 and 50 gallaons.') % error statement
    fuel = input(); % requires input
end % end while statement

pilot = input('Please enter the weight of the pilot: '); % user input
copilot = input('Please enter the weight of the co-pilot: '); % user input
pass1 = input('Please enter the weight of passenger 1, if no passenger 1 enter 0: '); % user input
pass2 = input('Please enter the weight of passenger 2, if no passenger 2 enter 0: '); % user input

end % end function