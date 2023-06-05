# cross-build - A small program that allows you to simplify building a cross-compiler on non-Gentoo Linux
# 1. Install https://wiki.osdev.org/GCC_Cross-Compiler dependencies
# 2. You must download a gcc and binutils src to folder $HOME/cross-src (GCC Folder Name: src-gcc, Binutils Folder Name: src-binutils)
# 3. Run this program

# ARGS ./cross-build.sh [cross-platform]

# Parts
# 1. EXPORT VARS
# 2. BUILD BINUTILS
# 3. BUILD GCC
# 4. CLEANUP

#VALIDATION

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 0
fi

# Part 1. EXPORT VARS
export PREFIX="$HOME/opt/cross"
export TARGET=$1
export PATH="$PREFIX/bin:$PATH"

# Part 2. BUILD BINUTILS
cd $HOME/cross-src
mkdir build-binutils
cd build-binutils

pwd

../src-binutils/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make
make install

# Part 3. BUILD GCC

cd $HOME/cross-src

# The $PREFIX/bin dir _must_ be in the PATH. We did that above.
which -- $TARGET-as || echo $TARGET-as is not in the PATH

mkdir build-gcc
cd build-gcc

pwd

../src-gcc/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc

# Part 4. CLEANUP

cd $HOME/cross-src

rm -f -r build-gcc/*
rm -f -r build-binutils/*
rmdir build-gcc --ignore-fail-on-non-empty
rmdir build-binutils --ignore-fail-on-non-empty
