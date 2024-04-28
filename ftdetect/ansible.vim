fun! s:DetectShebang()
    let l:firstline = getline(1)
    if l:firstline =~# '^#!.*/bin/env\s\+ansible-playbook\>'
        set ft=yaml.ansible
    endif
endfun

autocmd BufNewFile,BufRead * call s:DetectShebang()
