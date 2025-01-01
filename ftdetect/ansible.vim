"

au BufNewFile,BufRead ~/src/setup/*.yml         set ft=yaml.ansible
au BufNewFile,BufRead ~setup/*.yml              set ft=yaml.ansible
au BufNewFile,BufRead /home/setup.*/*.yml       set ft=yaml.ansible
au BufNewFile,BufRead */\(group\|host\)_vars/*  set ft=yaml.ansible
