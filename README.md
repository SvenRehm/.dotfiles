# Dependencies
```
sudo apt-get install -y stow
sudo apt install fzf

Install oh-my-zsh now
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd ~/.dotfiles/zsh
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git

```

# How to use gnu stow
```
stow --adopt -vt ~ *
stow --adopt -vt ~ */
stow -t ~ */
```


#install zsh autocomplete
