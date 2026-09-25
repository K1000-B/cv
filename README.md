# CV — LaTeX modulaire (XeLaTeX)

CV deux colonnes sur une page A4, à compiler **uniquement avec XeLaTeX**
(usage de `fontspec`).

## Compilation

Depuis le dossier `cv/` :

```bash
latexmk -xelatex cv.tex
```

ou, à défaut de `latexmk` :

```bash
xelatex cv.tex && xelatex cv.tex
```

Nettoyage des fichiers intermédiaires :

```bash
latexmk -c cv.tex
```

## Dépendances LaTeX

Toutes incluses dans une distribution TeX Live / MacTeX récente :

| Package        | Rôle                                  |
|----------------|---------------------------------------|
| `fontspec`     | polices système (requiert XeLaTeX)    |
| `geometry`     | marges de page                        |
| `xcolor`       | couleurs                              |
| `paracol`      | deux colonnes synchronisées           |
| `enumitem`     | espacement compact des listes         |
| `tikz`         | barres de compétences                 |
| `fontawesome5` | icônes (mail, tel, LinkedIn, GitHub…) |
| `ragged2e`     | `\RaggedRight` dans la colonne étroite|
| `hyperref`     | liens cliquables                      |

Vérifier la présence d'un package :

```bash
kpsewhich paracol.sty
```

## Vérification des polices

Le préambule essaie successivement **Helvetica Neue → Roboto → Latin Modern Sans**.
Pour lister les polices système disponibles :

```bash
fc-list | grep -i "helvetica neue"
fc-list | grep -i "roboto"
```

Pour forcer une autre police : éditer `preamble.sty`, section *Polices*.

## Structure

```
cv/
├── cv.tex              # document principal
├── preamble.sty        # packages, couleurs, polices, macros
├── sections/
│   ├── header.tex      # nom, titre, contact
│   ├── education.tex
│   ├── experience.tex
│   ├── skills.tex      # colonne latérale (profil, skills, langues)
│   └── projects.tex
└── README.md
```

## Macros disponibles (définies dans `preamble.sty`)

| Macro                                          | Arguments                                    |
|------------------------------------------------|----------------------------------------------|
| `\cvsection{titre}`                            | titre de section avec règle horizontale      |
| `\cventry{titre}{dates}{organisation}{contenu}`| entrée formation / expérience / projet       |
| `\cvcontact{icône}{texte}`                     | ligne de contact (icône colorée + texte)     |
| `\skillbar{label}{niveau 0–1}`                 | barre de compétence TikZ                     |

## Personnalisation rapide

- **Couleur d'accent** : modifier `\definecolor{accent}{…}` en tête de
  `preamble.sty`.
- **Ratio des colonnes** : changer `\columnratio{0.32}` dans `cv.tex`
  (0.32 → 32 % pour la colonne latérale).
- **Police** : ajuster les `\IfFontExistsTF` dans `preamble.sty`.

## Si le CV déborde sur 2 pages

Dans l'ordre, jusqu'à ce qu'il rentre :

1. Réduire `itemsep=1pt` (dans `\setlist[itemize]` de `preamble.sty`) à `0pt`.
2. Réduire les marges (`geometry`, top/bottom 0.8 cm, left/right 1 cm).
3. Passer la classe à `9pt` : `\documentclass[9pt,a4paper]{extarticle}`
   (nécessite `extarticle`).
4. Couper une entrée non-essentielle plutôt que de tout serrer.

## État

Compilé avec succès : 1 page A4, sortie `cv.pdf`.
