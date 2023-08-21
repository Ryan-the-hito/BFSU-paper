% ---------------------------------
% 作者: Ryan-the-hito（原作者TeX白兔）
% 邮箱: sweeter.02.implant@icloud.com
% 时间: 2023-08-21
% 描述: BFSU-master-thesis
% ---------------------------------

\NeedsTeXFormat{LaTeX2e}[1995/12/01] \ProvidesClass{BFSU-master-thesis}[24/02/2022 BFSU-master-thesis thesis class]

% \PassOptionsToClass{23pt}{ctexbook}
\ProcessOptions
\LoadClass[a4paper,openany,zihao={-4}]{ctexbook}

\RequirePackage[labelsep=quad]{caption}
\RequirePackage[sort&compress,numbers,super]{natbib}  % 参考文献 数字编号，上标
\RequirePackage[top=25mm,left=30mm,right=25mm,bottom=25mm]{geometry}
\RequirePackage[explicit,clearempty,newparttoc]{titlesec}
\RequirePackage[bodytextleadingratio=1.72]{zhlineskip}

\RequirePackage{
amsmath   , amssymb  , amsthm   , array    , bicaption , booktabs ,
enumitem  , enumitem , expl3    , fancyhdr , graphicx  , ifthen   ,
latexsym  , lipsum   , multirow , mwe      , pifont   ,
subfigure , xeCJK    , zhlipsum , zhnumber , ulem
}
\let\c@lofdepth\relax
\let\c@lotdepth\relax

\RequirePackage{tocloft}

\captionsetup[figure][bi-second]{name=Figure}
\captionsetup[table][bi-second]{name=Table}
% \RequirePackage{algorithm}
% \RequirePackage{algorithmic}

\usepackage{fontspec}
%\newCJKfontfamily\min{UnGungseo.ttf}
\newCJKfontfamily\fs{FangSong_GB2312}
\newCJKfontfamily\song{SimSong}
\newCJKfontfamily\hei{STHeiti}
\usepackage{array}
\usepackage{booktabs}


\ExplSyntaxOn


\tl_const:Nn \c__ujs_name_simp_tl { 北京外国语大学          }
\tl_const:Nn \c__ujs_name_trad_tl { 北京外國語大學        }
\tl_const:Nn \c__ujs_name_en_tl   { Beijing Foreign Studies University }

\tl_const:Nn \c__ujs_decl_text_tl
  {
    本人郑重声明：所呈交的学位论文，是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不含任何其他个人或集体已经发表或撰写过的作品或成果，也不包含为获得北京外国语大学或其他教育机构的学位或证书撰写的或使用过的材料。对本文的研究做出重要贡献的个人和集体，均已在论文中以明确方式标明。本声明的法律结果由本人承担。
  }
\tl_const:Nn \c__ujs_copyright_text_tl
  {
    本人完全了解北京外国语大学关于收集、保存、使用学位论文的规定，即：\par
按照学校要求提交学位论文的印刷本和电子版本；\par
学校有权保存学位论文的印刷本和电子版，并提供目录检索与阅览服务；\par
学校可以采用影印、缩印、数字化或其它复制手段保存论文;\par
学校可以公开论文的全部或部分内容。
  }

\keys_define:nn { ujskeys } {
  title       . tl_set:N  = \l_ujskeys_title_tl,
  title       . initial:n = title,
  titlerownum . tl_set:N  = \l_ujskeys_entitlerownum_tl,
  titlerownum . initial:n = 1,
  category    . tl_set:N  = \l_ujskeys_category_tl,
  category    . initial:n = 学术型,
  runtitle    . tl_set:N  = \l_ujskeys_runtitle_tl,
  runtitle    . initial:n = \l_ujskeys_title_tl,
  author      . tl_set:N  = \l_ujskeys_author_tl,
  author      . initial:n = author,
  major       . tl_set:N  = \l_ujskeys_major_tl,
  major       . initial:n = major,
  advisor     . tl_set:N  = \l_ujskeys_advisor_tl,
  advisor     . initial:n = advisor,
  jobtitle    . tl_set:N  = \l_ujskeys_jobtitle_tl,
  jobtitle    . initial:n = jobtitle,
  ReplyDate   . tl_set:N  = \l_ujskeys_ReplyDate_tl,
  ReplyDate   . initial:n = ReplyDate,
  SubmitDate  . tl_set:N  = \l_ujskeys_SubmitDate_tl,
  SubmitDate  . initial:n = SubmitDate,
  GrantDate   . tl_set:N  = \l_ujskeys_GrantDate_tl,
  GrantDate   . initial:n = GrantDate,
  chairman    . tl_set:N  = \l_ujskeys_chairman_tl,
  chairman    . initial:n = chairman,
  referee     . tl_set:N  = \l_ujskeys_referee_tl,
  referee     . initial:n = referee,
  date        . tl_set:N  = \l_ujskeys_date_tl,
  date        . initial:n = date,
  CID         . tl_set:N  = \l_ujskeys_CID_tl,
  CID         . initial:n = ,
  SCF         . tl_set:N  = \l_ujskeys_SCF_tl,
  SCF         . initial:n = ,
  UDC         . tl_set:N  = \l_ujskeys_UDC_tl,
  UDC         . initial:n = ,
  number      . tl_set:N  = \l_ujskeys_number_tl,
  number      . initial:n = ,
}

