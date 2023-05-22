function scale = Nu_createLikertScale(prompt, screen)
    % Scale settings
    gap = 75;
    radius_option = 10;
    radius_select = 7;
    
    numOptions = 5;
    textGap = 75;
    ycenter = screen.center.y*1.75;
    
    % Create rectangles and circles
    circles_select = nan(4, numOptions);
    circles_option = nan(4, numOptions);

    for i = 1:numOptions
        baseX = screen.center.x - (numOptions-1)/2 * gap + (i-1) * gap;
        circles_select(:, i) = [baseX - radius_select, ycenter - radius_select, baseX + radius_select, ycenter + radius_select];
        circles_option(:, i) = [baseX - radius_option, ycenter - radius_option, baseX + radius_option, ycenter + radius_option];
    end

    scale.option_circles.coords = circles_option;
    scale.option_circles.radius = radius_option;
    scale.option_circles.border_width = 2;

    scale.selection_circles.coords = circles_select;
    scale.selection_circles.radius = radius_select;
    
    scale.numOptions = numOptions;
    
    scale.response.text = {'not at all', 'very much'};
    scale.response.pos = [circles_option(1, 1) - textGap - 10, ycenter - 10, circles_option(1, 1) - textGap + 10, ycenter + 10; circles_option(1, end) + textGap - 10, ycenter - 10, circles_option(1, end) + textGap + 10, ycenter + 10];
    scale.response.color = screen.colors.black;

    % Create prompt
    scale.prompt.text = prompt;
    scale.prompt.x = 'center';
    scale.prompt.y = ycenter - 50;
    scale.prompt.color = screen.colors.black;

    scale.type = "Likert";
end