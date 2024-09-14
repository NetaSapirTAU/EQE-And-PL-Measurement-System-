clear all

load("PL_power_sphere.mat");
load("PL_spect_sphere.mat");
lambda_sphere=lambda(2:17);
load("‏‏PL_power.mat");
load("‏‏PL_spect.mat");
lambda=lambda(1:61);
A_PL=zeros(size(lambda));
A_PL_sphere=zeros(size(lambda_sphere));
lambda_start = 750;
lambda_end = 950;

start_idx = find(PL_lambda >= lambda_start, 1, 'first');
end_idx = find(PL_lambda <= lambda_end, 1, 'last');

PL_lambda_subset = PL_lambda(start_idx:end_idx);
PL_lambda_subset_sphere = PL_lambda_sphere(start_idx:end_idx);
PL_subset = PL(start_idx:end_idx,:);
PL_subset_sphere = PL_sphere(start_idx:end_idx,:);

for i = 1: length(A_PL) 
    A_PL(i)=trapz(PL_lambda_subset,PL_subset(:,i));
end

for i = 1: length(A_PL_sphere) 
    A_PL_sphere(i)=trapz(PL_lambda_subset_sphere,PL_subset_sphere(:,i));
end



%plot(PL_lambda,PL(:,27))
%plot(PL_lambda,PL)
%hold on
%plot(PL_lambda_sphere,PL_sphere(:,6))

yyaxis right
plot(lambda,A_PL./Measured_Power(1:61)','Linewidth',3); 

xlabel("Wavelength[nm]")
ylabel("Area under PL /Power - our system")
hold on
yyaxis left
plot(lambda_sphere,A_PL_sphere./Measured_power_sphere(2:17)','Linewidth',3);
ylabel("Area under PL /Power",'Color',"k")
%title ("PL meaeurement - our system as sphere system")

set(gca,'Fontsize',14)

%plot(x,y,'Linewidth',2)

%plot(x,y,'Color','k','Linewidth',2)


