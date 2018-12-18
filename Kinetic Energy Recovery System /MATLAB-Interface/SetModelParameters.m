function WSdata=SetModelParameters(experiment)

%Model-Workspace-Handle erzeugen für das definierte Simulink-Modell
hws = get_param(experiment.ModelName, 'modelworkspace');

%Laden des Model-Workspace aus der ebenfalls im modell definierten Quelle
%(MAT-File). Achtung, die durch das Modell verwendete Quelldatei wird nur
%im Model-Explorer gewählt, nicht durch diesen Eintrag!
WSdata=load(experiment.WorkspaceFileName);

% initial States schreiben, diese liegen als VARIABLEN im Model-WS
if isfield(experiment,'InitialStateVars') && ~isempty(experiment.InitialStateVars)
VarsToSet=fieldnames(experiment.InitialStateVars);
for i=1:size(VarsToSet,1)
   %Beschreiben einer über das experiment.InitialStateVars-Struct definierten 
   %Variablen im Model-Workspace (Name=Feldname,Wert=Feldinhalt)
    WSdata.(VarsToSet{i})=experiment.InitialStateVars.(VarsToSet{i});
    
end
end


% Modellparameter schreiben, diese liegen als Simulink.Parameter-Objekte im Model-WS
if isfield(experiment,'ModelParameter') && ~isempty(experiment.ModelParameter)
% Liste der Namen aller zu setzender Parameter
VarsToSet=fieldnames(experiment.ModelParameter);
%Für alle Parameter
for i=1:size(VarsToSet,1)
   %Beschreiben eines über das experiment.ModelParameter-Struct definierten 
   %Simulink-Parameters im Model-Workspace (Name=Feldname,Wert=Feldinhalt)
    WSdata.(VarsToSet{i}).Value=experiment.ModelParameter.(VarsToSet{i});
    
end
end

%Speichern der veränderten Daten in die ausgewählte Quelldatei
save(experiment.WorkspaceFileName,'-struct','WSdata')



hws.reload

