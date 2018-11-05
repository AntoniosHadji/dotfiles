#!/usr/bin/env bash
# -*- coding: utf-8 -*-

git checkout master
git pull
make distclean
LATEST_TAG=$(git describe --tags)
echo $LATEST_TAG
sleep 3s
git checkout $LATEST_TAG

sleep 3s
./configure \
  --enable-luainterp=dynamic \
  --enable-python3interp=yes \
  --enable-cscope \
  --enable-terminal \
  --enable-autoservername \
  --enable-multibyte \
  --enable-gui=gtk3 \
  --enable-gnome-check \
  --with-compiledby="Antonios Hadjigeorgalis"
# mzscheme installed with racket-lang racket is correct as per help mzscheme
# fails to compile.
#  --enable-mzschemeinterp \

if [ $? -eq 0 ]; then
  echo "./configure success."
  read -p "Hit enter to continue building vim."
  sleep 1s
  make
fi

if [ $? -eq 0 ]; then
  echo "successfully made"
  sleep 1s
  sudo make install
fi

git checkout master
sleep 1s
vim --version



# Optional Features:
#   --disable-option-checking  ignore unrecognized --enable/--with options
#   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
#   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
#   --enable-fail-if-missing    Fail if dependencies on additional features
#      specified on the command line are missing.
#   --disable-darwin        Disable Darwin (Mac OS X) support.
#   --disable-smack	  Do not check for Smack support.
#   --disable-selinux	  Do not check for SELinux support.
#   --disable-xsmp          Disable XSMP session management
#   --disable-xsmp-interact Disable XSMP interaction
#   --enable-luainterp=OPTS      Include Lua interpreter.  default=no OPTS=no/yes/dynamic
#   --enable-mzschemeinterp      Include MzScheme interpreter.
#   --enable-perlinterp=OPTS     Include Perl interpreter.  default=no OPTS=no/yes/dynamic
#   --enable-pythoninterp=OPTS   Include Python interpreter. default=no OPTS=no/yes/dynamic
#   --enable-python3interp=OPTS  Include Python3 interpreter. default=no OPTS=no/yes/dynamic
#   --enable-tclinterp=OPTS      Include Tcl interpreter. default=no OPTS=no/yes/dynamic
#   --enable-rubyinterp=OPTS     Include Ruby interpreter.  default=no OPTS=no/yes/dynamic
#   --enable-cscope         Include cscope interface.
#   --enable-workshop       Include Sun Visual Workshop support.
#   --disable-netbeans      Disable NetBeans integration support.
#   --disable-channel       Disable process communication support.
#   --enable-terminal       Enable terminal emulation support.
#   --enable-autoservername Automatically define servername at vim startup.
#   --enable-multibyte      Include multibyte editing support.
#   --enable-hangulinput    Include Hangul input support.
#   --enable-xim            Include XIM input support.
#   --enable-fontset        Include X fontset output support.
#   --enable-gui=OPTS       X11 GUI. default=auto OPTS=auto/no/gtk2/gnome2/gtk3/motif/athena/neXtaw/photon/carbon
#   --enable-gtk2-check     If auto-select GUI, check for GTK+ 2 default=yes
#   --enable-gnome-check    If GTK GUI, check for GNOME default=no
#   --enable-gtk3-check     If auto-select GUI, check for GTK+ 3 default=yes
#   --enable-motif-check    If auto-select GUI, check for Motif default=yes
#   --enable-athena-check   If auto-select GUI, check for Athena default=yes
#   --enable-nextaw-check   If auto-select GUI, check for neXtaw default=yes
#   --enable-carbon-check   If auto-select GUI, check for Carbon default=yes
#   --disable-gtktest       Do not try to compile and run a test GTK program
#   --disable-icon-cache-update        update disabled
#   --disable-desktop-database-update  update disabled
#   --disable-largefile     omit support for large files
#   --disable-acl           No check for ACL support.
#   --disable-gpm           Don't use gpm (Linux mouse daemon).
#   --disable-sysmouse      Don't use sysmouse (mouse in *BSD console).
#   --disable-nls           Don't support NLS (gettext()).
# 
# Optional Packages:
#   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
#   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
#   --with-mac-arch=ARCH    current, intel, ppc or both
#   --with-developer-dir=PATH    use PATH as location for Xcode developer tools
#   --with-local-dir=PATH   search PATH instead of /usr/local for local libraries.
#   --without-local-dir     do not search /usr/local for local libraries.
#   --with-vim-name=NAME    what to call the Vim executable
#   --with-ex-name=NAME     what to call the Ex executable
#   --with-view-name=NAME   what to call the View executable
#   --with-global-runtime=DIR    global runtime directory in 'runtimepath'
#   --with-modified-by=NAME       name of who modified a release version
#   --with-features=TYPE    tiny, small, normal, big or huge (default: huge)
#   --with-compiledby=NAME  name to show in :version message
#   --with-lua-prefix=PFX   Prefix where Lua is installed.
#   --with-luajit           Link with LuaJIT instead of Lua.
#   --with-plthome=PLTHOME   Use PLTHOME.
#   --with-python-command=NAME  name of the Python 2 command (default: python2 or python)
#   --with-python-config-dir=PATH  Python's config directory (deprecated)
#   --with-python3-command=NAME  name of the Python 3 command (default: python3 or python)
#   --with-python3-config-dir=PATH  Python's config directory (deprecated)
#   --with-tclsh=PATH       which tclsh to use (default: tclsh8.0)
#   --with-ruby-command=RUBY  name of the Ruby command (default: ruby)
#   --with-x                use the X Window System
#   --with-gnome-includes=DIR Specify location of GNOME headers
#   --with-gnome-libs=DIR   Specify location of GNOME libs
#   --with-gnome            Specify prefix for GNOME files
#   --with-motif-lib=STRING Library for Motif
#   --with-tlib=library     terminal library to be used
