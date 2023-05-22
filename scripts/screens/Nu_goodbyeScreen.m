function Nu_goodbyeScreen(screen)
    % Draw a goodbye screen
    DrawFormattedText(screen.window, 'Thank you for participating!', 'center', 'center', screen.colors.white);
    Screen('Flip', screen.window);
    KbWait;
end