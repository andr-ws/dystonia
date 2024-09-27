#!/bin/bash

# Directory containing the .nii.gz files
directory=/Users/neuero-239/Desktop/cd/vtas

for direc in conventional directional ring; do 

# Automatically create the list of .nii.gz files in the directory
file_list=($(ls "$directory"/${direc}/resampled/*.nii.gz))

# Output filename
output_file="${directory}/${direc}/resampled/${direc}_n_map.nii.gz"

# Check if there are files in the list
if [ ${#file_list[@]} -eq 0 ]; then
  echo "No .nii.gz files found in the directory."
  exit 1
fi

# Initialize the command with the first file
command="fslmaths ${file_list[0]}"

# Loop through the rest of the files and append the -add commands
for ((i=1; i<${#file_list[@]}; i++)); do
  command+=" -add ${file_list[$i]}"
done

# Specify the output file
command+=" ${output_file}"

# Execute the command
echo "Running: $command"
eval $command

done
