# My one and only vim config
This is the .vim & .vimrc files that I use everywhere I can use vim and
git my config. I could improve a lot of things, starting by a special 
colorscheme on non 256-colors terminals. plus some scripts to automate
the activation of modules and the installation of .vimrc on a new computer

# requirements
* vim 7.2 (ubuntu package)
* ruby (for command-t)
* 256-colors terminal

## bundles
this config uses [pathogen](https://github.com/tpope/vim-pathogen) which is
just _awesome_. It allows to separate bundles in their own directories
instead of putting everything in the ~/.vim root.

### add a bundle
In order to install a new bundle, one must add it in the `bundle-available`
directory.

### activate a bundle
those of you who are familiar to pathogen know that bundles live in the
`bundle` directory. In order to be able to activate/deactivate bundles
everything in `bundle` is a symlink to the real module in `bundle-available`

### more
I'm looking for a way to handle per-project activation of bundles because
I don't need omnicppcomplete everyday  and I want to deactivate it most 
the time

## forking
You can fork my config, I would be happy to get pull requests as well

