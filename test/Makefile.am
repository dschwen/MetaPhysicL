BUILT_SOURCES   = .license.stamp

check_PROGRAMS  =
check_PROGRAMS += chem_mixture


AM_CPPFLAGS  = 
AM_CPPFLAGS += -I$(top_srcdir)/src/core/include
AM_CPPFLAGS += -I$(top_builddir)/src/parsing/include
AM_CPPFLAGS += -I$(top_builddir)/src/utilities/include

AM_LDFLAGS = $(top_builddir)/src/libantioch.la

# Sources for these tests
chem_mixture_SOURCES = chem_mixture.C

#Define tests to actually be run
TESTS  =
TESTS += chem_mixture

if CODE_COVERAGE_ENABLED
  CLEANFILES = *.gcda *.gcno
endif

.license.stamp: $(top_srcdir)/LICENSE
	$(top_srcdir)/src/common/lic_utils/update_license.pl $(top_srcdir)/LICENSE \
	$(top_srcdir)/test/*.C
	echo 'updated source license headers' >$@

# Required for AX_AM_MACROS
###@INC_AMINCLUDE@