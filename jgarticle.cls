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
\renewcommand\@seccntformat[1]{\csname the#1\endcsname\enspace}

\renewcommand{\section}{\@startsection{section}{1}{\z@}%
    {-3.25ex\@plus -1ex \@minus -.2ex}%
    {1.5ex \@plus .2ex}%
    {\normalfont\large\bfseries}}

\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
    {-3.25ex\@plus -1ex \@minus -.2ex}%
    {1.5ex \@plus .2ex}%
    {\normalfont\normalsize\bfseries}}

% Article title
\renewcommand\@maketitle{%
    \newpage
    \null
    \vskip 2em%
    \begin{center}%
        \let\footnote\thanks
        {\Large\bfseries \@title \par}%
        \vskip 1.5em%
        {\large
            \lineskip .5em%
            \begin{tabular}[t]{c}%
                \@author
            \end{tabular}\par}%
            \vskip 1em%
        {\large \@date}%
    \end{center}%
    \par
    \vskip 1em}

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
\newcommand{\RR}{\numset{R}} % The real line ℝ
\newcommand{\CC}{\numset{C}} % The complex plane ℂ
\newcommand{\QQ}{\numset{Q}} % The rational numbers ℚ
\newcommand{\NN}{\numset{N}} % The natural numbers ℕ
\newcommand{\KK}{\numset{K}} % The field ℝ or ℂ
\newcommand{\ZZ}{\numset{Z}} % The integers ℤ

