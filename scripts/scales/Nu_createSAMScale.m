function scale = Nu_createSAMScale(type, screen)
%   Input:
%   - type: either 'pleasure', 'arousal', 'dominance' (character array)
%   - screen: screen information as provided by Nu_setScreens (struct)
%   Output:
%   - scale: scale information with the following fields (struct)
%       - option_circles: coordinates of the circles for each option (4 x numOptions matrix)
%       - selection_circles: coordinates of the circles for each selection (4 x numOptions matrix)
%       - numOptions: number of options (integer)
%       - response: response information with the SAM image, the limit text and their position (struct)
%       - prompt: prompt information with the text and its position (struct)
%       - type: type of scale (character array)
%
%   Creates a SAM scale for the given type. The struct contains
%   all the necessary information to display the scale.

    % Scale settings
    samScaleFactor = 0.6;
    gap = 95 * samScaleFactor;
    radius_option = 10;
    radius_select = 7;
    textGap = 75;

    numOptions = 9;
    ycenter = screen.center.y*1.9;
    ressourceFolder = "./ressources/SAM/";
    

    % Define type
    prompt = 'How does this space make you feel?';
    
    if strcmp(type, 'pleasure')
        limit_text = {'happy', 'unhappy'};
        samImagePath = ressourceFolder + "SAMpleasure.jpg";
    elseif strcmp(type, 'arousal')
        limit_text = {'excited', 'calm'};
        samImagePath = ressourceFolder + "SAMarousal.jpg";
    elseif strcmp(type, 'dominance')
        limit_text = {'controlled', 'in control'};
        samImagePath = ressourceFolder + "SAMdominance.jpg";
    end

    samImage = imread(samImagePath);

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
    
    scale.response.texture = Screen('MakeTexture', screen.window, samImage);
    scale.response.pos = CenterRectOnPointd([0 0 samScaleFactor*size(samImage, 2) samScaleFactor*size(samImage, 1)], screen.center.x, ycenter-120*samScaleFactor);

    scale.response.text = limit_text;
    scale.response.limit_pos = [circles_option(1, 1) - textGap - 10, ycenter - 10, circles_option(1, 1) - textGap + 10, ycenter + 10; circles_option(1, end) + textGap - 10, ycenter - 10, circles_option(1, end) + textGap + 10, ycenter + 10];
    scale.response.color = screen.colors.black;

    % Create prompt
    scale.prompt.text = prompt;
    scale.prompt.x = 'center';
    scale.prompt.y = ycenter - 225*samScaleFactor;
    scale.prompt.color = screen.colors.black;

    scale.type = ['SAM-' type];
end