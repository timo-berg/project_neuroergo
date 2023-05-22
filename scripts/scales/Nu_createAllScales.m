function scales = Nu_createAllScales(screenConfig)
    % Create scales
    scales.sam.pleasure = Nu_createSAMScale('pleasure', screenConfig);
    scales.sam.arousal = Nu_createSAMScale('arousal', screenConfig);
    scales.sam.dominance = Nu_createSAMScale('dominance', screenConfig);

    scales.likert.openness = Nu_createLikertScale('How open does this environment feel to you?', screenConfig);
    scales.likert.hominess = Nu_createLikertScale('How homely does this environment feel to you?', screenConfig);
    scales.likert.safety = Nu_createLikertScale('How safe does this environment feel to you?', screenConfig);
    scales.likert.fascination = Nu_createLikertScale('How fascinating does this environment feel to you?', screenConfig);
    scales.likert.beauty = Nu_createLikertScale('How beautiful does this environment feel to you?', screenConfig);
end