# ./Launcher.sh P1 P2 P/NODE D1 D2 IT AN CPUSW PROGRAM


########################### DERIVATIVE
./Launcher.sh 2 2 2 8192 4096 12 2 40 derivative;
./Launcher.sh 2 4 2 8192 4096 12 4 40 derivative;
./Launcher.sh 4 4 2 8192 4096 12 8 40 derivative;
./Launcher.sh 2 2 2 8192 8192 12 2 40 derivative;
./Launcher.sh 2 4 2 8192 8192 12 4 40 derivative;
./Launcher.sh 4 4 2 8192 8192 12 8 40 derivative;

./Launcher.sh 8 16 32 256 512 12 1 40 derivative;
./Launcher.sh 32 16 32 256 512 12 8 40 derivative;
./Launcher.sh 8 16 32 8192 4096 12 1 40 derivative;
./Launcher.sh 32 16 32 8192 4096 12 8 40 derivative;

./Launcher.sh 8 16 32 8192 4096 12 1 40 derivative 2;
./Launcher.sh 32 16 32 8192 4096 12 8 40 derivative 2;
./Launcher.sh 8 16 32 8192 4096 12 1 40 derivative 4;
./Launcher.sh 32 16 32 8192 4096 12 8 40 derivative 4;

# ########################### REDUCTION
./Launcher.sh 2 2 2 8192 4096 250 2 40 reduction;
./Launcher.sh 2 4 2 8192 4096 250 4 40 reduction;
./Launcher.sh 4 4 2 8192 4096 250 8 40 reduction;
./Launcher.sh 2 2 2 8192 8192 250 2 40 reduction;
./Launcher.sh 2 4 2 8192 8192 250 4 40 reduction;
./Launcher.sh 4 4 2 8192 8192 250 8 40 reduction;

./Launcher.sh 8 16 32 256 512 25 1 40 reduction;
./Launcher.sh 32 16 32 256 512 25 8 40 reduction;
./Launcher.sh 8 16 32 8192 4096 25 1 40 reduction;
./Launcher.sh 32 16 32 8192 4096 25 8 40 reduction;


./Launcher.sh 8 16 32 8192 4096 25 1 40 reduction 2;
./Launcher.sh 32 16 32 8192 4096 25 8 40 reduction 2;
./Launcher.sh 8 16 32 8192 4096 25 1 40 reduction 4;
./Launcher.sh 32 16 32 8192 4096 25 8 40 reduction 4;