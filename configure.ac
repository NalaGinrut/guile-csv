# configure.ac
#
# Copyright (C) 2013-2015 Nala Ginrut <nalaginrut@gmail.com>
#
# This file is part of guile-csv.
#
# guile-csv is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 3, or
# (at your option) any later version.
#
# guile-csv is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public
# License along with guile-json; see the file COPYING.  If not,
# write to the Free Software Foundation, Inc., 51 Franklin Street,
# Fifth Floor, Boston, MA  02110-1301  USA

AC_PREREQ([2.65])
AC_INIT([guile-csv], [0.0.3], [nalaginrut@gmail.com])
AC_CONFIG_SRCDIR(csv)
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([color-tests -Wall -Wno-portability])
AM_SILENT_RULES([yes])


GUILE_PKG([2.2 2.1 2.0])
PKG_CHECK_MODULES([GUILE], [guile-$GUILE_EFFECTIVE_VERSION >= 2.0.5])
AC_PATH_PROG([GUILECONFIG], [guile-config], :)

GUILE_PROGS
GUILE_FLAGS
GUILE_SITE_DIR

AC_CONFIG_FILES([Makefile csv/Makefile])
AC_CONFIG_FILES([env], [chmod +x env])

AC_OUTPUT

# configure.ac ends here
