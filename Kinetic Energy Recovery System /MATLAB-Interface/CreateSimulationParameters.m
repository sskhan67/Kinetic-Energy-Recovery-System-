function cs= CreateSimulationParameters(experiment)


cs = getActiveConfigSet(experiment.ModelName);


% Liste der NAmen aller zu setzender Parameter

if isfield(experiment,'SimulationParameter') && ~isempty(experiment.SimulationParameter)
VarsToSet=fieldnames(experiment.SimulationParameter);



%Für alle Parameter
for i=1:size(VarsToSet,1)
    
 %Setzen des Konfigurationsparameters für das definierte Modell   
 set_param(cs,VarsToSet{i},experiment.SimulationParameter.(VarsToSet{i}))


 
  end
end


