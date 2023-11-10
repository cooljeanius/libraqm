#!/bin/sh
# Run this to generate all the initial makefiles, etc.

# before we can set up portability code for 'echo', put the rest of the stuff
# that autoconf normally puts before it:
# Be more Bourne compatible:
DUALCASE=1; export DUALCASE # for MKS sh
if test -n "${ZSH_VERSION+set}" && (emulate sh) >/dev/null 2>&1; then :
  emulate sh
  NULLCMD=:
  # Pre-4.2 versions of Zsh do word splitting on ${1+"$@"}, which
  # is contrary to our usage.  Disable this feature.
  alias -g '${1+"$@"}'='"$@"'
  setopt NO_GLOB_SUBST
else
  case `(set -o) 2>/dev/null` in #(
  *posix*) :
    set -o posix ;; #(
  *) :
     ;;
esac
fi

# Now we can steal some "echo" portability code from what autoconf generates:
as_nl='
'
export as_nl
# Printing a long string crashes Solaris 7 /usr/bin/printf.
as_echo='\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'
as_echo=${as_echo}${as_echo}${as_echo}${as_echo}${as_echo}
as_echo=${as_echo}${as_echo}${as_echo}${as_echo}${as_echo}${as_echo}
# Prefer a ksh shell builtin over an external printf program on Solaris,
# but without wasting forks for bash or zsh.
if test -z "${BASH_VERSION}${ZSH_VERSION}" \
    && (test "X`print -r -- ${as_echo}`" = "X${as_echo}") 2>/dev/null; then
  as_echo='print -r --'
  as_echo_n='print -rn --'
elif (test "X`printf %s ${as_echo}`" = "X${as_echo}") 2>/dev/null; then
  as_echo='printf %s\n'
  as_echo_n='printf %s'
else
  if test "X`(/usr/ucb/echo -n -n ${as_echo}) 2>/dev/null`" = "X-n ${as_echo}"; then
    as_echo_body='eval /usr/ucb/echo -n "$1${as_nl}"'
    as_echo_n='/usr/ucb/echo -n'
  else
    as_echo_body='eval expr "X$1" : "X\\(.*\\)"'
    as_echo_n_body='eval
      arg=$1;
      case ${arg} in #(
      *"${as_nl}"*)
	expr "X${arg}" : "X\\(.*\\)${as_nl}";
	arg=`expr "X${arg}" : ".*${as_nl}\\(.*\\)"`;;
      esac;
      expr "X${arg}" : "X\\(.*\\)" | tr -d "${as_nl}"
    '
    export as_echo_n_body
    as_echo_n='sh -c ${as_echo_n_body} as_echo'
  fi
  export as_echo_body
  as_echo='sh -c ${as_echo_body} as_echo'
fi

# Eat newline by using autoconf-style compatibility variable:
${as_echo_n} "checking for gtkdocize... "
which gtkdocize 2>/dev/null || {
	echo "*** No gtkdocize (gtk-doc) found, please install it ***"
}

# Likewise:
${as_echo_n} "checking for autoreconf... "
which autoreconf 2>/dev/null || {
	echo "*** No autoreconf (autoconf) found, please install it ***"
	exit 1
}

echo "running gtkdocize --copy"
gtkdocize --copy || exit 1

echo "running autoreconf --force --install --verbose"
autoreconf --force --install --verbose || exit $?
