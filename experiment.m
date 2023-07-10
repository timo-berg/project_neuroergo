addpath(genpath(".\scripts\"));

clear

% Initialize variables
session = struct();

% Get the participant ID via the console
session.participant.id = string(input('Please enter the participant ID: ', 's'));

% Create an empty table for the results with the following columns
% participantID, stimulusID, pleasure, arousal, dominance, openness, hominess, safety, fascination, beauty
session.results = table('Size', [0, 10], 'VariableTypes', {'string', 'string', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double'}, 'VariableNames', {'participantID', 'stimulusID', 'pleasure', 'arousal', 'dominance', 'openness', 'hominess', 'safety', 'fascination', 'beauty'});

% Set the screen configuration
screenConfig  = Nu_setScreens();
% Create LSL outlet
outlet = Nu_createLSLOutlet('NeurUrbanismMarkers');

% Create scales
scales = Nu_createAllScales(screenConfig);
% Create a stimulus
stimuli = Nu_createAllStimuli(screenConfig, ".\ressources\stimuli\");
halfIdxStimuli = floor(length(stimuli)/2);

% Experimental procedure
% 
% 1. Present the stimulus for 500ms
% 2. Present the scale
% 3. Get the response
% 4. Repeat 1-3

% Welcome screen
Nu_welcomeScreen(screenConfig);

outlet.push_sample({'event: experimentStart'});

% First Baseline
Nu_baselineScreen(screenConfig, 3*60, outlet); % 3 minutes

% Present the stimuli
for stimulusIdx = 1:halfIdxStimuli
    % Set the stimulus
    stimulus = stimuli(stimulusIdx);

    % Present all scales
    beautyResponse = Nu_presentScale(scales.likert.beauty, stimulus, screenConfig, outlet);
    hominessResponse = Nu_presentScale(scales.likert.hominess, stimulus, screenConfig, outlet);
    opennessResponse = Nu_presentScale(scales.likert.openness, stimulus, screenConfig, outlet);
    fascinationResponse = Nu_presentScale(scales.likert.fascination, stimulus, screenConfig, outlet);
    safetyResponse = Nu_presentScale(scales.likert.safety, stimulus, screenConfig, outlet);
    

    pleasureResponse = Nu_presentScale(scales.sam.pleasure, stimulus, screenConfig, outlet);
    arousalResponse = Nu_presentScale(scales.sam.arousal, stimulus, screenConfig, outlet);
    dominanceResponse = Nu_presentScale(scales.sam.dominance, stimulus, screenConfig, outlet);

    % Append the responses to the session.results table
    trialResults = table(session.participant.id, string(stimulus.id), pleasureResponse, arousalResponse, dominanceResponse, opennessResponse, hominessResponse, safetyResponse, fascinationResponse, beautyResponse, 'VariableNames', {'participantID', 'stimulusID', 'pleasure', 'arousal', 'dominance', 'openness', 'hominess', 'safety', 'fascination', 'beauty'});
    session.results = [session.results; trialResults];
end

% Break screen
Nu_breakScreen(screenConfig, 120, outlet); % 2 minutes

% Present the stimuli second half
for stimuliIdx = halfIdxStimuli+1:length(stimuli)
    % Set the stimulus
    stimulus = stimuli(stimuliIdx);

    % Present all scales
    beautyResponse = Nu_presentScale(scales.likert.beauty, stimulus, screenConfig, outlet);
    hominessResponse = Nu_presentScale(scales.likert.hominess, stimulus, screenConfig, outlet);
    opennessResponse = Nu_presentScale(scales.likert.openness, stimulus, screenConfig, outlet);
    fascinationResponse = Nu_presentScale(scales.likert.fascination, stimulus, screenConfig, outlet);
    safetyResponse = Nu_presentScale(scales.likert.safety, stimulus, screenConfig, outlet);
    
    pleasureResponse = Nu_presentScale(scales.sam.pleasure, stimulus, screenConfig, outlet);
    arousalResponse = Nu_presentScale(scales.sam.arousal, stimulus, screenConfig, outlet);
    dominanceResponse = Nu_presentScale(scales.sam.dominance, stimulus, screenConfig, outlet);

    % Append the responses to the session.results table
    trialResults = table(session.participant.id, string(stimulus.id), pleasureResponse, arousalResponse, dominanceResponse, opennessResponse, hominessResponse, safetyResponse, fascinationResponse, beautyResponse, 'VariableNames', {'participantID', 'stimulusID', 'pleasure', 'arousal', 'dominance', 'openness', 'hominess', 'safety', 'fascination', 'beauty'});
    session.results = [session.results; trialResults];
end

% Write the results to a csv file
writetable(session.results, ['.\results\results_' convertStringsToChars(session.participant.id) '.csv']);

Nu_baselineScreen(screenConfig, 3*60, outlet); % 3 minutes

% Experiment end message
Nu_goodbyeScreen(screenConfig);

outlet.push_sample({'event: experimentEnd'});

% Close the screen 
Screen('CloseAll');

