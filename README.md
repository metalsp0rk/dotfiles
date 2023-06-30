# PlanetArt Devops communal dotfiles

This repository is a collection of tools that make working in the terminal a breeze.  This repo supports Linux or OSX.  Linux support is brought to you via our friends at LinuxBrew.

## Patterns

This environment is focused on tmux, neovim and zsh as our core building blocks.  This is a keyboard-centric, macro/shortcut/script based workflow, with the goal of providing fast access to frequently used tools

## Installation

Clone the repo:

```
git clone git@github.com:Planetart/devops-dots ~/.dots
```

In the repository, run the init script:

```
./init.sh
```

Once done, you're ready to configure your environment.  
To configure a tool, we use make:
```
make add conf=<directory>
```

you first enable a configuration with the above command, setting conf to the name of the tooling directory you want enabled.

Once you've added all the configurations you want, go ahead and install them with:

```
make install
make configure
```

The install job will symlink the configuration files into the correct location, so that updates to this repo will keep your configuration.

The configure job will handle any system package dependencies and component configuration.


## Features

### tmux, wrappers and fast workspace switching

tmux has been enhanced with a few goodies to make it support fast-switching between workspaces

Here's an outline of the tmux shortcuts:

```
prefix-b      Switch between active sessions
prefix-f      Start a new session from existing projects
prefix-i      Cheatsheet for common tools
prefix-X      Kill a session
prefix-v      open dotfiles workspace
prefix-z      open tf-solution workspace
prefix-m      open a tf-module workspace
```
Shell shortcuts that are operative outside of tmux:
```
ctrl+f        Start a new session from existing projects
alt+v         start a new dotfiles session
```


### zsh, prompting and shell management

zsh is configured to provide prompts and context clues for the user.

### neovim, lsp and much much more

The star of the show, Neovim is configured for a full IDE experience

There's a massive list of keybinds here.  I'll try to put them in some sort of a sane order, but I would just grep for what you need if you're looking for something specific...

#### neovim's words of wizardry

Quick git cstage, commit, push of all files:
```
 gsScci<commitmessage><esc> wqyPp
```
Explanation: <space>gs opens git status.  S stages all files.  cc opens the commit dialog, i puts you in insert mode.  <esc> back to normal mode, wqy: write quit, confirm yes on "do you want to commit?".  Pp Push, uPstream.

Change whatever's in the next quotes:
```
ci"
```
auto-indent the entire file:
```
gg=G
```
gg, go line 1.  = format from cursor until.... G jump EOF


## Intro guide

Check this video for a quick guide on how to get the most out of the PlanetArt dotfiles


