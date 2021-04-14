# Defined in - @ line 1
function cmon --wraps='sleep 1 && xset dpms force off' --description 'alias cmon sleep 1 && xset dpms force off'
  sleep 1 && xset dpms force off $argv;
end
