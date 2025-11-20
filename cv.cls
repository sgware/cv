%------------------------------------------------------------------------------
% Simple CV Template by Stephen G. Ware, v 1.0, November 2025, MIT License
%------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}

% Extend 'article' class.
\LoadClass[10pt,letterpaper]{article}

%------------------------------------------------------------------------------
% Formatting
%------------------------------------------------------------------------------

% 1 inch margins
\usepackage[margin=1in]{geometry}

% Main Font: Libertine
\usepackage{libertine}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[noconfigs,english]{babel}

% Typewriter Font: Computer Modern Typewriter
\renewcommand*\ttdefault{cmvtt}

% Reduce space around items in itemize environment
\usepackage{enumitem}
\setlist[itemize]{nolistsep,noitemsep}

% Reduce hyphenation
\hyphenpenalty=5000

%------------------------------------------------------------------------------
% Other Classes
%------------------------------------------------------------------------------

% Allow line breaks in long URLs
\usepackage[hyphens]{url}

% Allows full citations for publications
\usepackage[backend=bibtex,style=ieee]{biblatex}
\usepackage{csquotes}

% Fancy tables
\usepackage{tabularx}

% Allows reverse enumeration of numbered lists
\usepackage{etaremune}

%------------------------------------------------------------------------------
% Custom Title
%------------------------------------------------------------------------------

% Reanme 'title' command to 'name'
\let\name\title

% Add command for 'website'
\newcommand{\@website}{}
\newcommand{\website}[1]{\renewcommand{\@website}{#1}}

% Add command for 'email'
\newcommand{\@email}{}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}

% Custom title block
\makeatletter
\def\@maketitle{%
	\begin{center}%
		{\Huge \@title \par}%
		\bigskip
		\begin{tabular}{ccc}
			\@website & \@email & Last updated \today
		\end{tabular}
	\end{center}
}
\makeatother

%------------------------------------------------------------------------------
% Custom Commands for CV Elements
%------------------------------------------------------------------------------

% Up to 3 rows of text on the left, date on the right
\newcommand{\dated}[4]{%
	\if\relax\detokenize{#2}\relax%
		\noindent\begin{tabularx}{\textwidth}{Xr}
			#1 & #4
		\end{tabularx}
	\else%
		\if\relax\detokenize{#3}\relax%
			\noindent\begin{tabularx}{\textwidth}{Xr}
				#1 & #4 \\
				#2 &
			\end{tabularx}
		\else%
			\noindent\begin{tabularx}{\textwidth}{Xr}
				#1 & #4 \\
				#2 & \\
				#3 &
			\end{tabularx}
		\fi%
	\fi%
	\newline
	\medskip
	\newline
}

% Employment
\newcommand{\employment}[3]{\dated{#1}{#2}{}{#3}}

% Education
\newcommand{\education}[4]{\dated{#1, #2}{#3}{}{#4}}

% Award
\newcommand{\award}[3]{\dated{#1}{#2}{}{#3}}

% Grant
\newcommand{\grant}[6]{%
	\if\relax\detokenize{#5}\relax%
		\dated{{\em #1}, #2}{#3 / #4 total}{}{#6}
	\else%
		\dated{{\em #1}, #2}{#3 / #4 total / #5 my share}{}{#6}
	\fi%
}
%\newcommand{\grant}[5]{\dated{{\em #1}, #2}{#3 / #4}{}{#5}}

% Invited Talk
\newcommand{\invited}[3]{\dated{{\em #1}}{#2}{}{#3}}

% Panel
\newcommand{\panel}[4]{\dated{{\em #1}, #2}{#3}{}{#4}}

% Organizer
\newcommand{\organizer}[4]{\dated{#1}{#2}{#3}{#4}}

% Service
\newcommand{\service}[4]{\dated{#1, #2}{#3}{}{#4}}

% Thesis Student
\newcommand{\thesisstudent}[4]{%
	\if\relax\detokenize{#3}\relax%
		#1, #2 (degree in progress) \hfill #4
	\else%
		#1, #2 \hfill #4\\Thesis: {\em #3}
	\fi%
}

% Project Student
\newcommand{\projectstudent}[4]{%
	\if\relax\detokenize{#3}\relax%
		#1, #2 (degree in progress) \hfill #4
	\else%
		#1, #2 \hfill #4\\Project: {\em #3}
	\fi%
}

% Student
\newcommand{\student}[3]{#1, #2 \hfill #3}

% Publicity
\newcommand{\publicity}[4]{\dated{{\em #1}}{#2}{{\small \texttt{#3}}}{#4}}

% Other
\newcommand{\other}[2]{\dated{#1}{}{}{#2}}
\newcommand{\detail}[3]{\dated{#1}{#2}{}{#3}}