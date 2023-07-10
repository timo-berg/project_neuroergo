function Nu_baselineScreen(screen, waitTime, outlet)
%   Inputs:
%   - screen: structure containing screen information as produced by Nu_setScreens (struct)
%   - waitTime: time to wait in seconds (numeric)
%   - outlet: outlet for the lab streaming layer (lsl_outlet)
%
%   Draws a baseline screen for the specified amount of time.

    % Define the text to be displayed
    breakText = 'Baseline: Please keep your eyes open and directed on the screen.';
    
    % Set the font size
    Screen('TextSize', screen.window, 24);
    
    % Draw the text centered in the screen
    DrawFormattedText(screen.window, breakText, 'center', 'center', screen.colors.black);
    
    % Flip the screen to display the text
    Screen('Flip', screen.window);
    outlet.push_sample({'event: baselineStart'});
    
    % Wait for the specified amount of time
    WaitSecs(waitTime);
    outlet.push_sample({'event: baselineEnd'});
end