" prevent load twice
if exists("b:did_py_plugin")
    finish
endif
let b:did_py_plugin = 1

setlocal shiftwidth=2
setlocal tabstop=2
