autocmd BufNewFile,BufReadPost *.scala set filetype=scala
autocmd BufNewFile,BufReadPost *.sbt set filetype=scala
au filetype scala set shiftwidth=2
au filetype scala set tabstop=2
au filetype scala set expandtab
au filetype scala set omnifunc=SoulCompFunScala
