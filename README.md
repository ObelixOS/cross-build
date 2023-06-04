# 0. What is a cross-build:
> A small program that allows you to simplify building a cross-compiler on non-Gentoo Linux

# 1. Files:
> 1. cross-build.sh - A main file in this project, this is a tool to create cross compiler
> 2. install-deps-arch.sh - That file can download a dependencies required to use a cross-build

# 2. How to use cross-build

> 1. First, install a dependencies, by script or manually.
> 2. Next, download a binutils and GCC soruce code into $HOME/cross-src folder
> > 2.1. GCC src folder: `src-gcc`
> > 2.2. Binutils src folder: `src-binutils`
> 3. Use, `chmod +rwx ./crossbuild.sh` to set a permissions
> 4. Execute a `./crossbuild.sh`
