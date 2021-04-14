# Defined in - @ line 1
function cscr --wraps='sleep 1 && xset dpms force off' --description 'alias cscr sleep 1 && xset dpms force off'
  sleep 1 && xset dpms force off $argv;
end
