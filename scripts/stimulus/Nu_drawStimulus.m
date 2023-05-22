function Nu_drawStimulus(stimulus, screen, outlet)
    Screen('DrawTexture', screen.window, stimulus.texture, [], stimulus.pos);
    Screen('Flip', screen.window);
    % outlet.push_sample({"event: presentedStimulus; stimulus:" + stimulus.id});
end