#!/bin/bash		#Shebang

#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#brew tap caskroom/cask

brew install tmux
brew install wget
brew install curl
brew install git

brew install rmtrash

brew install vim
# install pathogen.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# install nerdtree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
# install julia support
git clone https://github.com/JuliaEditorSupport/julia-vim.git ~/.vim/bundle/julia-vim



# physics
brew install gnuplot
brew cask install gimp
brew cask install mactex-no-gui

# latex
#sudo cp tex/* /usr/local/texlive/2018/texmf-dist/tex/
#texhash

cd ~
# Install ssh-ident
mkdir -p ~/bin; wget -O ~/bin/ssh goo.gl/MoJuKB; chmod 0755 ~/bin/ssh
#echo 'export PATH=~/bin:$PATH' >> ~/.bashrc
#ls -la .ssh
#ssh-keygen -t rsa -b 4096 -C "nils.harmening@mail.de"

# git projects
#mkdir Projects
#cd Projects
#git clone git@github.com:harmening/dotfiles.git
#cp dotfiles/* ~
#git clone git@github.com:harmening/pyunicorn.git
#git clone git@github.com:harmening/harmening.github.io.git
#git clone git@github.com:harmening/phrase-frequency-counter.git
#git clone git@github.com:harmening/signature_extraction.git

# C
brew install cmake
brew install hdf5
brew install libmatio
brew install swig
brew install openblas
export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
xcode-select --install
open /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg

brew install llvm # for OpenMP
echo 'export PATH="/usr/local/opt/llvm/bin:$PATH"' >> ~/.bashrc
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
ln -s /usr/local/opt/llvm/bin/clang /usr/local/bin/clang-omp # create symlinks
ln -s /usr/local/opt/llvm/bin/clang++ /usr/local/bin/clang-omp++
brew install libomp
#git clone https://github.com/harmening/openmeeg
cd openmeeg
git checkout python-wrapping-for-mac
mkdir build
cd build
# maybe you need to add a few lines to CMakeLists.txt (https://stackoverflow.com/questions/46414660/macos-cmake-and-openmp)
CC=clang-omp CXX=clang-omp++ cmake -DCMAKE_BUILD_TYPE=Release -DUSE_PROGRESSBAR=ON -DBLA_VENDOR=OpenBLAS -DOpenMP_C_FLAGS="-fopenmp=libomp -Wno-unused-command-line-argument" -DOpenMP_CXX_FLAGS="-Xpreprocessor -fopenmp -I$(brew --prefix libomp)/include" -DOpenMP_CXX_LIB_NAMES="omp" -DOpenMP_omp_LIBRARY=$(brew --prefix libomp)/lib/libomp.a ..
make
make test
make install
# cd /usr/local/Library/Python/2.7/site-packages
# install_name_tool -add_rpath /usr/local/lib/ _openmeeg.so
cd ~/Projects
#git clone https://github.com/fieldtrip/fieldtrip.git
# matlab addpath '~/Projects/fieldtrip'

# matlab engine api for python
# cd /Applications/MATLAB_R2018b.app/extern/engines/python/
# python2.7 setup.py install

#git clone https://github.com/mne-tools/mne-python.git
#pip install --upgrade "pyqt5>=5.10"

#python
#brew install python
pip2 install cython
pip2 install numpy
pip2 install scipy
#pip2 install pytest
#pip2 install pytest-flake8
#pip2 install pytest-cov
#pip2 install pylint
#pip2 install tox
#pip2 install python-igraph
#pip2 install matplotlib
#pip2 install netCDF4
#pip2 install flake8
#pip2 install squinx
#pip2 install mpi4py
#pip2 install jupyter
#pip2 install tensorflow
#pip2 install sklearn
#pip2 install pandas
brew install python3
pip3 install cython
pip3 install numpy
pip3 install scipy
pip3 install sklearn
pip3 install h5py
pip3 install pytest
pip3 install pytest-flake8
pip3 install pytest-cov
pip3 install pylint
pip3 install tox
pip3 install python-igraph
pip3 install matplotlib
pip3 install jupyter

#pip3 install mpi4py
brew cask install julia
brew cask install docker
brew cask install slack
brew cask install firefox
brew cask install osxfuse
brew cask install veracrypt
brew cask install dropbox
brew cask install gimp
#brew cask install skype
#brew cask install matlab
#brew cask install veracrypt

brew install sl

# Live Coding / Algorave 
brew cask install supercollider
pip install FoxDot


exit 0


# missing here: virtualbox, picard, xsane



# Trackpad preferences:
x-help-action://openPrefPane?bundleId=com.apple.preference.trackpad
# iCloud Preferences
# profile pic
# mail accounts
# finder preferences
# night shift


