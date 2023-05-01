# PlanetArt Devops communal dotfiles

This repository is a collection of tools that make working in the terminal a breeze.  This repo supports Linux or OSX.  Linux support is brought to you via our friends at LinuxBrew.

# Paradigm

This environment is focused on tmux, neovim and zsh as our core building blocks.  If you're not comfortable with vim, you'll probably be happier with vscode

# Installation

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
