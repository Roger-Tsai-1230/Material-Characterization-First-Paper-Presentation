# .latexmkrc
$pdf_mode = 5;                  # 5 代表使用 xelatex
$postscript_mode = $dvi_mode = 0;
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$bibtex_use = 2;
$out_dir = 'build';             # 將暫存檔集中在 build/，維持目錄整潔