function experiment=runExperiment(experiment)


% �ffne das Modell
%open_system(experiment.ModelName);

% Setzen der Modellparameter
WSdata=SetModelParameters(experiment);

% Erzeugen einer Simulations-Konfiguration
cs= CreateSimulationParameters(experiment);

% Ausf�hren der Simulation mit der erzeugten Konfig.
simOut=sim(experiment.ModelName,cs);

% R�ckgabe von Aktiver Konfiguration
experiment.ActiveSimConfig=cs;

% R�ckgabe von geloggten Daten
experiment.LoggedData=get(simOut,'logsout');


% R�ckgabe des verwendeten Model-Workspace
experiment.ActiveModelWorkspace=WSdata;