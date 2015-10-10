extproc sh

# convert backslashes of PATH to slashes
export PATH=$(expr "$PATH" | tr '\\' /)

# find a path of ginstall.exe
GINSTALL=${GINSTALL-ginstall.exe}
IFS=";"
for dir in $PATH; do
    if test -x "$dir/$GINSTALL"; then
        GINSTALL="$dir/$GINSTALL"
        break
    fi
done

export ac_executable_extensions=".exe"

export CC="gcc.exe"
export CXX="g++.exe"
export AWK="gawk.exe"
export INSTALL="$GINSTALL"

./configure --enable-pc-files \
            --with-libtool \
            --with-default-terminfo-dir=\${prefix}/share/terminfo \
            --with-pkg-config-libdir=\${prefix}/lib/pkg-config \
            "$@"
