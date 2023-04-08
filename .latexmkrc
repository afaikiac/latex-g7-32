$ENV{'TEXINPUTS'}='./tex//:./lib//:./G7-32/tex//:' . $ENV{'TEXINPUTS'};
$ENV{'BIBINPUTS'}='./tex//:' . $ENV{'BIBINPUTS'};
$ENV{'BSTINPUTS'}='./GOST/bibtex/bst/gost//:' . $ENV{'BSTINPUTS'};

$pdflatex = 'xelatex -synctex=1 -interaction=nonstopmode -shell-escape %O %S';
# Custom dependency and function for nomencl package 
add_cus_dep( 'nlo', 'nls', 0, 'makenlo2nls' );
sub makenlo2nls {
system( "makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"" );
}

$pdf_mode = 1;
$bibtex_use = 1;
