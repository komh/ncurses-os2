extproc sh

n=configure
test -f "./$n." || { echo "\`./$n' not found !!!"; exit 1; }

opts="
    --enable-pc-files
    --disable-stripping
    --with-libtool
    --with-default-terminfo-dir=\${prefix}/share/terminfo
    --with-pkg-config-libdir=\${prefix}/lib/pkgconfig
"

"./$n" $opts "$@" 2>&1 | tee "$n.log"
