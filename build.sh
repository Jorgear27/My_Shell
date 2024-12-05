echo "Build submodule"
cd Metrics_Monitoring_System
./build.sh
cd ..

echo "Build project"
python3 -m venv venv
source venv/bin/activate
pip install conan
mkdir build
conan install . --output-folder=build --build=missing
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=./build/Release/generators/conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)
