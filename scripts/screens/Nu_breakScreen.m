function Nu_breakScreen(screen, waitTime)
    % Define the text to be displayed
    breakText = 'Taking a 2-minute break. Please do not press any key until the break is over.';
    
    % Set the font size
    Screen('TextSize', screen.window, 24);
    
    % Draw the text centered in the screen
    DrawFormattedText(screen.window, breakText, 'center', 'center', screen.colors.black);
    
    % Flip the screen to display the text
    Screen('Flip', screen.window);
    
    % Wait for the specified amount of time
    WaitSecs(waitTime);
end