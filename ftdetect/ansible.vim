fun! s:DetectShebang()
    if getline(1) =~# '^#!.*/bin/env\s\+ansible-playbook\>'
        set ft=yaml.ansible
    endif
endfun

autocmd BufNewFile,BufRead * call s:DetectShebang()
