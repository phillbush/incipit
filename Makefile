PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man
TMACPREFIX = ${PREFIX}/share/tmac

# target file: README.pdf or README.html
DOC = README.pdf

# paper format: paper, slides, book, or html
FORMAT = paper

# paper orientation: portrait, or landscape
ORIENTATION = portrait

# paper size: a4, letter, or halfletter
PAPERSIZE = a4

.SUFFIXES: .txt .pdf .ps .mi .html

all: ${DOC}

.ps.pdf:
	ps2pdf "-sPAPERSIZE=${PAPERSIZE}" $< $@

.mi.ps:
	<$< pic | tbl | eqn | troff -mi -mpictures - | dpost -p"${ORIENTATION}" >$@

.txt.mi:
	./incipit -- -T ${FORMAT} $< >$@

.txt.html:
	./incipit -- -T html $< >$@

install:
	install -D -m 755 incipit ${DESTDIR}${PREFIX}/bin/incipit
	install -D -m 644 incipit.1 ${DESTDIR}${MANPREFIX}/man1/incipit.1
	install -D -m 644 mi.7 ${DESTDIR}${MANPREFIX}/man7/mi.7
	install -D -m 644 tmac.i ${DESTDIR}${TMACPREFIX}/tmac.i

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/incipit
	rm -f ${DESTDIR}${MANPREFIX}/man1/incipit.1
	rm -f ${DESTDIR}${MANPREFIX}/man7/mi.7
	rm -f ${DESTDIR}${TMACPREFIX}/tmac.i

clean:
	-rm ${DOC} ${DOC:.pdf=.ps} ${DOC:.pdf=.mi}

.PHONY: all install uninstalll clean
