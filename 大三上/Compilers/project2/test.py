import subprocess


# Test test_2_o01.bpl
for i in range(1, 2):

    name = f"0{i}"

    # Define the input file path
    input_file = f"test/test_2_o{name}.bpl"
    # Define the output file path with the desired naming format
    output_file = f"test/test_2_o{name}.out"  
    # Define the command to run the compiler
    command = ["./bin/bplc", input_file] 
 
    # Open the output file for writing
    with open(output_file, 'w') as f:
        # Print a message indicating the input and output files
        print(f"{input_file} -> {output_file} OK.")
        # Run the command and redirect the output to the output file
        subprocess.run(command, stdout=f)

# Test test_2_r01.bpl ~ test_2_r15.bpl
for i in range(1, 16):

    if i <= 9:
        name = f"0{i}"
    else:
        name = f"{i}"
    
    # Define the input file path
    input_file = f"test/test_2_r{name}.bpl"
    # Define the output file path with the desired naming format
    output_file = f"test/test_2_r{name}.out"  
    # Define the command to run the compiler
    command = ["./bin/bplc", input_file] 
 
    # Open the output file for writing
    with open(output_file, 'w') as f:
        # Print a message indicating the input and output files
        print(f"{input_file} -> {output_file} OK.")
        # Run the command and redirect the output to the output file
        subprocess.run(command, stdout=f)


