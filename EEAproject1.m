%DJ Hinton
%File created September 12, 2017
%IE1040 T, Th 11:00-12:15
%Dr. Bursic
%Programming Assignment 1

%The purpose of this file is to display knowledge of 
%basic programming skills and the learning curve cost estimation madel

clear
clc

totalTime = 0;
%ask user for inputs
unit_Number = input('How many units would you like?: ');
cost_PerHr = input('What is the labor cost per hour?: ');
unit_1_time = input('How long does it take to make the first unit? (in hr): ');
learning_curve = input('What is the learning curve factor? (as decimal): ');

for i=1:1:unit_Number
    totalTime = totalTime + (unit_1_time * i^(log(learning_curve)/log(2)));
end

laborCost = totalTime * cost_PerHr;
avgTime_unit = totalTime / unit_Number;
unit_laborCost = laborCost / unit_Number;

disp(' ');
disp(' ');

disp(['Total labor hours required:', num2str(totalTime)]);
disp(['Total labor cost:', num2str(laborCost)]);
disp(['Labor hours per unit:', num2str(avgTime_unit)]);
disp(['Labor cost per unit:', num2str(unit_laborCost)]);


