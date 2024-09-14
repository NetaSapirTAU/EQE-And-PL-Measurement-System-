clear all;clc;


% load("PM_under_EQE_090624.mat");
%load("PM_under_EQE_using_PD_200624.mat");
%load("PM_under_EQE_using_PM_200624.mat");

load('PD_measurements_400_5_1100.mat');

load("IM_under_EQE_using_PD_270624.mat");
Iph_PD=Output_current;
load("IM_under_EQE_using_refernce_cell_270624_2.mat");
Iph_cell=Output_current;


%load("I_from_solar_cell_REFQ_measurement.mat");
Iph=Output_current;



lamda=lambda*10^-9; % in meter
p_in=Measured_Power.'; % the power of the lemp for each  lambda in W/m^2

h=6.626*10^-34; %in Js
c=299792458; % in m/s
e=1.602*10^-19; % in C
E_photon=(h*c)./lamda; % in J
photon_flex=p_in./E_photon; % the photon flex in m^2/s
electrons_collected_PD = (-Iph_PD./e); % in electron/s
electrons_collected_cell = (-Iph_cell./e); % in electron/s
EQE_measurements_cell=electrons_collected_cell./(0.95*photon_flex); 
EQE_measurements_PD=electrons_collected_PD./(0.95*photon_flex); 

hold on
plot(lambda,movmean(EQE_measurements_cell,10),'DisplayName',' Si cell EQE- Calibration Measurements ','Linewidth',3);
hold on; load ("Cal_EQE_data.mat","Cal_EQE");
load("PD_EQE_220727132.mat");


plot(Cal_EQE(12:end,1),Cal_EQE(12:end,2)./100,'DisplayName','Calibrated Si cell','Linewidth',3); hold on;
%errorbar(Cal_EQE(:,1),Cal_EQE(:,2)./100,Cal_EQE(:,2)./100-0.9*(Cal_EQE(:,2)./100),1.1*(Cal_EQE(:,2)./100)-Cal_EQE(:,2)./100,'DisplayName','Calibrated Si cell'); hold on;

plot(lambda,movmean(EQE_measurements_PD,10),'DisplayName','Photodiode EQE- Calibration Measurements ','Linewidth',4);

plot(EQE_photodiode_lambda(6:end),EQE_photodiode(6:end),'DisplayName','Photodiode EQE','Linewidth',3);
%errorbar(EQE_photodiode_lambda,EQE_photodiode,(EQE_photodiode-0.9*EQE_photodiode),(1.1*EQE_photodiode-EQE_photodiode),'DisplayName','Photodiode EQE');
legend;

xlabel("Wavelength[nm]")
ylabel("External Quantum Efficiency")
%title ("EQE Measurements")
set(gca,'Fontsize',14)

EdgeColor — Box outline color