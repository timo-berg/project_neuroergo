function scales = Nu_createAllScales(screenConfig)
%   Input:
%   - screenConfig: screen configuration struct as provided by Nu_setScreens (struct)
%   Output:
%   - scales: struct containing all scales with the following fields (struct)
%       - sam: SAM scales (struct)
%       - likert: Likert scales (struct)
%
%   Creates all scales used in the experiment and returns them in a struct.

    % Create scales
    scales.sam.pleasure = Nu_createSAMScale('pleasure', screenConfig);
    scales.sam.arousal = Nu_createSAMScale('arousal', screenConfig);
    scales.sam.dominance = Nu_createSAMScale('dominance', screenConfig);

    scales.likert.openness = Nu_createLikertScale('How open do you perceive the environment to be?', 'openness' ,screenConfig);
    scales.likert.hominess = Nu_createLikertScale('How homey do you find this place?', 'hominess' ,screenConfig);
    scales.likert.safety = Nu_createLikertScale('How safe do you perceive the environment to be?', 'safety' ,screenConfig);
    scales.likert.fascination = Nu_createLikertScale('How fascinating do you find this place?', 'fascination' ,screenConfig);
    scales.likert.beauty = Nu_createLikertScale('How beautiful do you find this place?', 'beauty' ,screenConfig);
end