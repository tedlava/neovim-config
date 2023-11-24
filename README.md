# neovim-config
My personal init.vim for Neovim 0.5 or higher. Does NOT work with Vim (has some Lua plugins).


## Pre-requisites
- Make sure a Nerd-compatible patched font is installed: https://www.nerdfonts.com/

Go to https://github.com/ryanoasis/nerd-fonts/releases and click on the link to "show all assets" under the latest release.

I prefer Hack, here is the link for the latest release at the time of this writing:

https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Hack.zip

Install the font into your OS and set it as the monospace font for your terminal.


## Installation
- I recommend to `cd` into a specific directory where you keep your configs, like a `setup` directory
- $ `git clone https://github.com/tedlava/neovim-config.git`
- $ `mkdir ~/.config/nvim`
- $ `ln -s ./neovim-config/*.vim ~/.config/nvim/`
- Install vim-plug with:
- $ `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
- $ `nvim -c PlugInstall`


## Notes
Ubuntu 22.04 LTS still has an old version of Neovim packaged (v0.6.1), and my init.vim is configured to expect a newer version of Neovim which has some breaking changes in Lua...  So if you're using my neovim-config setup on an Ubuntu 22.04 LTS-based distro, then you'll need to modify the init.vim to include a few tags to download some older versions of plugins:

    Plug 'lukas-reineke/indent-blankline.nvim', { 'tag': 'v2.12.0' }
    Plug 'nvim-lualine/lualine.nvim', { 'tag': 'compat-nvim-0.6' }
