# Bkgreve's Emacs Configuration

This repository contains all my Emacs configuration files. This configuration
was created in Emacs 27.0.90 (built from source in Debian 10).

## Setup

These configuration files rely on [Cask](https://github.com/cask/cask) for package management. Prior to installing these, ensure that the latest version of Cask is installed.

Clone this repository into your home directory:
```sh
git@github.com:bkgreve/.emacs.d.git
cd .emacs.d/
cask install
```

## Packages

The following packages (installed with Cask) have certain external dependencies:
* markdown-mode
   * Requires a markdown processor (e.g., Pandoc)
* prettier-js
   * Requires prettier to also be installed with npm
* tide
   * Requires standardx to also be installed via npm
* elpy
   * Ensure Python 3 is available

## TODOs

Things I still want to implement:
* Automatically finding the `node_modules` directory when working on JS projects
* Any modifications needed to also make this configuration Mac OS friendly
