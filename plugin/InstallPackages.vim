" File:         InstallPackages.vim
" Author:       Wayne Xue <xwsoul@gmail.com>
" Version:      0.1
" Last Modified: Jan 3, 2014

if !has('python') || version < 704 || exists('install_packages_loaded')
	finish
endif

let install_packages_loaded = 1

if !exists('install_packages_dir')
	let install_packages_dir = substitute(globpath(&rtp, 'install_packages/'), "\n", ',', 'g')
endif

py import sys
py import os
py import imp
py import vim
py sys.path.append(vim.vars["install_packages_dir"])
py import sublime
py import sublime_plugin

fun! InstallPackageRun(path)
    py <<EOF
f = os.path.join(vim.vars["install_packages_dir"], vim.eval("a:path") + '.py')
ipmain = imp.load_source('*', f)
cmd = None
for sub in dir(ipmain):
    sub = ipmain.__dict__[sub]
    if type(sub) == type and issubclass(sub, sublime_plugin.TextCommand):
        cmd = sub
        break
if cmd is not None:
    cmd().run(vim.current.window)
EOF
endfun

fun! InstallPackageTidy()
    let l:pkg = 'PHPTidy/phptidy'
    call InstallPackageRun(l:pkg)
    edit
endfun

command! -bar InsPkgTidy call InstallPackageTidy()
map <leader>f :InsPkgTidy<CR>