\keys_define:nn { ujsenkeys } {
  title    . tl_set:N  = \l_ujskeys_entitle_tl,
  title    . initial:n = entitle,
  author   . tl_set:N  = \l_ujskeys_enauthor_tl,
  author   . initial:n = enauthor,
  major    . tl_set:N  = \l_ujskeys_enmajor_tl,
  major    . initial:n = enmajor,
  advisor  . tl_set:N  = \l_ujskeys_enadvisor_tl,
  advisor  . initial:n = enadvisor,
  jobtitle . tl_set:N  = \l_ujskeys_enjobtitle_tl,
  jobtitle . initial:n = jobtitle,
  date     . tl_set:N  = \l_ujskeys_endate_tl,
  date     . initial:n = endate,
}
\NewDocumentCommand\UJSsetup{ +m }{
\keys_set:nn{ujskeys}{#1}
}

\NewDocumentCommand\UJSensetup{ +m }{
\keys_set:nn{ujsenkeys}{#1}
}


\NewDocumentCommand\@blankline{O{7.5em}m}{\uline{\makebox[#1]{#2}}}
% for check symbol
\def\cmark{\ding{51}}
\def\xmark{\ding{55}}
\def\done{\rlap{$\square$}{\raisebox{2pt}{\large\hspace{1pt}\cmark}}\hspace{-1pt}}
\def\wontfix{\rlap{$\square$}{\large\hspace{1pt}\xmark}}

\graphicspath{{figures/}} % 设置图片引用路径
\allowdisplaybreaks       % 公式可断页显示
% \newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}


\usepackage{zhnumber}
\setcounter{secnumdepth}{4}
%\renewcommand\thesection{\zhnum{section}、\hspace{-1em}}
%\renewcommand\thesubsection {（\zhnum{subsection}）\hspace{-1em}}
%\renewcommand{\thesubsubsection}{\hspace{0.5em}\arabic{subsubsection}.\hspace{-0.5em}}

\ctexset{
  chapter = {
    pagestyle  = main,
    number     = 第\zhnum{chapter}章,
    name       = {},
    format     = \centering\bfseries\zihao{3},
    fixskip    = true,
    beforeskip = 2.3em,
    afterskip  = 1.6em,
  },
  section = {
    number       = 第\zhnum{section}节,
    format       = \centering\bfseries\zihao{4},
    aftername    = \hspace*{10pt},
    beforeskip   = .5em plus 1ex minus .2ex,
    afterskip    = .5em plus .2ex
  },
  subsection = {
    number       = \zhnum{subsection}、\hspace{-1em},
    format       = \raggedright\bfseries\zihao{-4},
    %beforename = {\hspace*{1em}},
    beforeskip   = .5em plus 1ex minus .2ex,
    afterskip    = .5em  plus .2ex
  },
  subsubsection = {
    number       = （\zhnum{subsubsection}）\hspace{-1em},
    format       = \raggedright\bfseries\zihao{-4},
    % beforename = {\hspace*{1em}},
    beforeskip   = .5em plus 1ex minus .2ex,
    afterskip    = .5em  plus .2ex
  },
  paragraph = {
    number       = \hspace{0.5em}\arabic{paragraph}.\hspace{-0.5em},
    format       = \raggedright\bfseries\zihao{-4},
    % beforename = {\hspace*{1em}},
    beforeskip   = .5em plus 1ex minus .2ex,
    afterskip    = .5em  plus .2ex
  },
}


\fancypagestyle{main}{
  \fancyhf{}
  \fancyfoot[RO,LE]{\thepage}
}

\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[RO,LE]{\thepage}
}
\renewcommand{\headrulewidth}{0pt}

\RenewDocumentCommand\maketitle{}{
\begingroup
  \thispagestyle{empty}
  \pdfbookmark[0]{封面}{titlepage}
  \parindent 0pt
  \vspace*{0cm}
  	\includegraphics[width=.2\linewidth]{logo/logo1.pdf} \par
  \begingroup
  \centering
  	\includegraphics[width=.8\linewidth]{logo/logo2.pdf} \par
    \vspace*{1cm}
    \resizebox{.4\linewidth}{!}{\textbf{硕\kern 0.2em士\kern 0.2em学\kern 0.2em位\kern 0.2em论\kern 0.2em文}} \par
    \bigskip
    \vspace*{1.6cm}
  \zihao{-2}
  \renewcommand{\arraystretch}{1.1}\fs
  % \hbox_set:Nn {\l__title_box} {\l_ujskeys_title_tl}
  \begin{tabular}{lp{.65\linewidth}<{\centering}}
    \textbf{\song{中文题目\quad}} & \textbf{\hei{\l_ujskeys_runtitle_tl}} \\[-7pt]
    \cline{2-2}
    \textbf{\song{外文题目\quad}} & \multirow{\l_ujskeys_entitlerownum_tl}{\linewidth}{\centering \textbf{\song{\l_ujskeys_title_tl}} }
    \int_compare:nNnTF \l_ujskeys_entitlerownum_tl = 1 {
     \\[-7pt] \cline{2-2}
    }{
    \\[-4pt] \cline{2-2} \\[-5pt] \cline{2-2}
    }
   \specialrule{0em}{1.6cm}{1pt}
  
    姓\kern 2em名\quad & \l_ujskeys_author_tl \\[-7pt]
    \cline{2-2}
    \specialrule{0em}{0.2cm}{1pt}
    学\kern 2em号\quad & 学号 \\[-7pt]
    \cline{2-2} 
    \specialrule{0em}{0.2cm}{1pt}
    导\kern 2em师\quad &  \l_ujskeys_advisor_tl
    \tl_if_empty:NF \l_ujskeys_jobtitle_tl {\ \ \ \l_ujskeys_jobtitle_tl}
\\[-7pt]
    \cline{2-2}
    \specialrule{0em}{0.2cm}{1pt}
    研究方向\quad & 研究方向  \\[-7pt]
    \cline{2-2}
    \specialrule{0em}{0.2cm}{1pt}
    专\kern 2em业\quad & \l_ujskeys_major_tl  \\[-7pt]
    \cline{2-2}
    \specialrule{0em}{0.2cm}{1pt}
    系\kern 2em别\quad & \l_ujskeys_chairman_tl \\[-7pt]
    \cline{2-2}
     \specialrule{0em}{0.6cm}{1pt}
    &  \zihao{3}\l_ujskeys_ReplyDate_tl \\[8pt]
  \end{tabular}
  \endgroup
\endgroup
\clearpage
}

\ProvideDocumentCommand\makeauthorization{}{
\begingroup
\thispagestyle{empty}
  \pdfbookmark[0]{独创性和授权书}{authorization}
  \parindent 2\ccwd
  \pagestyle{empty}
  \baselineskip 20pt
  % declare region
    \par \vspace*{0cm}
    \begin{center}
    \zihao{3}{\bfseries \hei 北京外国语大学学位论文原创性声明和使用授权说明} \\
    \vspace*{1cm}
    \zihao{3}{\bfseries \underline{\hei 学位论文原创性声明}}
    \end{center}
    \par
    \c__ujs_decl_text_tl 
    \par \vspace*{\baselineskip}
     \vspace*{1cm}
    %\hfill
    %\begin{minipage}{.5\linewidth}
    \zihao{-4}论文作者签名： \includegraphics[height=1cm]{figures/authorsign} \hspace{7\ccwd}日期：\l_ujskeys_date_tl
    %\par \hspace{7\ccwd} 
    %\end{minipage}
    \par \vspace*{1.5cm}
    \begin{center}
  % end region
  %\newpage
  \thispagestyle{empty}
  % copyright region
  \zihao{3}{\bfseries \underline{\hei 学位论文使用授权说明}}
  \end{center}
  \par \c__ujs_copyright_text_tl
  \par \vspace*{\baselineskip}
  %本学位论文属于\l_ujskeys_SCF_tl \done 。
  %\par \vspace*{2\baselineskip}
  \vspace*{1cm}
  \begin{minipage}{.46\linewidth}
    论文作者签名：\includegraphics[height=1cm]{figures/authorsign}
    \par 日期：\l_ujskeys_date_tl
  \end{minipage}\hfill
  \begin{minipage}{.4\linewidth}
    指导教师签名：\includegraphics[height=1cm]{figures/teachersign}
    \par 日期：\l_ujskeys_date_tl
  \end{minipage}
% end region
\endgroup
\clearpage
}

\ProvideDocumentCommand\makecninnertitle{}{
\begingroup
\thispagestyle{empty}
  \pdfbookmark[0]{中文论文信息}{cninnertitle}
  \parindent 0pt
  % info region
  \vspace*{1.2cm}
  % title region
  \begingroup
    \centering \zihao{2}
    {\ziju{.3} 硕士学位论文} \par
    \vspace*{1.3cm}
    \parbox{.86\linewidth}{\centering\bfseries \l_ujskeys_runtitle_tl} \par
    \vspace*{1.3cm}
    {\bfseries \l_ujskeys_author_tl } \par
    \vspace*{2.3cm}
  \endgroup
  \par
  % date region
    \zihao{3}
    \makebox[6\ccwd][s]{指导老师} \uline{\hfill \l_ujskeys_advisor_tl
    \tl_if_empty:NF \l_ujskeys_jobtitle_tl {\ \ \ \ \l_ujskeys_jobtitle_tl}
    \hfill } \par
    申请学位级别 \@blankline[.28\linewidth]{硕士} 专业名称 \uline{\hfill \l_ujskeys_major_tl\hfill } \par
    论文提交日期 \@blankline[.28\linewidth]{\l_ujskeys_SubmitDate_tl } 论文答辩日期 \uline{\hfill  \l_ujskeys_ReplyDate_tl  \hfill } \par
    学位授予单位和日期 \uline{\hfill  江苏大学\l_ujskeys_GrantDate_tl \hfill } \par
  % referee region
  \vfill
    \hfill{\bfseries 答辩委员会主席} \@blankline{\l_ujskeys_chairman_tl } \par
    \hfill{\bfseries 评阅人} \@blankline{\l_ujskeys_referee_tl } \par
    \vspace*{2.3cm}
    \begin{center}
    {\bfseries \l_ujskeys_ReplyDate_tl }
    \end{center}
\endgroup
  \clearpage
}


\ProvideDocumentCommand\makeeninnertitle{}{
\begingroup
  \pdfbookmark[0]{英文论文信息}{eninnertitle}
  \thispagestyle{empty}
  {\zihao{4}
  Classified~ Index:~ \l_ujskeys_CID_tl \par
  UDC:~ \l_ujskeys_UDC_tl }\par
  \vspace*{1.8cm}
  \begingroup
  \centering
    {\bfseries \zihao{2}Master~ Dissertation} \par
    \bigskip
    \begingroup
    \renewcommand{\baselinestretch}{1.2}\selectfont
    \bfseries \zihao{-2}\l_ujskeys_entitle_tl \par
    \endgroup
    \vspace*{2.2cm} \par
    {\zihao{2} By \par
    \bigskip
    {\bfseries \l_ujskeys_enauthor_tl }} \par
    \vspace*{1.5cm} \par
    \large
    \begin{tabular}{rl}
    Major: & \l_ujskeys_enmajor_tl \\
    Supervisor: & \tl_if_empty:NF \l_ujskeys_enjobtitle_tl {\l_ujskeys_enjobtitle_tl\ } \l_ujskeys_enadvisor_tl\\
    \end{tabular} \par
    \vfill
    {\bfseries Jiangsu University}\par
    {\bfseries \l_ujskeys_endate_tl}
    \vspace*{1cm}\par
  \endgroup
\endgroup
\clearpage
}


\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}
  \normalfont\normalsize
  \parindent 2\ccwd
  \pagestyle{main}
}


\NewDocumentEnvironment{cnabstract}{}{
\setcounter{page}{1}
  \chapter*{摘\quad 要}
  \addcontentsline{toc}{chapter}{摘\quad 要}
  \markboth{摘要}{}
}{}

\NewDocumentEnvironment{enabstract}{}{
  \chapter*{ABSTRACT}
  \addcontentsline{toc}{chapter}{ABSTRACT}
  \markboth{ABSTRACT}{}
}{}

\ExplSyntaxOff


\newcommand{\cnkeywords}[1]{
  \bigskip
  \hangafter 1
  \hangindent 4\ccwd
  \noindent
  {\bfseries 关键词}：#1
}

\newcommand{\enkeywords}[1]{
\bigskip
\hangafter 1
\hangindent 6.7em
\noindent
{\bfseries Keywords}: #1}

\@namedef{cftchapdotsep}{\cftdotsep}
\renewcommand{\@dotsep}{3}
\def\@cftmaketoctitle{\chapter*{目\quad 录}}
\def\@cftmakeloftitle{\chapter*{插\quad 图}}

\let\cleardoublepage\clearpage


%-------定理定义环境
\newtheorem{example}{例}
\newtheorem{theorem}{定理}[section]
\newtheorem{definition}{定义}
\newtheorem{axiom}{公理}
\newtheorem{property}{性质}
\newtheorem{proposition}{命题}
\newtheorem{lemma}{引理}
\newtheorem{corollary}{推论}
\newtheorem{remark}{注解}
\newtheorem{condition}{条件}
\newtheorem{conclusion}{结论}
\newtheorem{assumption}{假设}

% Link
\RequirePackage{hyperref}
\hypersetup{
  hidelinks,
  bookmarks          = true  ,
  colorlinks         = false ,
  bookmarksnumbered  = true  ,
  bookmarksopen      = true  ,
  bookmarksopenlevel = 1     ,
}

\endinput