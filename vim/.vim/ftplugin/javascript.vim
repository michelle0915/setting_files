" prevent load twice
if exists("b:did_js_plugin")
    finish
endif
let b:did_js_plugin = 1
