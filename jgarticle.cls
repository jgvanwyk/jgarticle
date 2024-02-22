\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jgarticle}[Jacques' Article Class]

\input{jgbase}

% Article class overrides

\newcounter{currentsection}
\let\builtin@startsection\@startsection
\def\@startsection#1#2#3#4#5#6{%
    \setcounter{currentsection}{#2}%
    \builtin@startsection{#1}{#2}{#3}{#4}{#5}{#6}}

\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname\enspace}

\let\builtin@sect\@sect
\def\@sect#1#2#3#4#5#6[#7]#8{\builtin@sect{#1}{#2}{#3}{#4}{#5}{#6}[#7]{#8\ifnum\c@currentsection>1.\fi}}
\let\builtin@ssect\@ssect
\def\@ssect#1#2#3#4#5{\builtin@ssect{#1}{#2}{#3}{#4}{#5\ifnum\c@currentsection>1.\fi}}

\numberwithin{equation}{section}

\renewcommand\section{\@startsection{section}{1}{\z@}%
    {.7\baselineskip\@plus\baselineskip}%
    {.5\baselineskip}%
    {\normalfont\centering\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
    {.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}%
    {-.5em}%
    {\normalfont\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
    {.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}%
    {-.5em}%
    {\normalfont\normalsize\bfseries}}

% Custom theorem environments <<<
\crefname{equation}{}{}
\crefname{item}{}{}
\crefname{section}{Section}{Sections}
\crefname{subsection}{Section}{Sections}

\newtheoremstyle{theorem}%
    {.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}%
    {.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}%
    {\itshape}%
    {0pt}%
    {\bfseries}%
    {.}%
    {0.5em}%
    {\thmnumber{#2\enspace}\thmname{#1}\thmnote{\ (#3)}}

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

\newtheoremstyle{definition}%
    {.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}%
    {.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}%
    {\normalfont}%
    {0pt}%
    {\bfseries}%
    {.}%
    {0.5em}%
    {\thmnumber{#2\enspace}\thmname{#1}\thmnote{\ (#3)}}

\theoremstyle{definition}

\newtheorem{definition}[theorem]{Definition}
\newtheorem*{definition*}{Definition}
\crefname{definition}{}{}

\newtheorem{remark}[theorem]{Remark}
\newtheorem*{remark*}{Remark}
\crefname{remark}{}{}

\newtheorem{example}[theorem]{Example}
\newtheorem*{example*}{Example}
\crefname{example}{}{}
