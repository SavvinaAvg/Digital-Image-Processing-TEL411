function [choice]= displayMenu(options)
for i = 1:length(options)
    fprintf('%d. %s\n', i, options{i});
end

choice = 0;
while ~any(choice == 1:length(options))
    
    choice = inputNumber('Please insert a number between 1 and 3 to choose menu item: ');
    
end

