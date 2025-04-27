import subprocess

for i in range(1,13):
    if i<=9:
        name = f"0{i}"
    else:
        name = f"{i}"
    file = f"test/test_1_r{name}.bpl"
    command = ["./bin/bplc", file]
    print(file+" OK.")
    subprocess.run(command)