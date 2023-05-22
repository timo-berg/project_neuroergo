function response = Nu_drawLikertScale(scale, screen, stimulus, outlet)
    
    Screen('TextSize', screen.window, 18);
    drawScale(scale, screen, stimulus);
    Screen('Flip', screen.window);
    % outlet.push_sample({"event: likertPresented; scale: " + scale.prompt.text + "; stimulus: " + stimulus.id + ";"});
    

    % Initialize response
    response = -1;

    % Get mouse click
    while true
        [x, y, buttons] = GetMouse(screen.window);
        if any(buttons)
            for i = 1:scale.numOptions
                if IsInCircle(x, y, scale.option_circles.coords(1, i), scale.option_circles.coords(2, i), scale.option_circles.radius)
                    response = i;
                    
                    drawScale(scale, screen, stimulus);
                    Screen('FillOval', screen.window, screen.colors.black, scale.selection_circles.coords(:,i), scale.selection_circles.radius);
                    Screen('Flip', screen.window);
                    % outlet.push_sample({"event: likertOptionSelected; scale: " + scale.prompt.text + "; stimulus: " + stimulus.id + ";" + "response: " + scale.response.text{i} + ";"});
                    break;
                end
            end
        end         
        % Check for keyboard stroke to confirm response
        [keyIsDown, ~, ~] = KbCheck;
        if keyIsDown && response ~= -1
            % outlet.push_sample({"event: likertOptionConfirmed; scale: " + scale.prompt.text + "; stimulus: " + stimulus.id + ";" + "response: " + scale.response.text{i} + ";"});
            break;
        end
    end
end

function drawScale(scale, screen, stimulus)
    % Draw prompt
    DrawFormattedText(screen.window, scale.prompt.text, scale.prompt.x, scale.prompt.y, scale.prompt.color);
    % Draw response text
    for i = 1:2
        DrawFormattedText(screen.window, scale.response.text{i}, 'center', 'center', scale.response.color, [], [], [], [], [], scale.response.pos(i,:));
    end
    % Draw scale
    Screen('FillOval', screen.window, screen.colors.white, scale.option_circles.coords, scale.option_circles.radius);
    Screen('FrameOval', screen.window, screen.colors.black, scale.option_circles.coords, scale.option_circles.border_width);

    % Draw stimulus image
    Screen('DrawTexture', screen.window, stimulus.texture, [], stimulus.pos);
end

