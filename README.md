# My neovim config

## What is this?
This is my neovim config that I use daily. This is intended for my own personal
use but feel free to take inspiration from it if you want. There may be sudden
changes when I feel like it, but I try to keep everything working.

## What plugins / what plugin manager do you use?
I'm using [lazy.nvim](https://github.com/folke/lazy.nvim), actually I recently
switched to using it after packer is now not maintained anymore. I actually had
my own problems with the way packer worked (and me not understanding Lua
well enough) so this move was a really good one, I like how easy lazy.nvim 
makes it to structure the config in an easy way.

As for what plugins I use, just look at the `lua/plugins` directory. Most 
plugins have their own file in there, for some plugins I have a combined spec,
for example all the completion and lsp stuff is in the `lsp.lua` file.

Some honorary mentions:
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) (hard to
  find any other plugin that provides more value than this one)
* [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) (arguably the
  best colorscheme ever created)
* [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) (file tree of
  my choice. I know I don't really need one with telescope but sometimes I just
  like having an overview of my project on the left hand side of the screen 
  when coding...)
