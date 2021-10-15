# dotfiles

## セットアップ 
`brew bundle`コマンドを実行する前にAppStoreへログインしておく
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew bundle --file ~/dotfiles/brewfile
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | zsh
$ cp -p ~/dotfiles/.zshrc .zshrc
$ cp -pR ~/dotfiles/.confg/ .config/
$ nvm install v12.3.1
$ npm install --global pure-prompt
$ pip3 install -U neovim
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
