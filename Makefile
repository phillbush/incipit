# installation paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man
TMACPREFIX = ${PREFIX}/share/tmac

# generated files
DOC = README.pdf
TMACS = tmac.p tmac.t tmac.b
PROGS = i2html i2roff

# configuration for A4 papersize (used for technical papers)
MACRO = mt
PAPERSIZE = a4
ORIENTATION = portrait

# configuration for landscape letter papersize (used for slides)
#MACRO = mp
#PAPERSIZE = letter
#ORIENTATION = landscape

# configuration for halfletter papersize (used for books)
#MACRO = mb
#PAPERSIZE = halfletter
#ORIENTATION = portrait

.SUFFIXES: .txt .pdf .ps .roff .html

all: ${TMACS} ${PROGS}

doc: ${DOC}

.ps.pdf:
	ps2pdf "-sPAPERSIZE=${PAPERSIZE}" $< $@

.roff.ps:
	<$< pic | tbl | troff -${MACRO} -mpictures - | dpost -p"${ORIENTATION}" >$@

.txt.roff:
	i2roff $< >$@

.txt.html:
	i2html $< >$@

i2roff: incipit
	cp incipit i2roff
	chmod +x i2html

i2html: incipit
	sed '5s/roff/html/' incipit > i2html
	chmod +x i2html

tmac.b: common.tmac mb.tmac
	cat common.tmac mb.tmac > tmac.b

tmac.t: common.tmac mt.tmac
	cat common.tmac mt.tmac > tmac.t

tmac.p: common.tmac mp.tmac
	cat common.tmac mp.tmac > tmac.p

install: all
	install -D -m 755 i2roff ${DESTDIR}${PREFIX}/bin/i2roff
	install -D -m 755 i2html ${DESTDIR}${PREFIX}/bin/i2html
	install -D -m 644 mi.7 ${DESTDIR}${MANPREFIX}/man7/mb.7
	install -D -m 644 mi.7 ${DESTDIR}${MANPREFIX}/man7/mp.7
	install -D -m 644 mi.7 ${DESTDIR}${MANPREFIX}/man7/mt.7
	install -D -m 644 tmac.b ${DESTDIR}${TMACPREFIX}/tmac.b
	install -D -m 644 tmac.p ${DESTDIR}${TMACPREFIX}/tmac.p
	install -D -m 644 tmac.t ${DESTDIR}${TMACPREFIX}/tmac.t

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/i2roff
	rm -f ${DESTDIR}${PREFIX}/bin/i2html
	rm -f ${DESTDIR}${MANPREFIX}/man7/mb.7
	rm -f ${DESTDIR}${MANPREFIX}/man7/mp.7
	rm -f ${DESTDIR}${MANPREFIX}/man7/mt.7
	rm -f ${DESTDIR}${TMACPREFIX}/tmac.b
	rm -f ${DESTDIR}${TMACPREFIX}/tmac.p
	rm -f ${DESTDIR}${TMACPREFIX}/tmac.t

clean:
	-rm ${PROGS} ${TMACS} ${DOC} ${DOC:.pdf=.ps} ${DOC:.pdf=.roff}

.PHONY: all install uninstalll clean
