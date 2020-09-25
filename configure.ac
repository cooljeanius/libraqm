dnl# configure.ac                                  -*- Autoconf -*-
dnl# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([Raqm],
        [0.5.1],
        [https://github.com/HOST-Oman/libraqm/issues],
        [raqm],
        [https://github.com/HOST-Oman/libraqm/])dnl

AM_INIT_AUTOMAKE([foreign color-tests -Wall -Wno-portability])
AM_SILENT_RULES([yes])dnl

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])dnl

# Checks for programs.
AC_PROG_CC
AC_PROG_CC_C99
AC_PROG_CPP
AC_PROG_CXX

# Enable compiler warnings
AX_COMPILER_FLAGS

LT_INIT

# Libtool version
m4_define([_triplet], m4_split(AC_PACKAGE_VERSION, [[.]]))
m4_define([_major],   m4_argn(1, _triplet))
m4_define([_minor],   m4_argn(2, _triplet))
m4_define([_micro],   m4_argn(3, _triplet))
m4_define([_age],     m4_eval(_major*10000 + _minor*100))
m4_define([_current], m4_eval(_major + _age))
RAQM_LIBTOOL_VERSION=_current:_micro:_age
AC_SUBST([RAQM_LIBTOOL_VERSION])dnl


PKG_PROG_PKG_CONFIG([0.20])
AX_PKG_CHECK_MODULES([FREETYPE],[freetype2 >= 12.0.6],[])
AX_PKG_CHECK_MODULES([HARFBUZZ],[],[harfbuzz])
AX_PKG_CHECK_MODULES([FRIBIDI],[],[fribidi])

_save_libs="${LIBS}"
_save_cflags="${CFLAGS}"
LIBS="${LIBS} ${HARFBUZZ_LIBS} ${FRIBIDI_LIBS}"
CFLAGS="${CFLAGS} ${HARFBUZZ_CFLAGS} ${FRIBIDI_CFLAGS}"
AC_CHECK_FUNCS([hb_ft_font_create_referenced hb_ft_font_set_load_flags \
                hb_buffer_set_invisible_glyph])
AC_CHECK_DECLS([HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES],[],[],[[
#include <hb.h>
]])dnl

LIBS="${_save_libs}"
CFLAGS="${_save_cflags}"

GTK_DOC_CHECK([1.14],[--flavour no-tmpl])

case ${build_os} in
    mingw*)
        AX_APPEND_FLAG([-D__USE_MINGW_ANSI_STDIO=1])
        ;;
esac

# Checks for header files.
AC_HEADER_STDBOOL dnl# also "_CHECK"s it
AC_CHECK_HEADERS([locale.h])dnl

# Checks for typedefs, structures, and compiler characteristics.
AC_TYPE_SIZE_T
AC_TYPE_UINT32_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_CHECK_FUNCS([memset setlocale strtol])dnl

# Output.
AC_CONFIG_FILES([
    Makefile
    raqm.pc
    src/Makefile
    tests/Makefile
    docs/Makefile
    docs/version.xml
])

AC_OUTPUT
