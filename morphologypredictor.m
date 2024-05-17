%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This Program can be used for the prediction of final particle morphology   %
%                  developed by 'Ali Monsef'                                 %
%               Contact: alimonsef1997@gmail.com                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clearvars;
%%%%%%%%%%%%%%%%%%% user inputs from droplet data %%%%%%%%%%%%%%%%%%%%%%%%
ms_input = input('Enter final solid mass (m_s) (ug): ','s');
m_s = str2double(ms_input);
rhos_input = input('Enter final solid density (rho_s) (kg/m^3): ','s');
rho_s = str2double(rhos_input);
Rf_input = input('Enter final droplet radius (R_f) (mm): ','s');
R_f = str2double(Rf_input);
epsilon_input = input('Enter shell porosity (epsilon): ','s');
epsilon = str2double(epsilon_input);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
condition_value = ((3*m_s) / (4*pi*(1 - epsilon)*rho_s)) ^ 0.333;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp ('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('This Program has been developed by "Ali Monsef"');
disp('Contact: alimonsef1997@gmail.com');
disp ('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp(['The condition_value determining type of final morphology = ', num2str(condition_value)]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if condition_value < R_f

    disp('condition value < R_f ====> Final particle morphology is hollow');
    img = imread('particle_image.png');
    [h, w, ~] = size(img);
    screenSize = get(0,'Screensize');
    centerX = screenSize(3)/2 - w/2;
    centerY = screenSize(4)/2 - h/2;
    fig = figure('Position',[centerX centerY w h]);
    ax = axes;
    imshow(img);
    axis off;
    set(fig,'Name','morphology=Hollow Particle');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif condition_value == R_f

    disp('condition value = R_f ====> Final particle morphology is solid');
    img = imread('particle_image2.png');
    [h, w, ~] = size(img);
    screenSize = get(0,'Screensize');
    centerX = screenSize(3)/2 - w/2;
    centerY = screenSize(4)/2 - h/2;
    fig = figure('Position',[centerX centerY w h]);
    ax = axes;
    imshow(img);
    axis off;
    set(fig,'Name','morphology=Solid Particle');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
else
    disp('condition value > R_f ====> Final Morphology is not hollow or solid, Maybe : Porous/Core-shell/Janus/Rod_platelet shapes/Gel');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end