NULL = 

ACLOCAL_AMFLAGS = -I m4 --install

SUBDIRS = src docs tests

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = @PACKAGE@.pc

MAINTAINERCLEANFILES = \
    $(GITIGNORE_MAINTAINERCLEANFILES_TOPLEVEL) \
    $(GITIGNORE_MAINTAINERCLEANFILES_M4_LIBTOOL) \
    $(GITIGNORE_MAINTAINERCLEANFILES_MAKEFILE_IN) \
    $(srcdir)/gtk-doc.make \
    $(srcdir)/m4/gtk-doc.m4 \
    $(srcdir)/docs/raqm-overrides.txt \
    *~ compile config.guess config.sub depcomp install-sh ltmain.sh missing \
    test-driver \
    $(NULL)

## FIXME: This should get removed eventually, once possible to do so:
AM_DISTCHECK_CONFIGURE_FLAGS = --disable-Werror

-include $(top_srcdir)/git.mk
