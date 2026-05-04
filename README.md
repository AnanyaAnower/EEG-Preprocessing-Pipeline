# EEG-Preprocessing-Pipeline
EEG Signal Processing: Technical Reflection

In this 256-channel preprocessing pipeline, I observed that the resulting ERP waveform deviates from the "textbook" smooth peaks typically seen in human EEG. This is an intentional result of my technical methodology:  
1. Filter-Induced Morphology: I implemented a 1 Hz high-pass filter specifically to optimize the quality of the ICA decomposition. While this effectively removes low-frequency drifts for cleaner artifact rejection, it naturally attenuates the broader, slower peaks associated with standard ERPs.
2.  Independent Component (IC) Analysis: Rather than looking at global scalp summation, I focused on IC source separation (as shown in img2.jpeg). The waveform in img4.jpeg represents the activity of a specific neural generator, which often exhibits a more rhythmic firing pattern.
3.  Neural Entrainment: The rhythmic characteristics are further explained by the 1000 Hz binaural tone stimuli, which induced strong phase-locked oscillations as validated in the trial-by-trial ERP image map in img3.jpeg.
