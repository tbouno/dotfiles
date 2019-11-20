# terminal

## 事前準備

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

### zsh使用する前に
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install tree
$ brew install zplug
```

### neovim使用する前に
```
$ brew install neovim
$ brew install python3
$ pip3 install -U neovim
```

## その他
### nvm
```
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | zsh
$ nvm --version
$ nvm ls-remote
$ nvm install v12.3.1
$ npm -v
$ node -v
```
