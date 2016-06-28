#! /bin/bash env
sudo apt-get install -y git-core curl mongodb vim nginx dconf-tools rar tree dkms virtualbox-guest-dkms
sudo apt-get install -y build-essential cmake python-pip python-setuptools ctags python-dev
# postgresql
# https://help.ubuntu.com/community/PostgreSQL
sudo apt-get update
sudo apt-get install -y libpq-dev postgresql-client postgresql postgresql-contrib pgadmin3
# sudo -u postgres psql postgres
# createuser --superuser $USER
# createdb $USER

# zeal - dash
sudo apt-get update
sudo add-apt-repository ppa:zeal-developers/ppa
sudo apt-get update
sudo apt-get install -y zeal

# slack
sudo apt-add-repository -y ppa:rael-gc/scudcloud
sudo apt-get update
sudo apt-get install -y scudcloud

# java8 oracle
sudo apt-add-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer oracle-java8-set-default

# ruby
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable --ruby
rvm rvmrc warning ignore allGemfiles
gem install bundle rake puma ghi zeus rubocop rb-readline fancy_irb awesome_print
https://github.com/sescobb27/festinare_api.git

# node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash
source ~/.bashrc
nvm install 0.12
nvm alias default 0.12
npm install -g grunt-cli bower jshint

# go
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ~/.gvm/scripts/gvm
gvm install go1.4
gvm install go1.5
gvm use go1.5 --default
go get github.com/github/hub
go get golang.org/x/tools/cmd/goimports
echo 'eval "$(hub alias -s)"' >> ~/.bashrc

# depends on go
git clone https://github.com/direnv/direnv
cd direnv
sudo make install
cd ..
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc

cp dotfiles/.irbrc .
cp dotfiles/.railsrc .
cp dotfiles/.gemrc .
cp dotfiles/.gitconfig .
cp dotfiles/.gitignore .
cp dotfiles/.bash_config .
cp dotfiles/.bash_profile .
cp dotfiles/.bashrc .
cp dotfiles/.profile .

# docker
sudo apt-get install -y docker.io
sudo apt-get install lxc-docker
sudo usermod -aG docker $USER
echo 'sudo vim  /etc/default/grub  # change this => GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"'
echo "sudo update-grub"
curl -L https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose --version | awk 'NR==1{print $NF}')/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
curl -L https://github.com/docker/machine/releases/download/v0.4.0/docker-machine_linux-amd64 > /usr/local/bin/docker-machine
chmod +x /usr/local/bin/docker-machine

# ubuntu
sudo mkdir -p /usr/share/fonts/opentype
sudo git clone https://github.com/adobe-fonts/source-code-pro.git /usr/share/fonts/opentype/scp
sudo fc-cache -f -v

# vim
mkdir -p ~/.vim/{autoload,bundle,colors,scripts}
wget -P ~/.vim/autoload "https://tpo.pe/pathogen.vim"

git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone https://github.com/terryma/vim-multiple-cursors.git ~/.vim/bundle/vim-multiple-cursors
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/jistr/vim-nerdtree-tabs.git ~/.vim/bundle/vim-nerdtree-tabs
git clone https://github.com/mattn/emmet-vim.git ~/.vim/bundle/emmet-vim
git clone https://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular
git clone https://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround
git clone https://github.com/vim-ruby/vim-ruby.git ~/.vim/bundle/vim-ruby
git clone https://github.com/elixir-lang/vim-elixir.git ~/.vim/bundle/vim-elixir
# git clone https://github.com/rking/ag.vim ~/.vim/bundle
# git clone  ~/.vim/bundle
# git clone  ~/.vim/bundle
# git clone  ~/.vim/bundle
# git clone  ~/.vim/bundle
# git clone  ~/.vim/bundle

## Erlang
wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install -y erlang elixir
