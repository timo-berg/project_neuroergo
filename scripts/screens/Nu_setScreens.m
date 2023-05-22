function screenConfig = Nu_setScreens()
    Screen('Preference', 'SkipSyncTests', 1);
    screens = Screen('Screens');

    % Draw to the external screen if avaliable
    screenConfig.screenNumber = max(screens);

    % Define black and white
    screenConfig.colors.white = WhiteIndex(screenConfig.screenNumber);
    screenConfig.colors.black = BlackIndex(screenConfig.screenNumber);
    % screenConfig.colors.grey = screenConfig.colors.white / 2;
    
    % Open an on screen window
    [window, windowRect] = PsychImaging('OpenWindow', screenConfig.screenNumber, screenConfig.colors.white);
    [centerX, centerY] = RectCenter(windowRect);

    screenConfig.window = window;
    screenConfig.center.x = centerX;
    screenConfig.center.y = centerY;
    screenConfig.width = windowRect(3);
    screenConfig.height = windowRect(4);
end