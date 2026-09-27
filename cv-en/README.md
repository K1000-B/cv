# CV — Modular LaTeX Template (XeLaTeX)

Two-column, one-page A4 CV to be compiled **exclusively with XeLaTeX** because it uses `fontspec`.

## Compilation

From the `cv-en/` directory:

```bash
latexmk -xelatex cv.tex
```

Or, if `latexmk` is unavailable:

```bash
xelatex cv.tex && xelatex cv.tex
```

To remove intermediate files:

```bash
latexmk -c cv.tex
```

## LaTeX Dependencies

All dependencies are included in a recent TeX Live / MacTeX distribution:

| Package        | Purpose                                      |
|----------------|----------------------------------------------|
| `fontspec`     | system fonts (requires XeLaTeX)              |
| `geometry`     | page margins                                 |
| `xcolor`       | colours                                      |
| `paracol`      | synchronized two-column layout               |
| `enumitem`     | compact list spacing                         |
| `tikz`         | skill bars                                   |
| `fontawesome5` | icons (email, phone, LinkedIn, GitHub, etc.) |
| `ragged2e`     | `\RaggedRight` in the narrow column          |
| `hyperref`     | clickable links                              |

To check whether a package is installed:

```bash
kpsewhich paracol.sty
```

## Font Verification

The preamble attempts to use the following fonts in order: **Helvetica Neue → Roboto → Latin Modern Sans**.

To list the available system fonts:

```bash
fc-list | grep -i "helvetica neue"
fc-list | grep -i "roboto"
```

To use a different font, edit the *Fonts* section of `preamble.sty`.

## Structure

```
cv-en/
├── cv.tex              # main document
├── preamble.sty        # packages, colours, fonts, and macros
├── sections/
│   ├── header.tex      # name and title
│   ├── education.tex
│   ├── experience.tex
│   ├── skills.tex      # sidebar (contact details, skills, languages)
│   └── projects.tex
└── README.md
```

## Available Macros (Defined in `preamble.sty`)

| Macro                                          | Arguments                                    |
|------------------------------------------------|----------------------------------------------|
| `\cvsection{title}`                            | section title with a horizontal rule         |
| `\cventry{title}{dates}{organization}{content}`| education, experience, or project entry      |
| `\cvcontact{icon}{text}`                       | contact line with a coloured icon and text   |
| `\skillbar{label}{level 0–1}`                  | TikZ skill bar                               |

## Quick Customization

- **Accent colour**: edit `\definecolor{accent}{…}` at the beginning of `preamble.sty`.
- **Column ratio**: change `\columnratio{0.36}` in `cv.tex` (0.36 → 36% for the sidebar).
- **Font**: adjust the `\IfFontExistsTF` commands in `preamble.sty`.

## If the CV Extends to Two Pages

Try the following steps in order until it fits on one page:

1. Reduce `itemsep=1pt` in `\setlist[itemize]` within `preamble.sty` to `0pt`.
2. Reduce the margins in `geometry` to 0.8 cm at the top and bottom and 1 cm on the left and right.
3. Change the document class to `9pt`: `\documentclass[9pt,a4paper]{extarticle}` (requires `extarticle`).
4. Remove a non-essential entry instead of compressing the entire document excessively.

## Status

Successfully compiled as a one-page A4 document with the output file `cv.pdf`.
