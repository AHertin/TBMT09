%{
Simulation of a two compartment lung with volumes
V1 and V2 and relative ventilation DV1 and DV2.
Concentration of nitrogen is C1 and C2, initially
C1 = C2 = 80%. Expired gas concentration, Cet, is a
weighted sum of C1 and C2, weighted by their relative
ventilations DV1 and DV2. Add your changes at marked places.
%}

DV1 = [0.2 0.1 0.05];
DV2 = [0.3 0.4 0.45];
V1 = 2;
V2 = 2;

% initialize concentrations
C1 = ones(1,3)*0.8;
C2 = ones(1,3)*0.8;
Cet = ones(1,3)*0.8;

N = [];
Vdaw = 0.1;                                 % Only used in exercise 5

for i = 1:size(DV1,2)         % for all the three lung inhomogeneity cases
    j = 1;
    while Cet(j, i) > 0.02
        j = j + 1;
        % dummy C1, C2 and Cet. Replace definitions with yours
%         C1(j, i) = C1(j-1,i) - 0.01;
%         C2(j, i) = C2(j-1,i) - 0.02;
%         Cet(j,i) = C1(j-1,i) + C2(j-1,i);

        % Better ones would be something like
        % Cn(j)  = (Vn * C(j-1)) / (Vn + DVn(i))
        % Cet(j) = C1(j) + C2(j)
        % Where n = [1, 2]
        C1(j, i) = (V1 .* C1(j-1,i)) ./ (V1 + DV1(i)); % From lab compendium
        C2(j, i) = (V2 .* C2(j-1,i)) ./ (V2 + DV2(i));
        Cet(j,i) = (DV1(i) .* C1(j,i) + DV2(i) .* C2(j,i)) ./ 0.5;

        
    end
    N(i) = j - 1;    % N is the number of breaths
end

x1=1:N(1);
y1=C1(x1,1);
x2=x1;
y2=C2(x2,1);
x3=x1;
y3=Cet(x3,1);
subplot(3,1,1),plot(x1,y1,'.-',x2,y2,'.-',x3,y3,'-o');
legend('C1','C2','C_{et}');
ylabel('DV: 0.2-0.3','FontWeight','Bold');
xlabel('Breath number','FontWeight','Bold','Fontsize',12);
title('N2 washout for three different ventilation distributions','FontWeight','Bold','Fontsize',12);
axis([0 max([N(1) N(2) N(3)]) 0 1]);

x1=1:N(2);
y1=C1(x1,2);
x2=x1;
y2=C2(x2,2);
x3=x1;
y3=Cet(x3,2);
subplot(3,1,2),plot(x1,y1,'.-',x2,y2,'.-',x3,y3,'-o');
legend('C1','C2','C_{et}');
ylabel('DV: 0.1-0.4','FontWeight','Bold');
xlabel('Breath number','FontWeight','Bold','Fontsize',12);
axis([0 max([N(1) N(2) N(3)]) 0 1]);

x1=1:N(3);
y1=C1(x1,3);
x2=x1;
y2=C2(x2,3);
x3=x1;
y3=Cet(x3,3);
subplot(3,1,3),plot(x1,y1,'.-',x2,y2,'.-',x3,y3,'-o');
legend('C1','C2','C_{et}');
ylabel('DV: 0.05-0.45','FontWeight','Bold');
xlabel('Breath number','FontWeight','Bold','Fontsize',12);
axis([0 max([N(1) N(2) N(3)]) 0 1]);