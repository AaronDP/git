#!/bin/sh
DEV_PREFIX=/opt
export ANDROID_NDK=${DEV_PREFIX}/ndk
export CROSS_COMPILE=arm-linux-androideabi
export ANDROID_PREFIX=/tmp/chain
export SYSROOT=${ANDROID_NDK}/platforms/android-17/arch-arm
export CROSS_PATH=${ANDROID_PREFIX}/bin/${CROSS_COMPILE}
export CPP=${CROSS_PATH}-cpp
export AR=${CROSS_PATH}-ar
export AS=${CROSS_PATH}-as
export NM=${CROSS_PATH}-nm
export CC=${CROSS_PATH}-gcc
export CXX=${CROSS_PATH}-g++
export LD=${CROSS_PATH}-ld
export STRIP=${CROSS_PATH}-strip
export RANLIB=${CROSS_PATH}-ranlib
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
#CFLAGS="-UHAVE_LOCALE_H --sysroot=${SYSROOT} -I${SYSROOT}/usr/include -I${ANDROID_PREFIX}/include -I${DEV_PREFIX}/android/bionic \
export CFLAGS="-I${SYSROOT}/usr/include \
-I${ANDROID_PREFIX}/include \
-I${DEV_PREFIX}/android/bionic \
-I/data/local/tmp/lib/include \
-I/data/local/tmp/lib/luajit-2.0 \
-DNO_ICONV \
-DNO_GETTEXT \
-UHAVE_ICONV_H \
-UHAVE_LANGINFO_H \
-UHAVE_GETPWENT \
-UHAVE_GETPWNAM \
-UHAVE_GETPWUID  \
-UHAVE_ICONV \
-UHAVE_NL_LANGINFO_CODESET \
-UHAVE_LIBINTL_H \
-UHAVE_LOCALE_H \
-UHAVE_GETTEXT \
-UHAVE_CLOCK_GETTIME \
 "
export CPPFLAGS="${CFLAGS}"
#export LDFLAGS="${LDFLAGS} -L${SYSROOT}/usr/lib -L${ANDROID_PREFIX}/lib -L/data/local/tmp/lib -L/data/local/tmp/lib/libncurses.so -Wl,--dynamic-linker=/system/bin/linker " # -L/tmp/chain/sysroot/usr/lib/libdl.so"
export LDFLAGS="-Wl,--no-as-needed -ldl -L${SYSROOT}/usr/lib -L${ANDROID_PREFIX}/lib -L/data/local/tmp/lib " # -L/tmp/chain/sysroot/usr/lib/libdl.so"
TERMINFO=/data/local/tmp/lib/terminfo
export PREFIX=/data/local/tmp
export BINDIR=/xbin
export MANDIR=/data/local/tmp/lib/share/man
export DATADIR=/data/local/tmp/lib/share.vim
export DESTDIR=/data/local/tmp
#  --exec-prefix=/data/local/tmp \
#  "CFLAGS=${CFLAGS}" "LDFLAGS=${LDFLAGS}" \
#make installvimbin installrtbase installmacros installspell
#./configure --host=arm-unknown-none --with-sysroot=${SYSROOT} --prefix=${PREFIX} "$@"
#./configure --prefix=${PREFIX} "$@"
#./configure --host=arm-unknown-none --with-sysroot=${SYSROOT} --prefix=${PREFIX} "$@"
  #--with-shell=/data/local/tmp/xbin 
make distclean
autoreconf
ac_cv_fread_reads_directories=no \
ac_cv_snprintf_returns_bogus=no \
ac_cv_header_libintl_h=no \
NO_GETTEXT=YesPlease \
NO_ICONV=YesPlease \
./configure \
  --sysconfdir=/data/local/tmp/etc \
  --without-iconv \
  --with-openssl \
  --with-editor=vim \
  --libdir=/data/local/tmp/lib \
  --includedir=/data/local/tmp/lib/include \
  --host=${CROSS_COMPILE} \
  --prefix=${PREFIX} "$@" 
CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" make && make install
#ndk-build
#   --prefix=PREFIX         install architecture-independent files in PREFIX
#   --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
#   --bindir=DIR            user executables [EPREFIX/bin]
#   --sbindir=DIR           system admin executables [EPREFIX/sbin]
#   --libexecdir=DIR        program executables [EPREFIX/libexec]
#   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
#   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
#   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
#   --libdir=DIR            object code libraries [EPREFIX/lib]
#   --includedir=DIR        C header files [PREFIX/include]
#   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
#   --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
#   --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
#   --infodir=DIR           info documentation [DATAROOTDIR/info]
#   --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
#   --mandir=DIR            man documentation [DATAROOTDIR/man]
#   --docdir=DIR            documentation root [DATAROOTDIR/doc/git]
#   --htmldir=DIR           html documentation [DOCDIR]
#   --dvidir=DIR            dvi documentation [DOCDIR]
#   --pdfdir=DIR            pdf documentation [DOCDIR]
#   --psdir=DIR             ps documentation [DOCDIR]
#   --disable-option-checking  ignore unrecognized --enable/--with options
#   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
#   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
#   --enable-pthreads=FLAGS FLAGS is the value to pass to the compiler to enable
#                           --disable-pthreads will disable threading.
#   --enable-jsmin=PATH     PATH is the name of a JavaScript minifier or the
#   --enable-cssmin=PATH    PATH is the name of a CSS minifier or the absolute
#   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
#   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
#   --with-sane-tool-path=DIR-1[:DIR-2...:DIR-n]
#   --with-lib=ARG          ARG specifies alternative name for lib directory
#   --with-openssl          use OpenSSL library (default is YES)
#   --with-libpcre          support Perl-compatible regexes (default is NO)
#   --with-curl             support http(s):// transports (default is YES)
#   --with-expat            support git-push using http:// and https://
#   --without-iconv         if your architecture doesn't properly support iconv
#   --with-iconv=PATH       PATH is prefix for libiconv library and headers
#   --with-gitconfig=VALUE  Use VALUE instead of /etc/gitconfig as the global
#   --with-gitattributes=VALUE
#   --with-pager=VALUE      Use VALUE as the fall-back pager instead of 'less'.
#   --with-editor=VALUE     Use VALUE as the fall-back editor instead of 'vi'.
#   --with-shell=PATH       provide PATH to shell
#   --with-perl=PATH        provide PATH to perl
#   --with-python=PATH      provide PATH to python
#   --with-zlib=PATH        provide PATH to zlib
#   --with-tcltk            use Tcl/Tk GUI (default is YES)
