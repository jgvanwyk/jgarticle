\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jgarticle}[2023/03/22 Jacques' Article Class]

% Load and forward options to the built-in article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Packages
\RequirePackage{xparse}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage[cal=boondox]{mathalpha}
\RequirePackage{enumitem}

% Section titles
\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname.\enspace}

\renewcommand{\section}{\@startsection{section}{1}{\z@}%
    {-3.25ex\@plus -1ex \@minus -.2ex}%
    {1.5ex \@plus .2ex}%
    {\centering\normalfont\bfseries}}

\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
    {-3.25ex\@plus -1ex \@minus -.2ex}%
    {1.5ex \@plus .2ex}%
    {\normalfont\bfseries}}

% Article title
\renewcommand{\@maketitle}{%
    \newpage
    \null
    \vskip 2em
    \begin{center}%
        \let\footnote\thanks
        {\Large\bfseries \@title \par}
        \vskip 1.5em
        {\large
            \lineskip .5em
            \begin{tabular}[t]{c}
                \@author
            \end{tabular}
            \par}
        \vskip 1em
        {\large \@date}
    \end{center}%
    \par
    \vskip 1em}

% Equation numbering
\numberwithin{equation}{section}

% Spacing around display environments
\AtBeginDocument{%
    \abovedisplayskip=0.35\baselineskip plus 0.35\baselineskip
    \abovedisplayshortskip=0.35\baselineskip plus 0.35\baselineskip
    \belowdisplayskip=0.35\baselineskip plus 0.35\baselineskip
    \belowdisplayshortskip=0.35\baselineskip plus 0.35\baselineskip}

