" prevent load twice
if exists("b:did_ts_plugin")
    finish
endif
let b:did_ts_plugin = 1

setlocal shiftwidth=2
" for typescript syntax
setlocal re=0
