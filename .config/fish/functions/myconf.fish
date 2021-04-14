# Defined in - @ line 1
function myconf --wraps='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME' --description 'alias myconf=/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
  /usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME $argv;
end
