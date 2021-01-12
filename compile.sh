#/!bin/bash
# option "-a": recompile all from scratch
# else rely on makefile rules
#
# to be called after qunibone-platform.sh

. qunibone-platform.env
. compile-bbb.env

# guard against legacy qunibone-platform.env
if [ -z "$QUNIBONE_PLATFORM_SUFFIX" ] ; then
        QUNIBONE_PLATFORM_SUFFIX=$PLATFORM_SUFFIX
fi
if [ -z "$QUNIBONE_PLATFORM" ] ; then
        QUNIBONE_PLATFORM=$MAKE_QUNIBUS
fi

# Debugging: remote from Eclipse. Compile on BBB is release.
export MAKE_CONFIGURATION=RELEASE
#export MAKE_CONFIGURATION=DBG
#export MAKE_CONFIGURATION=ASAN

export CONFIGURATION_OPTIONS=

export QUNIBONE_PLATFORM
export QUNIBONE_PLATFORM_SUFFIX

cd 10.03_app_demo/2_src

if [ "$1" == "-d" ] ; then
  make debug
  exit
fi

if [ "$1" == "-a" ] ; then
  make clean
fi

if [ "$1" == "-c" ] ; then
  make clean
  exit
else
  make
fi

cd ~

echo "To run binary, call"
echo "10.03_app_demo/4_deploy/demo"

