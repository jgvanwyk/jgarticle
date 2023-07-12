\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jgarticle}[2023/03/22 Jacques' Article Class]

% Load the article class, forwarding all provided options to it
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\newcommand{\emphdef}[1]{{\bfseries\itshape\boldmath#1}}
\newcommand{\comment}[1]{\textcolor{red}{#1}}

% Article class overrides <<<
\renewenvironment{abstract}{%
    \if@twocolumn
        \section*{\abstractname}%
    \else
        \small
        \begin{center}%
            {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
        \fi}
    {\if@twocolumn\else\endquotation\fi\vspace{.5em}}

\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname.\enspace}

\renewcommand{\section}{\@startsection{section}{1}{\z@}%
    {-3ex \@plus -1ex \@minus -.2ex}%
    {1.8ex \@plus .2ex}%
    {\Large\bfseries\boldmath}}

\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
    {-2ex \@plus -1ex \@minus -.2ex}%
    {1.2ex \@plus .2ex}%
    {\large\bfseries\boldmath}}

% Article title
\renewcommand{\@maketitle}{%
    \newpage
    \begin{center}
        \Large
        \bfseries
        \@title
        \normalfont
        \par
        \vskip 1em
        \@author
        \par
        \vskip .5em
        \@date
    \end{center}
    \vskip 0.5em}


% Spacing around display environments
\AtBeginDocument{%
    \abovedisplayskip=1.2ex \@plus .2ex
    \abovedisplayshortskip=1.2ex \@plus .2ex
    \belowdisplayskip=1.2ex \@plus .2ex
    \belowdisplayshortskip=1.2ex \@plus .2ex}
% >>>

% Packages <<<
\RequirePackage{xparse}
\RequirePackage{xcolor}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage[cal=boondox]{mathalpha}
\RequirePackage{enumitem}
\RequirePackage{accents}
\RequirePackage{tikz-cd}
\RequirePackage{hyperref}
% >>>

% Number equations with respect to section
\numberwithin{equation}{section}

% Custom theorem environments <<<
\newtheoremstyle{thmstyle}%
    {1.2ex \@plus .2ex}%
    {1.2ex \@plus .2ex}%
    {\itshape}%
    {0pt}%
    {\bfseries}%
    {.}%
    {0.5em}%
    {\thmname{#1}\thmnumber{ #2}\thmnote{\ (#3)}}
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
    {1.2ex \@plus .2ex}%
    {1.2ex \@plus .2ex}%
    {\normalfont}%
    {0pt}%
    {\bfseries}%
    {.}%
    {0.5em}%
    {\thmname{#1}\thmnumber{ #2}\thmnote{\ (#3).}}
\theoremstyle{defnstyle}
\newtheorem{defn}[thm]{Definition}
\newtheorem*{defn*}{Definition}
\newtheorem{asd}[thm]{Aside}
\newtheorem*{asd*}{Aside}
\newtheorem{rmk}[thm]{Remark}
\newtheorem*{rmk*}{Remark}
\newtheorem*{defns*}{Definitions}
\newtheorem{examp}[thm]{Example}
\newtheorem*{examp*}{Example}
\newtheorem{qstn}[thm]{Question}
\newtheorem{qstn*}{Question}
\newtheorem{exerc}[thm]{Exercise}
\newtheorem*{exerc*}{Exercise}

\newtheoremstyle{probstyle}%
    {1.2ex \@plus .2ex}%
    {1.2ex \@plus .2ex}%
    {\normalfont}%
    {0pt}%
    {\bfseries}%
    {.}%
    {0.5em}%
    {\thmname{#1}\thmnumber{ #2}}
\theoremstyle{probstyle}
\newtheorem{prob}{Problem}

\newtheoremstyle{prfstyle}%
    {1.2ex \@plus .2ex}%
    {1.2ex \@plus .2ex}%
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
% >>>

% Math mode symbol overrides <<<
\renewcommand{\phi}{\varphi}
\renewcommand{\epsilon}{\varepsilon}
\renewcommand{\emptyset}{\varnothing}
\renewcommand{\Re}{\operatorname{Re}}
\renewcommand{\Im}{\operatorname{Im}}
\renewcommand{\vec}[1]{\mathbf{#1}}
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
\renewcommand{\implies}{\Rightarrow}
\renewcommand{\iff}{\Leftrightarrow}
% >>>

% Math commands <<<

% General
\newcommand{\deq}{\vcentcolon=}
\newcommand{\deqby}{=\vcentcolon}
\newcommand{\iso}{\cong}
\newcommand{\comp}{\circ}
\newcommand{\utilde}[1]{\underaccent{\tilde}{#1}}

\DeclareMathOperator{\id}{id}
\DeclareMathOperator{\supp}{supp}
\DeclareMathOperator{\dist}{dist}
\DeclareMathOperator{\im}{im}
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\coker}{coker}

\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}

\newcommand{\omitterm}[1]{\widehat{#1}}

\NewDocumentCommand{\evalat}{smm}{\IfBooleanTF{#1}%
    {\mathopen{}%
        \kern-\nulldelimiterspace%
        \left.%
        #2%
        \right\rvert_{#3}%
        \mathclose{}}%
    {#2\rvert_{#3}}}


% Number sets
\newcommand{\numset}[1]{\vvmathbb{#1}}
\newcommand{\RR}{\numset{R}}
\newcommand{\CC}{\numset{C}}
\newcommand{\QQ}{\numset{Q}}
\newcommand{\NN}{\numset{N}}
\newcommand{\KK}{\numset{K}}
\newcommand{\ZZ}{\numset{Z}}
\newcommand{\Sph}[1]{\numset{S}^{#1}}
\NewDocumentCommand{\Ball}{sm}{\IfBooleanTF{#1}{\bar{\numset{B}}}{\numset{B}}^{#2}}

% Function spaces
\NewDocumentCommand{\CFun}{mm}{C^{#2}(#1)}
\NewDocumentCommand{\CFunF}{m}{C^{#1}}
\NewDocumentCommand{\CMap}{mmm}{C^{#3}(#1,#2)}
\NewDocumentCommand{\CMapF}{m}{C^{#1}}
\NewDocumentCommand{\Lp}{mm}{L^{#2}(#1)}
\NewDocumentCommand{\LpF}{m}{L^{#1}}
\NewDocumentCommand{\Sob}{mm}{L^2_{#2}(#1)}
\NewDocumentCommand{\SobF}{m}{L^2_{#1}}
\NewDocumentCommand{\Sw}{mm}{\mathcal{S}(#1,#2)}
\newcommand{\SwF}{\mathcal{S}}

% Fourier transform
\NewDocumentCommand{\ft}{sm}{\IfBooleanTF{#1}{\widehat{#2}}{\hat{#2}}}
\DeclareMathOperator{\Ft}{\mathcal{F}}
\NewDocumentCommand{\invft}{sm}{\IfBooleanTF{#1}{\widecheck{#2}}{\check{#2}}}

% Vector spaces
\NewDocumentCommand{\Mat}{moo}{\operatorname{Mat}(\IfValueTF{#3}{#2 \times #3,}{\IfValueT{#2}{#2,}}#1)}
\NewDocumentCommand{\GL}{mo}{\operatorname{GL}(\IfValueT{#2}{#2,}#1)}
\NewDocumentCommand{\Hom}{mm}{\operatorname{Hom}(#1, #2)}
\NewDocumentCommand{\End}{m}{\operatorname{End}(#1)}
\NewDocumentCommand{\ExtPwr}{mo}{\Lambda\IfValueT{#2}{^{#2}}(#1)}
\NewDocumentCommand{\SymPwr}{mo}{S\IfValueT{#2}{^{#2}}(#1)}
\newcommand{\sym}{S}
\newcommand{\alt}{\Lambda}
\NewDocumentCommand{\dual}{m}{#1^*}
\NewDocumentCommand{\trsp}{sm}{\IfBooleanTF{#1}{(#2)}{#2}^\transp}
\NewDocumentCommand{\orth}{sm}{\IfValueTF{#1}{(#2)^\perp}{#2^\perp}}
\NewDocumentCommand{\cnj}{sm}{\IfBooleanTF{#1}{\overline{#2}}{\bar{#2}}}
\NewDocumentCommand{\adj}{sm}{\IfBooleanTF{#1}{(#2)}{#2}^*}
\newcommand{\dsum}{\oplus}
\newcommand{\dprod}{\times}
\newcommand{\tprod}{\otimes}
\newcommand{\kprod}{\otimes}
\newcommand{\bigdprod}{\prod}
\newcommand{\bigdsum}{\bigoplus}
\newcommand{\bigtprod}{\bigotimes}
\newcommand{\embeds}{\hookrightarrow}
\NewDocumentCommand{\Quot}{mm}{#1/#2}

\NewDocumentCommand{\iprod}{somm}{\IfBooleanTF{#1}%
    {\IfValueTF{#2}%
        {#2\langle #3, #4 #2\rangle}%
        {\left\langle #3, #4 \right\rangle}}%
    {\langle #3, #4 \rangle}}

% Groups
\NewDocumentCommand{\SymGrp}{m}{S_{#1}}

% Partial differential operators
\NewDocumentCommand{\PDOF}{m}{\operatorname{PDO}_{#1}} 
\NewDocumentCommand{\PDO}{mmm}{\operatorname{PDO}(#1,#2)_{#3}}
\NewDocumentCommand{\PsDOF}{m}{\operatorname{\upPsi DO}_{#1}} 
\NewDocumentCommand{\PsDO}{mmm}{\operatorname{\upPsi DO}(#1,#2)_{#3}}
\NewDocumentCommand{\Symb}{m}{\operatorname{Sym}_{#1}}

% Manifolds
\NewDocumentCommand{\Tan}{mo}{T\IfValueT{#2}{_{#2}}#1}
\NewDocumentCommand{\Cotan}{mo}{T^*\IfValueT{#2}{_{#2}}#1}
\NewDocumentCommand{\SFun}{m}{C^\infty(#1)}
\NewDocumentCommand{\CSSFun}{m}{C_0^\infty(#1)}
\NewDocumentCommand{\SMap}{mm}{C^\infty(#1,#2)}
\NewDocumentCommand{\DiffForm}{mo}{\Omega\IfValueT{#2}{^{#2}}(#1)}
\NewDocumentCommand{\HarForm}{mo}{\mathcal{H}\IfValueT{#2}{^{#2}}(#1)}
\NewDocumentCommand{\VBForm}{mmo}{\Omega_{#2}\IfValueT{#3}{^{#3}}(#1)}
\NewDocumentCommand{\HarVBForm}{mmo}{\mathcal{H}_{#2}\IfValueT{#3}{^{#3}}(#1)}
\NewDocumentCommand{\TrivVB}{mmo}{\underline{#1}_{#2}\IfValueT{#3}{^{#3}}}
\NewDocumentCommand{\Sec}{m}{\Gamma(#1)}
\NewDocumentCommand{\CSec}{mm}{C^{#2}(#1)}
\NewDocumentCommand{\CSecF}{m}{C^{#1}}
\NewDocumentCommand{\volform}{m}{\operatorname{vol}_{#1}}
\NewDocumentCommand{\prinsym}{mo}{\sigma\IfValueT{#2}{_{#2}}(#1)}
\newcommand{\con}{\nabla}
\newcommand{\lap}{\upDelta}
\newcommand{\hstar}{\mathord{*}}
\DeclareMathOperator{\dvg}{div}

% Functional analysis
\NewDocumentCommand{\BLOP}{mm}{\mathcal{B}(#1,#2)}
\NewDocumentCommand{\ann}{sm}{\IfBooleanTF{#1}{(#2)}{#2}^\circ}
\NewDocumentCommand{\preann}{sm}{\IfBooleanTF{#1}{(#2)}{#2}_\circ}
\NewDocumentCommand{\clsr}{sm}{\IfBooleanTF{#1}{\overline{#2}}{\bar{#2}}}
\NewDocumentCommand{\wsclsr}{sm}{\IfBooleanTF{#1}{\overline{#2}}{\bar{#2}}^{w*}}
\NewDocumentCommand{\badj}{m}{#1^\dagger}

% >>>

% Derivatives <<<
\NewDocumentCommand{\dd}{m}{d#1}

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
% >>>

% Set builder <<<
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
% >>>

% Matrices <<<
\newcommand{\pmat}[1]{\begin{pmatrix}#1\end{pmatrix}}
\newcommand{\bmat}[1]{\begin{bmatrix}#1\end{bmatrix}}
\newcommand{\Bmat}[1]{\begin{Bmatrix}#1\end{Bmatrix}}
\newcommand{\vmat}[1]{\begin{vmatrix}#1\end{vmatrix}}
\newcommand{\Vmat}[1]{\begin{Vmatrix}#1\end{Vmatrix}}
% >>>

% vim:fdm=marker:fmr=<<<,>>>:
