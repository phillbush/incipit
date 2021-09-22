PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man
TMACPREFIX = ${PREFIX}/share/tmac

# target file: README.pdf or README.html
DOC = README.pdf

# configuration for a4 papersize (used for technical papers)
FORMAT = paper
PAPERSIZE = a4
ORIENTATION = portrait
TFLAGS = -rH29.7c -rL16c -rT3c -rB2c -rE2.5c -rO2.5c

# configuration for landscape letter papersize (used for slides)
#FORMAT = slides
#PAPERSIZE = letter
#ORIENTATION = landscape
#TFLAGS = -rH8.5i -rL9i -rT1i -rB1i -rE1i -rO1i

# configuration for halfletter papersize (used for books)
#FORMAT = book
#PAPERSIZE = halfletter
#ORIENTATION = portrait
#TFLAGS = -rH21.6c -rL13.6c -rT2.1c -rB2.1c -rE2c -rO2c

.SUFFIXES: .txt .pdf .ps .mi .html

all: ${DOC}

.ps.pdf:
	ps2pdf "-sPAPERSIZE=${PAPERSIZE}" $< $@

.mi.ps:
	<$< pic | tbl | eqn | troff ${TFLAGS} -mi -mpictures - | dpost -p"${ORIENTATION}" >$@

.txt.mi:
	./incipit -- -T ${FORMAT} $< >$@

.txt.html:
	./incipit -- -T html $< >$@

install:
	install -D -m 755 incipit ${DESTDIR}${PREFIX}/bin/incipit
	install -D -m 644 incipit.1 ${DESTDIR}${MANPREFIX}/man1/incipit.1
	install -D -m 644 mi.7 ${DESTDIR}${MANPREFIX}/man7/mi.7
	install -D -m 644 mi.tmac ${DESTDIR}${TMACPREFIX}/tmac.i

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/incipit
	rm -f ${DESTDIR}${MANPREFIX}/man1/incipit.1
	rm -f ${DESTDIR}${MANPREFIX}/man7/mi.7
	rm -f ${DESTDIR}${TMACPREFIX}/tmac.i

clean:
	-rm ${DOC} ${DOC:.pdf=.ps} ${DOC:.pdf=.mi}

.PHONY: all install uninstalll clean
