function Nu_welcomeScreen(screen)
    % Set up the screen
    Screen('TextSize', screen.window, 24);
    Screen('TextFont', screen.window, 'Arial');
    Screen('FillRect', screen.window, screen.colors.white);

    % Draw the welcome message
    DrawFormattedText(screen.window, 'Welcome to the experiment!\n\nPress any key to continue.', 'center', 'center', screen.colors.black);
    Screen('Flip', screen.window);
    KbWait;

    % Clear the screen before the start of the experiment
    Screen('FillRect', screen.window, screen.colors.white);
    Screen('Flip', screen.window);
end