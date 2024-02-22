\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jgassignment}[Jacques' Assignment Class]

\input{jgbase}

\newcounter{problem}
\numberwithin{equation}{problem}

\newcommand{\problem}{%
    \stepcounter{problem}%
    \ifnum\c@problem>\@ne\clearpage\fi%
    \noindent\textbf{\large Problem \arabic{problem}.}\par\medskip\unskip\noindent\@ifnextchar\par{\@gobble}{}}

\crefname{equation}{}{}
\crefname{problem}{Problem}{Problems}

\newtheoremstyle{theorem}%
    {.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}%
    {.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}%
    {\itshape}%
    {0pt}%
    {\bfseries}%
    {.}%
    {0.5em}%
    {\thmname{#1}\thmnumber{\ #2}\thmnote{\ (#3)}}

\theoremstyle{theorem}

\newtheorem{theorem}{Theorem}[section]
\newtheorem*{theorem*}{Theorem}
\crefname{theorem}{}{}

\newtheorem{lemma}[theorem]{Lemma}
\newtheorem*{lemma*}{Lemma}

\newtheorem{proposition}[theorem]{Proposition}
\newtheorem*{proposition*}{Proposition}
\crefname{proposition}{}{}

\newtheorem{corollary}[theorem]{Corollary}
\newtheorem*{corollary*}{Corollary}
\crefname{corollary}{}{}

