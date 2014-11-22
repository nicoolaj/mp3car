#!/bin/bash

_SUDO="sudo "
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    TXTDISTRO="Linux"
    if [ -f /etc/debianversion ] ; then
        TXTDISTRO="$TXTDISTRO Debian"
        UPDATE_CDE="apt-get update"
        INSTALL_CDE="apt-get install -y "
    elif [ -f /etc/redhat-release ] ; then
        TXTDISTRO="$TXTDISTRO Redhat"
        #TOFIX
    elif [ -f /etc/SuSE-release ] ; then
        TXTDISTRO="$TXTDISTRO SuSE"
        #TOFIX
    elif [ -f /etc/mandrake-release ] ; then
        TXTDISTRO="$TXTDISTRO Mandrake"
        #TOFIX
    elif [ -f /etc/UnitedLinux-release ] ; then
        TXTDISTRO="$TXTDISTRO UnitedLinux"
        #TOFIX
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    TXTDISTRO="Mac OSX"
    if [ -f /usr/local/bin/brew ]; then
        INSTALL_CDE="brew install"
    fi
elif [[ "$OSTYPE" == "cygwin" ]]; then
    TXTDISTRO="CygWin"
    # POSIX compatibility layer and Linux environment emulation for Windows
    #TOFIX
elif [[ "$OSTYPE" == "msys" ]]; then
    TXTDISTRO="MinGW"
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
    #TOFIX
elif [[ "$OSTYPE" == "win32" ]]; then
    TXTDISTRO="Windows 32"
    # I'm not sure this can happen.
    #TOFIX
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    TXTDISTRO="FreeBSD"
    #TOFIX
else
    # Os Type is not detectable/known
    echo "=========================="
    echo "! PACKAGES INSTALL ERROR !"
    echo "=========================="
    echo "OS TYPE UNKNOWN ! Please install manualy"
    return 1
fi

eval $_SUDO $UPDATE_CDE
eval $_SUDO $INSTALL_CDE lame
eval $_SUDO $INSTALL_CDE rsync
eval $_SUDO $INSTALL_CDE sed gawk
