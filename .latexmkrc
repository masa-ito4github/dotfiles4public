#!/usr/bin/env perl

$latex            = 'latex -synctex=1';
$latex_silent     = 'latex -synctex=1 -interaction=batchmode';
$bibtex           = 'bibtex';
$dvipdf           = 'dvipdfmx %O -p a4 -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;

if ( $^O eq 'darwin' ) {
    $pdf_mode     = 3;   # generates pdf via dvipdfmx
    # Use Skim as a previewer
    $pdf_previewer    = "open -ga /Applications/Skim.app";
    # Prevent latexmk from removing PDF after typeset.
    # This enables Skim to chase the update in PDF automatically.
    $pvc_view_file_via_temporary = 0;
} elsif ( $^O eq 'linux' ) {
    #$pdf_mode     = 3;   # generates pdf via dvipdfmx
    $pdf_mode      = 0;          # generates only dvi
    $pdf_previewer = "okular";   # Use Okular as a previewer
    $pvc_view_file_via_temporary = 0;
}
