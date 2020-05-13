%       PROJECT  2     COMPUTATIONAL  MATHEMATICS
%           Emiliano Padilla Cardona - 166136
%           Salvador Rodríguez Carrasco - 17


%PROBLEM 1: Least squares.
%   For this problem we use data from the file "datos.xlsx". 
%   We wish to find a linear relation between the number of days of intake
%   for a certain medication and the white blood cell count.
%   It is also believed that the relation is the same for every country in 
%   the data base, regardless of population.

%   FIRST, we read in the data into a matrix, A, containing the information
%   form Mexico (MX), Germany (DE), Japan (JP), and India (IN), in that
%   particular order.
A = table2array(datos);

%   SECOND, we split the data in A into matrices MX, DE, JP, and IN for
%   each of the countries, respectively.
MX = A(:,1:2);
DE = A(:,3:4);
JP = A(:,5:6);
IN = A(:,7:8);

%   THIRD, we call the leastsqM function on each matrix MX, DE, JP, IN:
w_MX = leastsqM(MX(:,1),MX(:,2))
w_DE = leastsqM(DE(:,1),DE(:,2))
w_JP = leastsqM(JP(:,1),JP(:,2))
w_IN = leastsqM(IN(:,1),IN(:,2))

%   FOURTH, we use the available information to predict the white blood
%   cell count after t = 15 days for each country.
factor = [1 15];
MX_t15 = factor * w_MX
DE_t15 = factor * w_DE
JP_t15 = factor * w_JP
IN_t15 = factor * w_IN

%   FIFTH, we grpah the scatter plot and least squares approximation line
%   witht he given data and the found elements in w for each country.
sz = 25;
x = linspace(0,21,50);
%       MX scatter
scatter(MX(:,1),MX(:,2),sz, [0 0 0.6],'filled', 'DisplayName', 'Observaciones')
title ("Conteo GB México")
xlabel ("Tiempo tomando medicamento XYZ = t")
ylabel ("Conteo GB tras tiempo t")
xlim ([0 16])
hold on
y = w_MX(2)*x+w_MX(1);
plot(x,y, 'g-', 'DisplayName', 'y = mx + b')
hold on
plot (15, MX_t15, 'r*', 'DisplayName', str)
str = append ("(15,",string (round(MX_t15,3)),")")
hold off
legend
%       DE scatter
scatter(DE(:,1),DE(:,2),sz, [0 0 0.6],'filled', 'DisplayName', 'Observaciones')
title ("Conteo GB Alemania")
xlabel ("Tiempo tomando medicamento XYZ = t")
ylabel ("Conteo GB tras tiempo t")
xlim ([0 16])
hold on
y = w_DE(2)*x+w_DE(1);
plot(x,y, 'g-', 'DisplayName', 'y = mx + b')
hold on
plot (15, DE_t15, 'r*', 'DisplayName', str)
str = append ("(15,",string (round(DE_t15,3)),")")
hold off
legend
%       JP scatter
scatter(JP(:,1),JP(:,2),sz, [0 0 0.6],'filled', 'DisplayName', 'Observaciones')
title ("Conteo GB Japón")
xlabel ("Tiempo tomando medicamento XYZ = t")
ylabel ("Conteo GB tras tiempo t")
xlim ([0 16])
hold on
y = w_JP(2)*x+w_JP(1);
plot(x,y, 'g-', 'DisplayName', 'y = mx + b')
hold on
plot (15, JP_t15, 'r*', 'DisplayName', str)
str = append ("(15,",string (round(JP_t15,3)),")")
hold off
legend
%       IN scatter
scatter(IN(:,1),IN(:,2),sz, [0 0 0.6],'filled', 'DisplayName', 'Observaciones')
title ("Conteo GB India")
xlabel ("Tiempo tomando medicamento XYZ = t")
ylabel ("Conteo GB tras tiempo t")
xlim ([0 20])
hold on
y = w_IN(2)*x+w_IN(1);
plot(x,y, 'g-', 'DisplayName', 'y = mx + b')
hold on
plot (15, IN_t15, 'r*', 'DisplayName', str)
str = append ("(15,",string (round(IN_t15,3)),")")
hold off
legend

%   SIXTH, we graph all the information in one same graph
sz = 25;
x = linspace(0,21,50);
%       MX scatter
scatter(MX(:,1),MX(:,2),sz, "g",'filled', 'DisplayName', 'Observ. MX')
title ("Conteo GB global")
xlabel ("Tiempo tomando medicamento XYZ = t")
ylabel ("Conteo GB tras tiempo t")
xlim ([0 21])
hold on
y = w_MX(2)*x+w_MX(1);
plot(x,y, 'g-', 'DisplayName', 'y, MX')
hold on
plot (15, MX_t15, 'g*', 'DisplayName', str)
str = append ("MX: (15,",string (round(MX_t15,3)),")")
%       DE scatter
hold on
scatter(DE(:,1),DE(:,2),sz, "r",'filled', 'DisplayName', 'Observ. DE')
hold on
y = w_DE(2)*x+w_DE(1);
plot(x,y, 'r-', 'DisplayName', 'y, DE')
hold on
plot (15, DE_t15, 'r*', 'DisplayName', str)
str = append ("DE: (15,",string (round(DE_t15,3)),")")
%       JP scatter
hold on
scatter(JP(:,1),JP(:,2),sz, "m",'filled', 'DisplayName', 'Observ. JP')
hold on
y = w_JP(2)*x+w_JP(1);
plot(x,y, 'm-', 'DisplayName', 'y, JP')
hold on
plot (15, JP_t15, 'm*', 'DisplayName', str)
str = append ("JP: (15,",string (round(JP_t15,3)),")")
%       IN scatter
hold on
scatter(IN(:,1),IN(:,2),sz, "b",'filled', 'DisplayName', 'Observ. IN')
hold on
y = w_IN(2)*x+w_IN(1);
plot(x,y, 'b-', 'DisplayName', 'y, IN')
hold on
plot (15, IN_t15, 'b*', 'DisplayName', str)
str = append ("IN: (15,",string (round(IN_t15,3)),")")
hold off
legend
