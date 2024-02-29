# Personalized dot files for a Linux environment. 

![kitty terminal example](https://github.com/alexrated/dot_files/blob/main/assets/screenshot.png)

1. Remeber that a .dot file is which it's name starts with a . (dot). These files are generally used for configuration purposes. Example: *.bashrc*

2. This repository contains my personalized configurations for vim, git, the kitty terminal emulator and bash. Feel free to use if you want to.

3. Clone this repository anywhere in your machine but remember to copy the dot files in your */home* directory. Kitty's config file goes into *~/.config/kitty*.

4. For vim plugins, inside the *.vim* directory at your */home* directory, create a new directory called *plugged* and clone (git clone + git repository url) inside the following repositories:
   * [ale](https://github.com/dense-analysis/ale)
   * [lightline](https://github.com/itchyny/lightline.vim)
   * [nerdtree](https://github.com/preservim/nerdtree)
   * [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
   * [rainbow](https://github.com/frazrepo/vim-rainbow)
   * [vim-buftabline](https://github.com/ap/vim-buftabline)
   * [vim-deficons](https://github.com/ryanoasis/vim-devicons)
   * [nord theme](https://github.com/nordtheme/vim)

5. For color themes, you need to create a *colors* directory inside the *vim* directory. Look at the web for the color theme you like and read documentation.

6. Don't forget to edit the *.gitconfig* file with your personal data for git
