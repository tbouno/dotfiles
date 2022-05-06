# dotfiles

## セットアップ 
`brew bundle`コマンドを実行する前にAppStoreへログインしておく
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew bundle --file ~/dotfiles/brewfile
$ cp -p ~/dotfiles/.zshrc .zshrc
$ cp -pR ~/dotfiles/.config/ .config/
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
$ nvm ls-remote
$ nvm install v16.15.0
$ npm install --global pure-prompt
$ pip3 install -U neovim
$ . ~/dotfiles/vsc-extension_list.sh
```

## その他
### iterm2
#### 本体
https://iterm2.com/

#### color theme setting
iTerm2 >> Preferences >> Profiles >> Colors tab >> Color Presets.. 

```
$ curl -O https://raw.githubusercontent.com/Arc0re/Iceberg-iTerm2/master/iceberg.itermcolors
```

### xcode
`Command Line Tools(MacOS xx.xx) for Xcode xx.xx`が必要

- https://developer.apple.com/download/more/?=xcode
- https://en.wikipedia.org/wiki/Xcode
