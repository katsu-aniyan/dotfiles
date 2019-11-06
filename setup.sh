cd ~

# setup .git-prompt.sh
# see: https://qiita.com/varmil/items/9b0aeafa85975474e9b6
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
chmod a+x ~/.git-prompt.sh
echo "source ~/.git-prompt.sh" >> ~/.bashrc
echo please modify PS1 like '$(__git_ps1 " (%s)")'
