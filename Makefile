STATIC_FILE = static
MAIN_FILE   = main
LATEX_C     = xetex

default: main

all: clean static main

clean:
	(rm -rf *.log *.gz *.pdf *.aux *.out *.toc *.fdb_latexmk *.fls *.synctex.gz* *.fmt)

static:
	(pdflatex -ini -jobname="${STATIC_FILE}" "&${LATEX_C} ${STATIC_FILE}.tex\dump")

main:
	(latexmk -pdf -pvc -e '$$latex=q/latex %O -shell-escape %S/' ${MAIN_FILE}.tex)
