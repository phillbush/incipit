.\" mi: macros for incipit
.       \" begin of document
.de bG
.fi
.ll \\n(LLu
.lt \\n(LLu
.wh 0 tM
.wh -\\n(BMu/2u bT
.wh -\\n(BMu bM
.tM
.nr iN 0
.nr bG 1
..
.       \" draw horizontal line
.de HL
.br
\l'\\n(.lu-\\n(.iu\&\\$1'
.br
..
.       \" begin of body
.de bY
.if !\\n(bG .bG
.sp 2
.ns
.nr bY 1
..
.       \" top margin
.de tM
'sp \\n(TMu/2u
.ev 1
.lt \\n(LLu
.ie \\n(SD=1 \{\
.       ps \\n(PS-6
.       vs \\n(VS-6p
.\}
.el \{\
.       ps \\n(PS-2
.       vs \\n(VS-2p
.\}
.ft R
.if \\n(SD=2 \{\
.        if e \{\
.                ie !"\\*(cH"" .tl %\\*(cH
.                el            .tl %\\*(tL
.        \}
.        if o \{\
.                ie !"\\*(sH"" .tl \\*(sH%
.                el            .tl %
.        \}
.\}
.if \\n(SD=0 .tl %
.if o .po \\n(OMu
.if e .po \\n(EMu
.ev
'sp |\\n(TMu
'ns
.nr mT 1
..
.       \" bottom title
.de bT
.ev 1
.ie \\n(SD=1 \{\
.       ps \\n(PS-6
.       vs \\n(VS-6p
.\}
.el \{\
.       ps \\n(PS-2
.       vs \\n(VS-2p
.\}
.ft R
.if \{\
.       ie \\n(SD=1 \{\
.               ie !"\\*(sH"" .tl \\*(tL/\\*(sN \\*(sH%
.               el            .tl \\*(tL%
.       \}
.\}
.ev
..
.       \" bottom margin
.de bM
'bp
..
.       \" paragraph break
.de pB
.ie \\n(SD=1 .bp
.el .br
..
.       \" reset
.de rT
.if !\\n(bY .bY
.br
.ce 0
.fi
.ad b
.hy 14
.ps \\n(PS
.vs \\n(VS
.if n .ta 8n 16n 24n 32n 40n 48n 56n 64n 72n 80n
.if t .ta 5n 10n 15n 20n 25n 30n 35n 40n 45n 50n 55n 60n 65n 70n 75n
..
.       \" title
.de TL
.rm sH
.nr bY 0
.ds tL \\$1
.nr mT 0
.if !\\n(bG .bG
.ce 999
.ft B
.ie \\n(SD=1 \{\
.       ps \\n(PS+10
.       vs \\n(VS+10p
.\}
.el \{\
.       ps \\n(PS+4
.       vs \\n(VS+4p
.\}
.ne 4
.hy 0
.nf
.ie !"\\$2"" \{\
\\$1:
.br
\\$2
.\}
.el \{\
\\$1
.\}
..
.       \" chapter
.de CH
.rm sH
.ds cH \\$1
.nr mT 0
.if \\n%>1       .bp
.if \\n%>1 .if e .bp
.nr bY 0
.nr h0 +1
.nr h1 0
.nr h2 0
.nr h3 0
.nr h4 0
.nr h5 0
.if !\\n(bG .bG
.fi
.ad r
.ft B
.ps \\n(PS+30
.vs \\n(VS+30p
.ne 4
.hy 0
\\n(h0
.br
.ps \\n(PS+12
.vs \\n(VS+12p
.ie !"\\$2"" \{\
\\$1:
.br
\\$2
.\}
.el \{\
\\$1
.\}
..
.       \" author
.de AU
.ce 999
.ft I
.ps \\n(PS
.vs \\n(VS
.sp .5
.nf
\\$1
.if !"\\$2"" \{\
.br
\\$2
.\}
..
.       \" abstract begin
.de AB
.pB
.rT
.sp 2
.if !"\\$1"" \{\
.ce 1
\fB\\$1\fP
.\}
.fi
.ll \\n(LLu-10n
.in 10n
..
.de AE
.ll \\n(LLu
.in 0
.nr bY 0
..
.       \" paragraph
.de PP
.pB
.rT
.ie \\n(sI     .sp 1
.el .ie \\n(fI .sp \\n(FDu
.el            .sp \\n(PDu
.ne 1+\\n(.Vu
.ft R
.ie \\n(SP=1                 .ti \\n(.iu+\\n(PIu
.el .if \\n(SP=2 .if !\\n(fI .ti \\n(.iu+\\n(PIu
.nr fI 0
.nr sI 0
.if !"\\$1"" \fB\\$1\fP
..
.       \" SH - section header
.de SH
.pB
.rT
.ds sH \\$2
.ti \\n(.iu
.ne 5.1
.sp 1
.ft B
.ie \\n(SD=1 \{\
.       ps \\n(PS+12
.       vs \\n(VS+12p
.       HL
.\}
.el \{\
.       ps \\n(PS+2
.       vs \\n(VS+2p
.\}
.nr h\\$1 +1
.if !\\$1-4 .nr h5 0
.if !\\$1-3 .nr h4 0
.if !\\$1-2 .nr h3 0
.if !\\$1-1 .nr h2 0
.if !\\$1 .if \\n(.$ .nr h1 1
.if \\$1S \{\
.	nr nS \\n(.$-1
.	nr h1 \\$2 0
.	nr h2 \\$3 0
.	nr h3 \\$4 0
.	nr h4 \\$5 0
.	nr h5 \\$6 0
.\}
.if \\n(SS              .ds sN \\n(h1.
.if \\n(SS   .if \\n(h0 .ds sN \\n(h0.\\n(h1.
.if \\n(SS>1 .if \\$1-1 .as sN \\n(h2.
.if \\n(SS>2 .if \\$1-2 .as sN \\n(h3.
.if \\n(SS>3 .if \\$1-3 .as sN \\n(h4.
.if \\n(SS>4 .if \\$1-4 .as sN \\n(h5.
.if \\n(SS \\*(sN
\\$2
.nr sI 1
..
.       \" figure start
.de FS
.br
.in 0
.ti 0
.di fG
..
.       \" figure end
.de FE
.br
.di
.nf
.ne \\n(dnu
.ie \\n(sI     .sp 1
.el .sp \\n(FDu
.fG
.nr fI 1
.nr sI 0
..
.       \" figure caption
.de FC
.ps \\n(PS
.vs \\n(VS
.nr fC \\n(.u
.di fC
.ie "\\$2"t" \{\
.nr tN +1
\fB\\*T \\n(tN:\0\fR\\$1
.\}
.el \{\
.nr fN +1
\fB\\*F \\n(fN:\0\fR\\$1
.\}
.br
.di
.in ((\\n(.lu-\\n(.iu)/2u)-(\\n(dlu/2u)
.fi
.ad b
.fC
.in
.ie \\(fC .fi
.el       .nf
.rm fC
.rr fC
..
.       \" table start
.de TS
.br
.nf
..
.       \" picture start
.de PS
.in ((\\n(.lu-\\n(.iu)/2u)-(\\$2/2u)
..
.       \" picture end
.de PE
.in
..
.       \" code start
.de CS
.nr iN +1
.nr i\\n(iN \\n(.i
.in +\\n(PIu
.nf
.ps \\n(PS-1
.vs \\n(VS-1
.ft CW
..
.       \" code end
.de CE
.ft P
.ps \\n(PS
.vs \\n(VS
.in \\n(i\\n(iNu
.nr iN -1
.fi
..
.       \" quote start
.de QS
.br
.nr iN +1
.nr i\\n(iN \\n(.i
.in +\\n(PIu
..
.       \" quote end
.de QE
.br
.in \\n(i\\n(iNu
.nr iN -1
..
.       \" list start
.de LS
.br
.ie \\n(sI     .sp 1
.el .if \\n(fI .sp \\n(FDu
.nr lN +1
.nr iN +1
.nr l\\n(lN 0
.rm l\\n(lN
.ie !"\\$1"" .af l\\n(lN \\$1
.el          .ds l\\n(lN b
.nr i\\n(iN \\n(.iu
.ie \\n(lN>1 .in +4n
.el          .in +3n
.nr sI 0
.nr fI 0
..
.       \" list end
.de LE
.br
.in \\n(i\\n(iNu
.nr lN -1
.nr iN -1
..
.       \" list item
.de LI
.br
.nr l\\n(lN +1
.ie "\\*(l\\n(lN"b" \{\
.ti -3n
.ta 2n
\fB\(bu\t\fP\c
.\}
.el                 \{\
.ti -3n
.ta 3n
\fB\\n(l\\n(lN\&.\t\fP\c
.\}
.if !"\\$1"" \fB\\$1\fP
..
.       \" initialization
.nr TM 1i
.nr BM 1i
.nr EM \n(.o
.nr OM \n(.o
.nr FL 5.5i
.nr LL 6i
.nr PI 5n
.nr PS 10
.nr VS 12
.nr SD 0
.nr SP 1
.nr SS 4
.nr fN 0
.nr tN 0
.if n .nr PD 1v
.if t .nr PD .3v
.if n .nr FD 1v
.if t .nr FD 1v
.ds C Chapter
.ds F Figure
.ds T Table