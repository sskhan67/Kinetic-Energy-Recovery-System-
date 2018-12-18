function experiment=runExperiment(experiment)


% Öffne das Modell
%open_system(experiment.ModelName);

% Setzen der Modellparameter
WSdata=SetModelParameters(experiment);

% Erzeugen einer Simulations-Konfiguration
cs= CreateSimulationParameters(experiment);

% Ausführen der Simulation mit der erzeugten Konfig.
simOut=sim(experiment.ModelName,cs);

% Rückgabe von Aktiver Konfiguration
experiment.ActiveSimConfig=cs;

% Rückgabe von geloggten Daten
experiment.LoggedData=get(simOut,'logsout');


% Rückgabe des verwendeten Model-Workspace
experiment.ActiveModelWorkspace=WSdata;