# Moteur : XeLaTeX (changer en $lualatex si préféré)
$pdf_mode = 5;          # 5 = xelatex → pdf direct
$xelatex = 'xelatex -interaction=nonstopmode -synctex=1 %O %S';

# Dossier de sortie (optionnel, garde le dossier racine propre)
$out_dir = 'build';

# Extensions à nettoyer avec latexmk -c
@generated_exts = qw(aux log out toc fls fdb_latexmk synctex.gz xdv nav snm vrb bcf run.xml);