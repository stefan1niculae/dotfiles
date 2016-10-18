README:
create readme
add description of this repo (dotfiles for vim, git and zsh)
move this todo into the readme

ON BOOTSTRAPPING:
git cache duration 1h (when cloned over HTTPS)
generate public key if not there already and instruct to place it into github>settings>add SSH key
if mac, append source ~/.bashrc into .profile
inform of applications to install: lightshot, bartender, bettertouchtool, the unarchiver + other utilities
if mac add the US~Ro keyboard layout (~ and ` inverted, alt+[]\;' remapped to romanian diacritics) to /Library/Keyboard Layouts and instruct to activate it
neobundle: curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh; sh ./install.sh; ... rm -f install.sh . after this, remove .vim/bundle from rep
install font and instruct to change it
install zsh and change shell to it and put custom theme in
install iterm2 and add preferences also change its icon to the default terminal one
add .hushlogin
tell user to update git (through brew) - because apple git makes reset-terminal super slow and thus the readline is unusable
install macvim
install cabal, ghcmod, add it to path https://github.com/scrooloose/syntastic/issues/285
install mcs http://www.mono-project.com/docs/about-mono/supported-platforms/osx/
npm install -g csslint
npm install -g jshint
npm install -g jsonlint
gem install mdl
gem install sqlint
pip install vint
npm install -g coffeescript
install syntastic checkers
gulp, gulp-sass, gulp-coffee

TO ADD:
task to check for updates every month
```
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Even better: use the silver searcher (brew install the_silver_searcher)
alias f="ag -g"
alias r=ag
```
global gitignore
.aliases
minimal_sn.zsh-theme
scripts:
http://hints.macworld.com/article.php?story=20100509134904820
https://blog.bertvanlangen.com/articles/toggle-hidden-files-finder-os-x-10-10-yosemite/
better touch tool configurations!
iterm2 themes
.ghc/
workon <env> instead of sourcing
make global gitignore work... globally
osx tweaks:
    this one no longer works
    defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder



(interesting) ZSH PLUGINS:
--from the github wiki--
brew
cabal?
chucknorris
coffee?
common-aliases
dirhistory/dircycle
fasd
git
gitfast?
git-extras
npm
osx
pep8?
pip
pylint?
python?
tmux
tmuxinator?
vi-mode
virtualenvwrapper
wd
github.com/zsh-users/zsh-syntax-highlighting

https://github.com/unixorn/awesome-zsh-plugins
prezto
antigen-hs/zgen
alf
fresh?


Karabiner-Elements
When released/documentation available/GUI done:
  shift-escape is caps_lock
  for mech keyboard
    eject is expose
  keyrepeat: delay & rate
  
bootstrap todo: git config --global core.excludesfile ~/.gitignore
