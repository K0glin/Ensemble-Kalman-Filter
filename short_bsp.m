%% Modell von Short: L�sen und Plotten - ein Beispiel

%% Anfangswerte und Parameter des Modells

B0 = 0.5; % Anfangswert, unverf�lscht
rho0 = 0.1; % Anfangswert, unverf�lscht

eta = 0.4;
A0 = 0.1;
B_asterisk = 0.5;


%% Zeitangaben
t_start = 0; % Startzeit
t_delta = 1; % Zeitabstand Zeitschritt
t_end = 12; % Endzeit

t_num = round((t_end-t_start)/t_delta); % Anzahl der Zeitschritte
% Dadurch kann t_end um <t_delta �berschritten werden!

%% Simulation durchf�hren mit Anfangswerten rho0 und B0
[model, u_gen] = Short(rho0, B0, eta, A0, B_asterisk, t_start, t_delta, t_end);

%% L�sungen plotten
t_end = t_start+t_num*t_delta;
for i=0:t_num
    figure
    subplot(2,1,1) % Attraktivit�t
    pdeplot(model, 'xydata', u_gen(:,1,t_num-i+1), 'contour', 'off', 'colormap', 'jet');
    title(['Attraktivit�t zu T=',num2str(t_end-i*t_delta)])
    xlabel('x-Koordinate')
    ylabel('y-Koordinate')
    axis equal
    caxis([0, 1]);
    
    subplot(2,1,2) % Einbrecher
    pdeplot(model, 'xydata', u_gen(:,2,t_num-i+1), 'contour', 'off', 'colormap', 'jet');
    title(['Verbrecherdichte zu T=',num2str(t_end-i*t_delta)])
    xlabel('x-Koordinate')
    ylabel('y-Koordinate')
    axis equal
    caxis([0, 1]);
end
for i=0:t_num
    figure
    w(:,t_num-i+1)=u_gen(:,1,t_num-i+1).*u_gen(:,2,t_num-i+1);
    
    pdeplot(model, 'xydata', w(:,t_num-i+1), 'contour', 'off', 'colormap', 'jet');
    title(['Wahrscheinlichkeitsdichte zu T=',num2str(t_end-i*t_delta)])
    xlabel('x-Koordinate')
    ylabel('y-Koordinate')
    axis equal
    caxis([0, 1]);
end

%%
