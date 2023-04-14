$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -shell-escape %O %S';
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -shell-escape %O %S';

# Source: https://www.overleaf.com/learn/how-to/How_does_Overleaf_compile_my_project%3F#A_listing_of_Overleaf’s_LatexMk_file_(2022)
add_cus_dep("nlo", "nls", 0, "nlo2nls");
sub nlo2nls {
  system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg");
}

$ENV{'TEXINPUTS'} = './tex//:./lib//:./lib/G7-32/tex//:' . $ENV{'TEXINPUTS'};
$ENV{'BIBINPUTS'} = './res//:' . $ENV{'BIBINPUTS'};
$ENV{'BSTINPUTS'} = './lib/GOST/bibtex/bst/gost//:' . $ENV{'BSTINPUTS'};

$bibtex_use = 1;
