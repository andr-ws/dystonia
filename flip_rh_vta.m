% Create the directory
mkdir('/Users/neuro-239/imaging/datasets/cd/derivatives/leadgroup/direc/vtas');

% List of IDs
ids = [10, 14, 15, 17, 24, 30, 31, 34, 35, 37, 38, 40, 48, 51, 52, 53, 54, 55, 56, 59, 60, 61];

% Loop over each ID
for i = 1:length(ids)
    id = ids(i);
    
    % Define input and output file paths
    input_file = sprintf('/Users/neuro-239/imaging/datasets/cd/derivatives/sub-%d/stimulations/MNI152NLin2009bAsym/gs_direc/sub-%d_sim-binary_model-simbio_hemi-R.nii', id, id);
    output_file = sprintf('/Users/neuro-239/imaging/datasets/cd/derivatives/leadgroup/direc/vtas/sub-%d_sim-binary_model-simbio_hemi-R-to-L.nii', id);
    
    % Call the function ea_flip_lr_nonlinear
    ea_flip_lr_nonlinear(input_file, output_file, 1);
end
