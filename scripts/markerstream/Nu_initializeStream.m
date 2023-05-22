% Import eeglab
eeglab;

% Load the data
EEG = pop_loadset('filename', 'sub-01_task-imagery_eeg.set', 'filepath', 'data/');
EEG = eeg_checkset( EEG );

% Load the channel locations
EEG = pop_chanedit(EEG, 'lookup','standard-10-5-cap385.elp');
EEG = eeg_checkset( EEG );

% Remove the baseline
EEG = pop_rmbase( EEG, [],[]);
EEG = eeg_checkset( EEG );

% Epoch the data
EEG = pop_epoch( EEG, {  '1'  '2'  '3'  '4'  '5'  '6'  '7'  '8'  }, [-1  3], 'newname', 'sub-01_task-imagery_eeg_epochs', 'epochinfo', 'yes');

% Remove the baseline
EEG = pop_rmbase( EEG, [-1000  -500],[]);

% Calculate the ERPs
