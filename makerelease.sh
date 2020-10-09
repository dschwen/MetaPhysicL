#!/bin/sh
set -e

if [ "$#" -ne 0 ]; then
  echo "Usage: $0"
fi

VERSION=$(grep AC_INIT configure.ac | sed 's/.*[ ,]\([0-9]\+\(\.[0-9]\+\)\+\).*/\1/')

git submodule update --init

git tag v${VERSION} -m "MetaPhysicL $VERSION release"

git checkout -b branch_$VERSION

perl -pi -e 's/dnl AM_MAINTAINER_MODE/AM_MAINTAINER_MODE/' configure.ac

./bootstrap

cp .gitignore-bootstrapped .gitignore

git add .gitignore

git commit -m "Don't ignore bootstrap output"

git add Makefile.in aclocal.m4 build-aux \
        configure doxygen/Makefile.in m4/libtool.m4 m4/ltoptions.m4 \
        m4/ltsugar.m4 m4/ltversion.m4 m4/lt~obsolete.m4 \
        src/Makefile.in test/Makefile.in configure.ac \
        src/utilities/include/metaphysicl/metaphysicl_config.h.tmp.in

git commit -m "Add bootstrap output"

git tag v${VERSION}_bootstrapped -m "MetaPhysicL $VERSION release, bootstrapped"