% Custom theorem environments
\newtheoremstyle{thmstyle}%
    {0.35\baselineskip}%
    {0.35\baselineskip}%
    {\itshape}%
    {0pt}%
    {\bfseries}%
    {.}%
    {0.5em}%
    {\thmnumber{#2\enspace}\thmname{#1}\thmnote{ (#3)}}
\theoremstyle{thmstyle}
\newtheorem{thm}{Theorem}[section]
\newtheorem{lem}[thm]{Lemma}
\newtheorem{prop}[thm]{Proposition}
\newtheorem{cor}[thm]{Corollary}
\newtheorem*{thm*}{Theorem}
\newtheorem*{lem*}{Lemma}
\newtheorem*{prop*}{Proposition}
\newtheorem*{cor*}{Corollary}

\newtheoremstyle{defnstyle}%
    {0.35\baselineskip}%
    {0.35\baselineskip}%
    {\normalfont}%
    {0pt}%
    {\bfseries}%
    {.}%
    {0.5em}%
    {\thmnumber{#2\enspace}\thmname{#1}\thmnote{ (#3)}}
\theoremstyle{defnstyle}
\newtheorem{defn}[thm]{Definition}
\newtheorem*{defn*}{Definition}
\newtheorem{defns}[thm]{Definitions}
\newtheorem*{defns*}{Definitions}
\newtheorem{examp}[thm]{Example}
\newtheorem*{examp*}{Example}

\newtheoremstyle{probstyle}%
    {0.35\baselineskip}%
    {0.35\baselineskip}%
    {\normalfont}%
    {0pt}%
    {\bfseries}%
    {.}%
    {0.5em}%
    {\thmname{#1}\thmnumber{ #2}}
\theoremstyle{probstyle}
\newtheorem{prob}{Problem}

\newtheoremstyle{prfstyle}%
    {.35\baselineskip}%
    {.35\baselineskip}%
    {\normalfont}%
    {}%
    {\itshape}%
    {.}%
    {.5em}%
    {}

\theoremstyle{prfstyle}
\newtheorem*{__prf}{Proof}
\newenvironment{prf}%
    {\renewcommand{\qedsymbol}{\(\square\)}\pushQED{\qed}\begin{__prf}}%
    {\popQED\end{__prf}}
\newtheorem*{__soln}{Solution}
\newenvironment{soln}%
    {\renewcommand{\qedsymbol}{\(\square\)}\pushQED{\qed}\begin{__soln}}%
    {\popQED\end{__soln}}

\setlist{%
    label         = (\alph*),
    listparindent = \parindent,
    topsep        = \smallskipamount,
    parsep        = \parskip,
    left          = 0pt}

% Math mode symbol overrides
\renewcommand{\phi}{\varphi}
\renewcommand{\epsilon}{\varepsilon}
\renewcommand{\emptyset}{\varnothing}
\renewcommand{\Re}{\operatorname{Re}}
\renewcommand{\Im}{\operatorname{Im}}

% Replace upright Greek letters with italic Greek letters in math mode
\renewcommand{\Gamma}{\varGamma}
\renewcommand{\Delta}{\varDelta}
\renewcommand{\Pi}{\varPi}
\renewcommand{\Theta}{\varTheta}
\renewcommand{\Xi}{\varXi}
\renewcommand{\Lambda}{\varLambda}
\renewcommand{\Sigma}{\varSigma}
\renewcommand{\Upsilon}{\varUpsilon}
\renewcommand{\Phi}{\varPhi}
\renewcommand{\Psi}{\varPsi}
\renewcommand{\Omega}{\varOmega}

% Number sets
\newcommand{\numset}[1]{\vvmathbb{#1}}
\newcommand{\RR}{\numset{R}}
\newcommand{\CC}{\numset{C}}
\newcommand{\QQ}{\numset{Q}}
\newcommand{\NN}{\numset{N}}
\newcommand{\KK}{\numset{K}}
\newcommand{\ZZ}{\numset{Z}}
\newcommand{\Sph}[1]{\numset{S}^{#1}}

\NewDocumentCommand{\Lp}{mm}{L^{#2}(#1)}
\NewDocumentCommand{\LpF}{m}{L^{#1}}
\NewDocumentCommand{\Sob}{mm}{W^{#2}(#1)}
\NewDocumentCommand{\SobF}{m}{W^{#1}}
\NewDocumentCommand{\Mat}{moo}{\operatorname{Mat}(\IfValueTF{#3}{#2 \times #3,}{\IfValueT{#2}{#2,}}#1)}

\NewDocumentCommand{\GL}{mo}{\operatorname{GL}(\IfValueT{#2}{#2,}#1)}
\NewDocumentCommand{\Hom}{mm}{\operatorname{Hom}(#1, #2)}
\NewDocumentCommand{\End}{m}{\operatorname{End}(#1)}
\NewDocumentCommand{\Ext}{mo}{\Lambda\IfValueT{#2}{^{#2}}(#1)}
\NewDocumentCommand{\Sym}{mo}{\Sigma\IfValueT{#2}{^{#2}}(#1)}
\NewDocumentCommand{\Sec}{m}{\Gamma(#1)}

\NewDocumentCommand{\Tan}{mo}{T\IfValueT{#2}{_{#2}}#1}
\NewDocumentCommand{\Cotan}{mo}{T^*\IfValueT{#2}{_{#2}}#1}
\NewDocumentCommand{\SFunc}{m}{C^\infty(#1)}
\NewDocumentCommand{\SMap}{mm}{C^\infty(#1,#2)}
\NewDocumentCommand{\Form}{mo}{\Omega\IfValueT{#2}{^{#2}}(#1)}
\NewDocumentCommand{\HarForm}{mo}{H\IfValueT{#2}{^{#2}}(#1)}
\NewDocumentCommand{\VBForm}{mmo}{\Omega_{#2}\IfValueT{#3}{^{#3}}(#1)}
\NewDocumentCommand{\HarVBForm}{mmo}{H_{#2}\IfValueT{#3}{^{#3}}(#1)}
\NewDocumentCommand{\TrivVB}{mmo}{\underline{#1}_{#2}\IfValueT{#3}{^{#3}}}

\newcommand{\deq}{\vcentcolon=}
\newcommand{\iso}{\cong}
\DeclareMathOperator{\id}{id}
\DeclareMathOperator{\im}{im}

\newcommand{\dsum}{\oplus}
\newcommand{\dprod}{\times}
\newcommand{\tprod}{\otimes}
\newcommand{\bigdprod}{\prod}
\newcommand{\bigdsum}{\bigoplus}
\newcommand{\bigtprod}{\bigotimes}

\NewDocumentCommand{\iprod}{somm}{\IfBooleanTF{#1}%
    {\IfValueTF{#2}%
        {#2\langle #3, #4 #2\rangle}%
        {\left\langle #3, #4 \right\rangle}}%
    {\langle #3, #4 \rangle}}

\newcommand{\con}{\nabla}
\newcommand{\lap}{\upDelta}
\newcommand{\hstar}{\mathord{*}}
\DeclareMathOperator{\dvg}{div}

\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}

\NewDocumentCommand{\evalat}{smm}{\IfBooleanTF{#1}%
    {\mathopen{}%
        \kern-\nulldelimiterspace%
        \left.%
        #1%
        \right\rvert_{#2}%
        \mathclose{}}%
    {#1\rvert_{#2}}}

\NewDocumentCommand{\dd}{m}{d#1}

\NewDocumentCommand{\dv}{smo}{\IfBooleanTF{#1}%
    {\frac{d\IfValueT{#3}{#3}}{d#2}}%
    {d\IfValueT{#3}{#3}/d#2}}

\NewDocumentCommand{\mdv}{smmo}{\IfBooleanTF{#1}%
    {\frac{d^{#3}\IfValueT{#4}{#4}}{d#2^{#3}}}%
    {d^{#3}\IfValueT{#4}{#4}/d#1^{#3}}}

\NewDocumentCommand{\pdv}{smo}{\IfBooleanTF{#1}%
    {\frac{\partial\IfValueT{#3}{#3}}{\partial #2}}%
    {\partial/\partial #2}}

\newcounter{PdvParseExponentArgumentCounter}

\NewDocumentCommand{\@PdvParseExponent}{m}{%
    \ifnum\value{PdvParseExponentArgumentCounter}=0
        \setcounter{PdvParseExponentArgumentCounter}{1}
        \partial #1
    \else
        ^{#1}
    \fi}

\NewDocumentCommand{\@PdvParseVariable}{>{\SplitList{,}}m}{%
    \setcounter{PdvParseExponentArgumentCounter}{0}
    \ProcessList{#1}{\@PdvParseExponent}}

\NewDocumentCommand{\mpdv}{s>{\SplitList{;}}mmo}{\IfBooleanTF{#1}%
    {\frac%
        {\partial^{#3}\IfValueT{#4}{#4}}
        {\ProcessList{#2}{\@PdvParseVariable}}}%
    {\partial^{#3}\IfValueT{#4}{#4}/\ProcessList{#2}{\@PdvParseVariable}}}

\providecommand{\st}{}

\newcommand{\SetSymbol}[1][]{%
    \nonscript\;#1\vert%
    \allowbreak%
    \nonscript\;%
    \mathopen{}}

\DeclarePairedDelimiterX{\set}[1]{\{}{\}}{%
    \renewcommand{\st}{\SetSymbol[\delimsize]}%
    #1}

\DeclarePairedDelimiterX{\grp}[1]{\langle}{\rangle}{%
    \renewcommand{\st}{\SetSymbol[\delimsize]}%
    #1}

\newcommand{\pmat}[1]{\begin{pmatrix}#1\end{pmatrix}}
\newcommand{\bmat}[1]{\begin{bmatrix}#1\end{bmatrix}}
\newcommand{\Bmat}[1]{\begin{Bmatrix}#1\end{Bmatrix}}
\newcommand{\vmat}[1]{\begin{vmatrix}#1\end{vmatrix}}
\newcommand{\Vmat}[1]{\begin{Vmatrix}#1\end{Vmatrix}}
