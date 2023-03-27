% Nick McCullough, AerE 161, Project 1, Problem 2 Script

clear,clc % clears all code
% created function called "Problem2" converting Kelvin to Celsius

key = '7cab1fcaf444883263bc48dd983e6018'; % API Key
options = weboptions('ContentType','json');
url=['https://api.openweathermap.org/data/2.5/weather?q=','Ames','&APPID=',key];
CurrentData = webread(url, options);

temp = CurrentData.main.temp; % real time temp
pressure = CurrentData.main.pressure; % real time pressure
humidity = CurrentData.main.humidity; % real time humidity%

disp('The Temperature in degress Celsius is') % simple disp for Celsius
tempC = Problem2(temp) % call the function

TD = tempC - ((100-humidity)/(5)); % Dewpoint Temp
% Equation 4.

vaporpressure = 6.11 * 10^((7.5*TD)/(237.7+TD)); % vapor pressure
% Equation 3. e is in millibar

virtualtemp = (temp)/(1-(vaporpressure/pressure)*(1-0.622));
% Equation 5. virtual temp equation. temp is in Kelvin

virtualtempR = ((9/5)*(virtualtemp - 273.15) + 32) + 459.69;
% Equation 6. Rankine virtual temp.

fieldelv = 955.6; 
% Ames Airport Elevation in feet

pressureinHG = pressure * 0.02953;
% Equation 8. Pressure in Mercury conversion from millibar.

densityaltitude = fieldelv + (145366*(1-(17.326 * pressureinHG)/virtualtempR)^0.235);
% Equation 7. Density altitude calculation.

fprintf('The current density altitude is : %f feet \n',densityaltitude)
% print statement to displate density altitude.

