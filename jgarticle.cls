\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jgarticle}[2023/07/14 Jacques' Article Class]

% Load the article class, forwarding all provided options to it
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Packages <<<
\RequirePackage{xparse}
\RequirePackage{xcolor}
\RequirePackage{amsmath}
\RequirePackage{hyperref}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage[cal=boondox]{mathalpha}
\RequirePackage{enumitem}
\RequirePackage{tikz-cd}
\RequirePackage[nameinlink, capitalise]{cleveref}
% >>>

% Article class overrides <<<
\if@titlepage
    \let\articlemaketitle\maketitle
    \renewcommand{\maketitle}{\hypersetup{pageanchor=false}\articlemaketitle}
\fi

\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname.\enspace}

% Spacing around display environments
\AtBeginDocument{%
    \abovedisplayskip=1ex \@plus .2ex
    \abovedisplayshortskip=1ex \@plus .2ex
    \belowdisplayskip=1ex \@plus .2ex
    \belowdisplayshortskip=1ex \@plus .2ex}
% >>>

% Custom theorem environments <<<
\numberwithin{equation}{section}
\crefname{equation}{}{}
\crefname{item}{}{}
\crefname{section}{Section}{Sections}
\crefname{subsection}{Section}{Sections}

\newtheoremstyle{theorem}%
    {1ex \@plus .2ex}%
    {1ex \@plus .2ex}%
    {\itshape}%
    {0pt}%
    {\bfseries}%
    {.}%
    {0.5em}%
    {\thmname{#1}\thmnumber{ #2}\thmnote{\ (#3)}}

\theoremstyle{theorem}

\newtheorem{theorem}{Theorem}[section]
\newtheorem*{theorem*}{Theorem}

\newtheorem{lemma}[theorem]{Lemma}
\newtheorem*{lemma*}{Lemma}

\newtheorem{proposition}[theorem]{Proposition}
\newtheorem*{proposition*}{Proposition}
\newlist{propenum}{enumerate}{1}
\setlist[propenum]{label=(\alph*), ref=\theproposition(\alph*)}
\crefalias{propenumi}{proposition}

\newtheorem{corollary}[theorem]{Corollary}
\newtheorem*{corollary*}{Corollary}
\crefname{corollary}{Corollary}{Corollaries}

\newtheoremstyle{definition}%
    {1ex \@plus .2ex}%
    {1ex \@plus .2ex}%
    {\normalfont}%
    {0pt}%
    {\bfseries}%
    {.}%
    {0.5em}%
    {\thmname{#1}\thmnumber{ #2}\thmnote{\ (#3).}}

\theoremstyle{definition}

\newtheorem{definition}[theorem]{Definition}
\newtheorem*{definition*}{Definition}
\crefname{definition}{Definition}{Definitions}

\newtheorem{aside}[theorem]{Aside}
\newtheorem*{aside*}{Aside}
\crefname{aside}{Aside}{Asides}

\newtheorem{example}[theorem]{Example}
\newtheorem*{example*}{Example}

\newtheorem{question}[theorem]{Question}
\newtheorem{question*}{Question}

\newtheorem{exercise}[theorem]{Exercise}
\newtheorem*{exercise*}{Exercise}

\newtheorem{problem}{Problem}
\newtheorem{problem*}{Problem}

\newtheoremstyle{remark}%
    {1ex \@plus .2ex}%
    {1ex \@plus .2ex}%
    {\normalfont}%
    {0pt}%
    {\bfseries}%
    {.}%
    {0.5em}%
    {\thmname{#1}\thmnumber{ #2}\thmnote{\ (#3).}}

\theoremstyle{remark}

\newtheorem{remark}[theorem]{Remark}
\newtheorem*{remark*}{Remark}
\crefname{remark}{Remark}{Remarks}


\newtheoremstyle{proof}%
    {1ex \@plus .2ex}%
    {1ex \@plus .2ex}%
    {\normalfont}%
    {}%
    {\itshape}%
    {.}%
    {.5em}%
    {}

\let\proof\@jgundefined
\let\endproof\@jgundefined

\theoremstyle{proof}

\newtheorem*{@proof}{Proof}
\newenvironment{proof}%
    {\renewcommand{\qedsymbol}{\(\square\)}\pushQED{\qed}\begin{@proof}}%
    {\popQED\end{@proof}}

\newtheorem*{@solution}{Solution}
\newenvironment{solution}%
    {\renewcommand{\qedsymbol}{\(\square\)}\pushQED{\qed}\begin{@solution}}%
    {\popQED\end{@solution}}

\newenvironment{inline}
    {\list{}{\rightmargin=\leftmargin\topsep=.5em\itshape}%
    \item\relax}%
    {\endlist}
% >>>

% Styling <<<
\setlist{%
    label         = (\alph*),
    listparindent = \parindent,
    topsep        = \smallskipamount,
    parsep        = \parskip,
    left          = .5ex}

\tikzcdset{arrow style = math font}

\newcommand{\defn}[1]{\emph{#1}}
\newcommand{\comment}[1]{\textcolor{red}{#1}}
% >>>

% Math <<<

% Overrides
\renewcommand{\phi}{\varphi}
\renewcommand{\epsilon}{\varepsilon}
\renewcommand{\emptyset}{\varnothing}

\let\Re\@jgundefined
\let\Im\@jgundefined
\DeclareMathOperator{\Re}{Re}
\DeclareMathOperator{\Im}{Im}

\renewcommand{\implies}{\Rightarrow}
\renewcommand{\iff}{\Leftrightarrow}

% Relations
\newcommand{\deq}{\vcentcolon=}
\newcommand{\deqby}{=\vcentcolon}
\newcommand{\iso}{\simeq}
\newcommand{\isoto}{\xrightarrow{\smash{\raisebox{-0.65ex}{\ensuremath{\sim}}}}}
\newcommand{\comp}{\circ}

% Linear algebra
\newcommand{\dual}{\ast}
\newcommand{\adj}{\dagger}

% Operators
\DeclareMathOperator{\id}{id}
\DeclareMathOperator{\Id}{Id}
\DeclareMathOperator{\supp}{supp}
\DeclareMathOperator{\dist}{dist}
\DeclareMathOperator{\im}{im}
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\coker}{coker}
\DeclareMathOperator*{\Res}{Res}

% Delimiters
\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
\DeclarePairedDelimiter{\modl}{\lvert}{\rvert}
\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\innprod}{\langle}{\rangle}

% Sets
\let\numset\vvmathbb
\newcommand{\RR}{\numset{R}}
\newcommand{\CC}{\numset{C}}
\newcommand{\QQ}{\numset{Q}}
\newcommand{\NN}{\numset{N}}
\newcommand{\KK}{\numset{K}}
\newcommand{\ZZ}{\numset{Z}}
\newcommand{\FF}{\numset{F}}
\newcommand{\Sph}{\numset{S}}
\NewDocumentCommand{\SymGrp}{m}{S_{#1}}

\providecommand{\st}{}
\DeclarePairedDelimiterX{\set}[1]{\{}{\}}{%
    \renewcommand{\st}{:}%
    #1}
\DeclarePairedDelimiterX{\grp}[1]{\langle}{\rangle}{%
    \renewcommand{\st}{:}%
    #1}

% Modifiers
\renewcommand{\vec}[1]{\mathbf{#1}}
\newcommand{\utilde}[1]{\underaccent{\tilde}{#1}}

% Linear algebra
\newcommand{\dsum}{\oplus}
\newcommand{\dprod}{\times}
\newcommand{\tprod}{\otimes}
\newcommand{\kprod}{\otimes}
\newcommand{\bigdprod}{\prod}
\newcommand{\bigdsum}{\bigoplus}
\newcommand{\bigtprod}{\bigotimes}
\newcommand{\inclusion}{\hookrightarrow}

\DeclareMathOperator{\Mat}{Mat}
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\Hom}{Hom}
\DeclareMathOperator{\End}{End}
\newcommand{\Ext}{\Lambda}
\newcommand{\Sym}{S}

\newcommand{\pmat}[1]{\begin{pmatrix}#1\end{pmatrix}}
\newcommand{\bmat}[1]{\begin{bmatrix}#1\end{bmatrix}}
\newcommand{\Bmat}[1]{\begin{Bmatrix}#1\end{Bmatrix}}
\newcommand{\vmat}[1]{\begin{vmatrix}#1\end{vmatrix}}
\newcommand{\Vmat}[1]{\begin{Vmatrix}#1\end{Vmatrix}}

\newcommand{\blank}{{-}}

% Fourier transform
\newcommand{\Sw}{\mathcal{S}}
\newcommand{\Ft}{\mathcal{F}}
\newcommand{\conv}{\ast}

% Differential operators
\NewDocumentCommand{\Symb}{mm}{S^{#2}(#1)}
\DeclareMathOperator{\Op}{Op}
\DeclareMathOperator{\PDO}{PDO}
\DeclareMathOperator{\PsDO}{\upPsi DO}
\newcommand{\prinsymb}{\sigma}
\DeclareMathOperator{\ind}{ind}

% Manifolds
\newcommand{\VecF}{\mathcal{X}}
\newcommand{\DForm}{\Omega}
\newcommand{\HForm}{\mathcal{H}}
\newcommand{\Sec}{\Gamma}
%\newcommand{\vol}{\mathrm{vol}}
\newcommand{\conn}{\nabla}
\newcommand{\lapl}{\Delta}
\newcommand{\hstar}{\ast}
\DeclareMathOperator{\divg}{div}
\newcommand{\hook}{\mathop{\lrcorner}}

% Functional analysis
\newcommand{\BLOP}{\mathcal{B}}

% Derivatives
\NewDocumentCommand{\dv}{smo}{\IfBooleanTF{#1}%
    {\frac{d\IfValueT{#3}{#3}}{d#2}}%
    {d\IfValueT{#3}{#3}/d#2}}

\NewDocumentCommand{\mdv}{smmo}{\IfBooleanTF{#1}%
    {\frac{d^{#3}\IfValueT{#4}{#4}}{d#2^{#3}}}%
    {d^{#3}\IfValueT{#4}{#4}/d#1^{#3}}}

\NewDocumentCommand{\pdv}{smo}{\IfBooleanTF{#1}%
    {\frac{\partial\IfValueT{#3}{#3}}{\partial #2}}%
    {\partial\IfValueT{#3}{#3}/\partial #2}}

\NewDocumentCommand{\@PdvParseVariable}{>{\SplitList{,}}m}{\ProcessList{#1}{\@PdvParseExponent}}
\NewDocumentCommand{\@PdvParseExponent}{m}{\partial #1}

\NewDocumentCommand{\mpdv}{s>{\SplitList{,}}mmo}{\IfBooleanTF{#1}%
    {\frac%
        {\partial^{#3}\IfValueT{#4}{#4}}
        {\ProcessList{#2}{\@PdvParseVariable}}}%
    {\partial^{#3}\IfValueT{#4}{#4}/\ProcessList{#2}{\@PdvParseVariable}}}

% Meta
\newcommand{\omitterm}[1]{\widehat{#1}}

\NewDocumentCommand{\evalat}{smm}{\IfBooleanTF{#1}%
    {\mathopen{}%
        \kern-\nulldelimiterspace%
        \left.%
        #2%
        \right\rvert_{#3}%
        \mathclose{}}%
    {#2\rvert_{#3}}}

\let\restto\evalat
% >>>

% vim:fdm=marker:fmr=<<<,>>>:
