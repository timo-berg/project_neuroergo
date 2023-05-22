function stimulus = Nu_createStimulus(filepath, screen)
    % Get the filename of the path as the stimulus id
    [~, id, ~] = fileparts(filepath);

    stimulusImage = imread(filepath);

    stimulusHeight = 0.75 * screen.height;
    % Stimulus width is calculated to keep the aspect ratio of the image
    stimulusWidth = stimulusHeight * size(stimulusImage, 2) / size(stimulusImage, 1);

    stimulus.id = id;
    stimulus.texture = Screen('MakeTexture', screen.window, stimulusImage);
    stimulus.pos = CenterRectOnPointd([0 0 stimulusWidth stimulusHeight], screen.center.x, screen.center.y*0.80);
end