% Automated EEG Preprocessing Pipeline
% Project: PhD Interview Task (Unfinished/Research Phase)
% Description: 256-channel high-density EEG preprocessing using EEGLAB

% 1. Import Data (Update filename to your local path)
EEG = pop_biosig('your_data_file.edf');

% 2. High-pass Filter (1 Hz) for ICA optimization
EEG = pop_eegfiltnew(EEG, 'locutoff', 1, 'plotfreqz', 1);

% 3. Load Channel Locations (GSN-HydroCel-256)
% Note: Ensure the .sfp file is in your MATLAB path
EEG = pop_chanedit(EEG, {'lookup', 'GSN-HydroCel-256.sfp'});

% 4. Clean Raw Data (Artifact Rejection)
EEG = pop_clean_rawdata(EEG, 'FlatlineCriterion', 5, 'ChannelCriterion', 0.8, ...
    'LineNoiseCriterion', 4, 'Highpass', 'off', 'BurstCriterion', 20, ...
    'WindowCriterion', 0.25, 'BurstRejection', 'on');

% 5. Re-reference to Average
EEG = pop_reref(EEG, []);

% 6. Baseline Correction (-200ms to 0ms)
EEG = pop_rmbase(EEG, [-200 0], []);

% 7. ICA & Component Classification (ICLabel)
EEG = pop_iclabel(EEG, 'default');
EEG = pop_icflag(EEG, [NaN NaN; 0.9 1; 0.9 1; NaN NaN; NaN NaN; NaN NaN; NaN NaN]);

% 8. Low-pass Filter (30 Hz) for ERP visualization
EEG = pop_eegfiltnew(EEG, 'locutoff', 30, 'plotfreqz', 1);

% 9. Epoching (-200ms to 800ms)
EEG = pop_epoch(EEG, {}, [-0.2 0.8], 'newname', 'Filtered Epochs', 'epochinfo', 'yes');
EEG = pop_rmbase(EEG, [-200 0], []);

% 10. Visualization
pop_erpimage(EEG, 1, [1], [[]], 'E1', 10, 1, {}, [], '', 'erp', 'on');