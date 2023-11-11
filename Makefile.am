NULL = 

ACLOCAL_AMFLAGS = -I m4 --install

SUBDIRS = src docs tests

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = @PACKAGE@.pc

MAINTAINERCLEANFILES = \
    $(GITIGNORE_MAINTAINERCLEANFILES_TOPLEVEL) \
    $(GITIGNORE_MAINTAINERCLEANFILES_M4_LIBTOOL) \
    $(GITIGNORE_MAINTAINERCLEANFILES_MAKEFILE_IN) \
    $(srcdir)/docs/raqm-overrides.txt \
    *~ compile confdefs.h config.guess config.sub conftest* depcomp install-sh \
    ltmain.sh missing test-driver .env.local log/*.log lib*.a lib*.la lib*.lai \
    */lib*.a */lib*.la */lib*.la *.lo *.dylib */*.lo */*.dylib \
    $(NULL) @MAINT@ $(MAINTAINER_EXTRACLEANFILES)

MAINTAINER_EXTRACLEANFILES = \
    $(srcdir)/gtk-doc.make \
    $(srcdir)/m4/gtk-doc.m4 \
    $(NULL)

distclean-local maintainerclean-local:
	-rm -rf raqm-*.*.*/* || rmdir raqm-*.*.* || ls raqm-*.*.*

## FIXME: This should get removed eventually, once possible to do so:
AM_DISTCHECK_CONFIGURE_FLAGS = --disable-Werror

-include $(top_srcdir)/git.mk
