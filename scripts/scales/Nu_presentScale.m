function response = Nu_presentScale(scale, stimulus, screenConfig, outlet)
    % Present the stimulus
    Nu_drawStimulus(stimulus, screenConfig, outlet);

    % Wait 500ms
    WaitSecs(0.5);

    % Present the scale
    if strcmp(scale.type, 'SAM')
        response = Nu_drawSAMScale(scale, screenConfig, stimulus, outlet);
    elseif strcmp(scale.type, 'Likert')
        response = Nu_drawLikertScale(scale, screenConfig, stimulus, outlet);
    end
end