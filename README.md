# DCC Tools

> Skip to [Installation](#installation)

Non-root package manager for Linux.

## What does DCC Tools do?

DCC Tools allows to install Linux programs inside the user's `$HOME`.

This comes with several disadvantages:

* Only scripts work out of the box.
* Programs require compilation for each system.
* Programs are linked against the system's libraries.
* Packages only work for the system they were built against.
* Changes on the system will break programs.
* Dependencies must be handled manually.

## Isn't this a horrible idea?

Yes, it is.

## Why are you workig on this?

> tl;dr: standardization

This program was orginally developed to easily distribute scripts that wrapped
complex commands for common chores inside the server of Computer Science
Department (DCC) at Universidad de Chile..

Realistically speaking, a non-root package manager breaks the multi-user scheme
of a GNU/Linux system. The separation between privileged and unprivileged users
also separates the package's management and dependency resolution.

Solutions like `Flatpack` and `Snap` focus on the sandboxing aspect, however
they also take care of the user experience and mostly target desktop users.

DCC Tools aims to assist unprivileged *server* users with shell access that
have a designated RAM, Storage and CPU quotas.

If a program is needed on the server, a ticket should be raised to the system
administrator. If a program is not provided because of a usage policy, perhaps
you shouldn't try to install it by your own means.

There is a middle ground where a program is not provided because it only applies
to a small set of users, be it a script or a binary file. Those are the *tools*
whose managment this package manager tries to ease. 

DCC Tools approach to handle programs is heavily inspired on Archlinux's
[`PKGBUILD`](https://man.archlinux.org/man/core/pacman/PKGBUILD.5.en) files.
It aims to provide a replicable set of instructions in the form of a template,
allowing the creation of packages targeting the server of the user.

To ease distribution and compatibility, DCC Tools follows the approach of
[`scoop`](https://github.com/ScoopInstaller/Scoop) by using git as a backend
and the system's shell as its programming language. Both programs are part
of most educational and research servers, the target users of DCC Tools.

# Installation

> A installation script is in progress,
> the goal is to let `dcc-tools` install itself

DCC Tools tries to follow [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html),
therefore it does not create a dotfile. However, conflicts will arise
if the program files and the user-generated files share the same directories.

To avoid this issue, the following directories are used by DCC Tools:

* `$HOME/.local/opt/<program>`: root directory for each program
* `$HOME/.local/opt/bin`: symlinks for each `<program>/bin`


> This is a decision is based on [FHS for /opt](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s13.html).

The only modification needed on the current environment is to define:

* `PATH=$HOME/.local/opt/bin:PATH`

1. Clone this repository:
```
git clone https://github.com/dcc-tools/dcc-tools $HOME/.local/opt/dcc-tools
```

2. Clone the main bucket:
```
git clone https://github.com/dcc-tools/main $HOME/.local/opt/dcc-tools/buckets
```

3. Initialize DCC Tools:
```
$HOME/.local/top/dcc-tools/libexec/tools-init.sh
```
