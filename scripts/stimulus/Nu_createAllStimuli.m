function stimuli = Nu_createAllStimuli(screen)
    ressourceFolder = "./ressources/stimuli/";
    % Get list of all pictures in the ressources/stimuli folder
    stimuli_filenames = dir(strcat(ressourceFolder, "*.jpg"));

    % Create an empty array of structs
    stimuli = [];

    % Create a stimulus for every picture with random order
    for i = randperm(length(stimuli_filenames))
        % Get full filepath
        stimuliPath = strcat(ressourceFolder, stimuli_filenames(i).name);
        
        % Create stimulus and add it to the array
        stimuli = [stimuli Nu_createStimulus(stimuliPath, screen)];
    end
end