% The n-sphere
% \Sph{n} -> 𝕊ⁿ
\newcommand{\Sph}[1]{\numset{S}^{#1}}

% The m×n matrices over a ring R
% \Mat          -> Mat
% \Mat[R]       -> Mat(R)
% \Mat[R][m]    -> Matₘ(R)
% \Mat[R][m][n] -> Matₘₓₙ(R)
\NewDocumentCommand{\Mat}{ooo}{\IfValueTF{#1}%
    {\operatorname{Mat}\IfValueTF{#3}%
            {_{#2 \times #3}}%
            {\IfValueT{#2}{_{#2}}}%
        (#1)}%
    {\mathrm{Mat}}}

% The general linear group
% \GL       -> GL
% \GL[V]    -> GL(V)
% \GL[F][n] -> GLₙ(F)
\NewDocumentCommand{\GL}{oo}{\IfValueTF{#1}%
    {\operatorname{GL}\IfValueT{#2}{_{#2}}(#1)}%
    {\mathrm{GL}}}

% The space of morphisms from one space to another
% \Hom       -> Hom
% \Hom[E]    -> Hom(E)
% \Hom[E][F] -> Hom(A, B)
\NewDocumentCommand{\Hom}{oo}{\IfValueTF{#2}%
    {\operatorname{Hom}(#1,#2)}%
    {\IfValueTF{#1}%
        {\operatorname{Hom}(#1)}%
        {\mathrm{Hom}}}}

% The space of endomorphisms from a space to itself
% \End    -> Hom
% \End[E] -> End(E)
\NewDocumentCommand{\End}{o}{\IfValueTF{#1}%
    {\operatorname{End}(#1)}%
    {\mathrm{End}}}

% The exterior power of a vector space
% \Ext       -> Λ
% \Ext[V]    -> Λ(V)
% \Ext[V][n] -> Λⁿ(V)
\NewDocumentCommand{\Ext}{oo}{\upLambda\IfValueT{#2}{^{#2}}\IfValueT{#1}{(#1)}}

% The symmetric power of a vector space
% \Sym       -> Σ
% \Sym[V]    -> Σ(V)
% \Sym[V][n] -> Σⁿ(V)
\NewDocumentCommand{\Sym}{oo}{\upSigma\IfValueT{#2}{^{#2}}\IfValueT{#1}{(#1)}}

% The space of sections of a bundle
% \Sec       -> Γ
% \Sec[E]    -> Γ(E)
% \Sec[E][n] -> Γⁿ(E)
\NewDocumentCommand{\Sec}{oo}{\upGamma\IfValueT{#2}{^{#2}}\IfValueT{#1}{(#1)}}

% The space of differential forms of a manifold
% \Form       -> Ω
% \Form[E]    -> Ω(E)
% \Form[E][n] -> Ωⁿ(E)
\NewDocumentCommand{\Form}{oo}{\upOmega\IfValueT{#2}{^{#2}}\IfValueT{#1}{(#1)}}

% The space of smooth functions from a space to ℝ
% \SFn       -> C∞
% \SFn[U]    -> C∞(U)
% \SFn[U][n] -> Cⁿ(U)
\NewDocumentCommand{\SFn}{oo}{\IfValueTF{#1}%
    {\operatorname{C}^{\IfValueTF{#2}{#2}{\infty}}}%
    {\mathrm{C}^\infty}}

% The space of smooth maps from once space to another
% \SMap -> C∞
% \SMap ->
\NewDocumentCommand{\SMap}{ooo}{\IfValueTF{#2}%
    {\mathrm{C}^{\IfValueTF{#3}{#3}{\infty}}(#1,#2)}%
    {\IfValueTF{#1}%
        {\operatorname{C}^\infty(#1)}
        {\mathrm{C}}}}

\newcommand{\deq}{\vcentcolon=} % Define
\newcommand{\iso}{\cong} % Isomorphism
\newcommand{\con}{\nabla} % A connection or covariant derivative
\newcommand{\dsum}{\oplus} % Direct sum
\newcommand{\dprod}{\times} % Direct product
\newcommand{\tprod}{\otimes} % Tensor products

\DeclarePairedDelimiter{\abs}{\lvert}{\rvert} % Absolute value
\DeclarePairedDelimiter{\norm}{\lVert}{\rVert} % Norm
\DeclarePairedDelimiter{\ip}{\langle}{\rangle} % Inner product

\DeclareMathOperator{\id}{id} % Identity map
\DeclareMathOperator{\dvg}{div} % Divergence
\DeclareMathOperator{\im}{im} % Image of a map

% Coordinate vector field
% \cvf{x} -> ∂/∂x
% Uses \frac in display math and a / in inline math, superscripts and subscripts.
\DeclareDocumentCommand{\cvf}{g}{\mathchoice%
    {\frac{\partial}{\partial #1}}
    {\partial/\partial #1}
    {\partial/\partial #1}
    {\partial/\partial #1}}

% Set builder
% \set{x \st P(x)} -> {x | P(x)}
% Invoking this with a * as in \set* will grow the {|} to fit the contents like  a \left\right pair.
% Invoking this with a size command as an argument (e.g. \set[\big]) will set the {|} to that size.
\providecommand{\st}{}
\newcommand{\SetSymbol}[1][]{%
    \nonscript\;#1\vert
    \allowbreak
    \nonscript\;
    \mathopen{}}
\DeclarePairedDelimiterX{\set}[1]{\{}{\}}{%
    \renewcommand{\st}{\SetSymbol[\delimsize]}
    #1}

% Group generated by elements with relations
% \grp{x \st P(x)} -> ⟨x | P(x)⟩
% The same  comments as for \set apply here.
\DeclarePairedDelimiterX{\grp}[1]{\langle}{\rangle}{%
    \renewcommand{\st}{\SetSymbol[\delimsize]}
    #1}

% Short hands for matrix
\newcommand{\pmat}[1]{\begin{pmatrix}#1\end{pmatrix}}
\newcommand{\bmat}[1]{\begin{bmatrix}#1\end{bmatrix}}
\newcommand{\Bmat}[1]{\begin{Bmatrix}#1\end{Bmatrix}}
\newcommand{\vmat}[1]{\begin{vmatrix}#1\end{vmatrix}}
\newcommand{\Vmat}[1]{\begin{Vmatrix}#1\end{Vmatrix}}
