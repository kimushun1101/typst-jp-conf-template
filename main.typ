// MIT No Attribution
// Copyright 2024, 2025 Shunsuke Kimura

#import "jaconf/lib.typ": jaconf as temp, definition, lemma, theorem, corollary, proof, appendix
#let conference-name = "制御部門マルチシンポジウム"

// デフォルト値でよい引数は省略可能
#show: temp.with(
  // 基本 Basic
  title: [Typst を使った国内学会論文の書き方 \ - 国内学会予稿集に似せたフォーマットの作成 - ],
  title-en: [How to Write a Conference Paper in Japanese],
  authors: [◯ 著者姓1 著者名1、著者姓2 著者名2(○○○大学)、著者姓3 著者名3 (□□□株式会社)],
  authors-en: [\*A. First, B. Second (○○○ Univ.), and C. Third (□□□ Corp.)],
  abstract: [#lorem(80)],
  keywords: ([Typst], [conference paper writing], [manuscript format]),
  // フォント名 Font family
  font-heading: "Noto Sans CJK JP",  // サンセリフ体、ゴシック体などの指定を推奨
  font-main: "Noto Serif CJK JP",  // セリフ体、明朝体などの指定を推奨
  font-latin: "New Computer Modern",
  font-math: "New Computer Modern Math",
  // 外観 Appearance
  paper-margin: (top: 20mm, bottom: 27mm, left: 20mm, right: 20mm),
  paper-columns: 2,  // 1: single column, 2: double column
  page-number: none,  // e.g. "1/1"
  column-gutter: 4%+0pt,
  spacing-heading: 1.2em,
  bibliography-style: "sice.csl",  // "sice.csl", "rsj.csl", "ieee", etc.
  abstract-language: "en",  // "ja" or "en"
  keywords-language: "en",  // "ja" or "en"
  front-matter-order: ("title", "authors", "title-en", "authors-en", "abstract", "keywords"),  // 独自コンテンツの追加も可能
  front-matter-spacing: 1.5em,
  front-matter-margin: 2.0em,
  // 見出し Headings
  heading-abstract: [*Abstract--*],
  heading-keywords: [*Keywords*: ],
  heading-bibliography: [参　考　文　献],
  heading-appendix: [付　録],
  // フォントサイズ Font size
  font-size-title: 16pt,
  font-size-title-en: 12pt,
  font-size-authors: 12pt,
  font-size-authors-en: 12pt,
  font-size-abstract: 10pt,
  font-size-heading: 12pt,
  font-size-main: 10pt,
  font-size-bibliography: 9pt,
  // 補足語 Supplement
  supplement-image: [図],
  supplement-table: [表],
  supplement-separator: [: ],
  // 番号付け Numbering
  numbering-headings: "1.1",
  numbering-equation: "(1)",
  numbering-appendix: "A.1",  // #show: appendix.with(numbering-appendix: "A.1") の呼び出しにも同じ引数を与えてください。
)

// この文書特有の関数を定義
// 赤字で警告する
#let red-warn(it) = text(it, fill: rgb(red), weight: "bold")
// リンクを青文字にする
#show link: set text(fill: blue)

// 句読点をカンマとピリオドに変換
#show "、": "，"
#show "。": "．"

= はじめに <sec:info>
これは#conference-name;のサンプルを参考に作成しています。
#red-warn[実用の際には適宜投稿先の規定を必ずご確認ください。]
発表論文原稿をPDFでご執筆いただき、学会のホームページにアップロードしてください。
このファイルはこのテンプレートの使い方を示しており、同時に発表論文の見本でもあります。
執筆の時は以下の説明をよく読み、執筆要項に従ったフォーマットでご提出ください。
アップロードしたPDFがそのまま公開されます。
というような説明が書かれるであろうテンプレートを作ってみました。
本稿では、このテンプレートファイルの使い方および Typst による執筆作業の概要について解説します。
この原稿のソースコードは https://github.com/kimushun1101/typst-jp-conf-template で公開しております。
ご要望や修正の提案があれば、Issue や Pull Request でお知らせください。筆者に届く形であればSNSなど他の手段でも構いません。
Typst の概要についてお知りになりたい方は、https://github.com/kimushun1101/How-to-use-typst-for-paper-jp にもスライド形式の資料を用意しておりますので、ぜひこちらもご覧ください。

= テンプレートファイルの使い方 <sec:usage>
GitHub に慣れていればテンプレートリポジトリを使用して、新しいリポジトリを作成してクローン。不慣れであれば zip ダウンロードして展開してください。

テンプレートファイルは以下の3つの方法で実行できることを確認しています。
+ VS Code とその拡張機能を使う。
+ Typst app にアップロードする。
+ CLI (Command Line Interface) でコンパイルする。
もちろん他のエディターの拡張機能など、異なる方法での執筆も可能ですが、ここではこの3つの方法について説明します。

== Visual Studio Code による執筆
エディターソフトのこだわりが無い方にはVisual Studio Code (VS Code)の使用をオススメします。
VS Code の拡張機能であるTinymist Typstをインストールすれば、そのPreview機能によって、編集中においても現在の出力結果を常に確認できます。
インストールされていない状態でこのディレクトリをVS Code で開くと、拡張機能のRecommendationsにTinymist Typstが表示されるのでインストールしてください。
表示されない場合には、VS Codeの拡張機能検索からインストールしてください。
また、`.vscode/settings.json` にて保存と同時にPDFファイルが作成される設定にしております。

== Typst app へのアップロード
Typst appはブラウザ上で動作するため、OSに依存しません。
有料のプランもありますが、無料プランでも十分な機能が使えます。
たとえば、URLを共有して他の人と共同編集することも可能です。
Typst appのページ https://typst.app/ から`Sign up`でアカウントを作成してください。
ご自身のページを開いたら`Empty document`から新規プロジェクトを作成できます。
`git clone`やzip展開したファイルおよびフォルダーをアップロードしてください。

== Typst CLI でコンパイル
ターミナルでのコマンド操作でコンパイルする方法もあります。
何か不具合があるときには、こちらでのコンパイルが一番確実です。

=== インストール <sec:typst-install>
- Windowsの場合\ Windows PowerShellから以下のコマンドでインストールできます。
```powershell
winget install --id Typst.Typst
```
- Macの場合\ Homebrewを使ってインストールできます。
```sh
# Homebrewのインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Typst のインストール
brew install typst
```
- Ubuntuの場合\ Snapからインストールできます。
```sh
# Snapのインストール
sudo apt update
sudo apt install snapd
# Typstのインストール
sudo snap install typst
```
- Rustを通じてインストール\ OSに依存せずRustのcargoを使ってインストールすることもできます。
```sh
# Rustのインストール
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Typstのインストール
cargo install --locked typst-cli
```

=== コンパイル
ターミナルで対象のディレクトリに移り
```sh
typst compile main.typ
```
とコマンドすればmain.pdfをビルドできます。
編集しながら自動でコンパイルしたい場合は
```sh
typst watch main.typ
```
というコマンドもあります。

= 原稿の体裁 <sec:format>
このテンプレートのソースコードはcharge-ieeeとabiding-ifacconfなどのテンプレートを参考にして作成しました。
テンプレートの検索はTypst Universe https://typst.app/universe ででき、そこで掲載されているテンプレートのソースコードは https://github.com/typst/packages/tree/main/packages/preview で見ることができます。
ここで実行しているテンプレートファイルは "libs/学会名/" に格納しています。
体裁は2023年に公開されていた各学会のフォーマットに近づけました。
#context{
  show "，": "、"
  show "．": "。"
  [句読点は全角の "，" と "．" を使用します．main.typ に記載した"、"や"。"は自動で変換されます．]
}

== レイアウトとフォント
用紙サイズは A4、縦250 mm、横170 mm の枠内に収まるようにしています。
余白は、上 20 mm、下27 mm、左20 mm、右20 mm とします。
タイトル、著者、アブストラクトはシングルコラム、本文はダブルコラムです。
アブストラクトは左右に 0.7 cm 余白を取っています。

フォントの設定は @tab:fonts の通りです。
ここで、ゴシック体や明朝体の具体的なフォントファミリーは @sec:paper-info のコード内で設定しています。

#figure(
  placement: bottom,
  caption: [フォントの設定],
  table(
    columns: 3,
    stroke: none,
    table.header(
      [項目],
      [サイズ (pt)],
      [フォント],
    ),
    table.hline(),
    [#text(18pt, "タイトル")], [18], [ゴシック体],
    [#text(12pt, "著者名")], [12], [ゴシック体],
    [#text(12pt, "章タイトル")], [12], [ゴシック体],
    [節、小節、本文], [10], [明朝体],
    [#text(9pt, "参考文献")], [9], [明朝体],
  )
) <tab:fonts>

== 数式・図・表
数式番号は @eq:system のように数式の右側に、図のタイトルは "@fig:quadratic タイトル名"のように図の下部に、表のタイトルは "@tab:fonts タイトル名" のように図の上部につきます。
投稿先に応じてキャプションの言語は日本語や英語で指定されるかと思いますので、指示に従ってください。

== 定理環境
以下はtheorem環境の使用例です。
定理などのタイトルフォントをゴシックにしています。

#definition("用語 A")[
  用語 A の定義を書きます。
]<def:definition1>
#lemma[
  補題を書きます。タイトルは省略することもできます。
]<lem:lemma1>
#lemma("補題 C")[
  補題を書きます。番号は定義や補題ごとに 1 からカウントします。
]<lem:lemma2>
#theorem("定理 D")[
  ここに定理を書きます。
]<thm:theorem1>
#corollary[
  系を書きます。@def:definition1 のように、ラベルで参照することもできます。
]
#proof([@thm:theorem1 の証明])[
  証明を書きます。証明終了として□印をつけています。
]

== 特殊な章
謝辞と参考文献は他の章とは異なり、章番号が自動でつかないように設定しています。
また、参考文献は "参　考　文　献" とスペースで区切り、中央揃えとなります。
付録は "A" のように番号の代わりにアルファベットがつくようにしています。

= 編集の仕方 <sec:edit>

== 論文情報の編集 <sec:paper-info>
main.typ の文頭にある以下のコードを解説します。
```typ
// Select the Template
#import "libs/mscs/lib.typ": mscs as temp, definition, lemma, theorem, corollary, proof, appendix
// #import "libs/rengo/lib.typ": rengo as temp, definition, lemma, theorem, corollary, proof, appendix
// #import "libs/rsj-conf/lib.typ": rsj-conf as temp, definition, lemma, theorem, corollary, proof, appendix

#show: temp.with(
  title: [Typst を使った国内学会論文の書き方 \ - 国内学会予稿集に似せたフォーマットの作成 - ],
  title-en: [How to Write a Conference Paper in Japanese],
  authors: [◯ 著者姓1 著者名1、著者姓2 著者名2(○○○大学)、著者姓3 著者名3 (□□□株式会社)],
  authors-en: [\*A. First, B. Second (○○○ Univ.), and C. Third (□□□ Corp.)],
  abstract: [#lorem(80)],
  keywords: ([Typst], [conference paper writing], [manuscript format]),
  font-heading: "Noto Sans CJK JP",
  font-main: "Noto Serif CJK JP",
  font-latin: "New Computer Modern"
```
ここの2行目はこの原稿の体裁を設定するためのソースコードをimportしています。
これは"libs"ディレクトリ以下にあるファイルを指定しており、`mscs`関数を`temp`関数として読み出し、他の関数はそのまま読み出しています。
3行目と4行目は他のテンプレートを用意しており、2行目と交換してコメントアウトを切り替えることで、そのテンプレートを適用できます。
6行目では、2行目で読み込んだ関数を使用して、原稿体裁を作成しています。
7行目では日本語タイトル、8行目では英語タイトル、9行目には著者一覧、10行目には英語の著者一覧を、11行目にはアブストラクト、12行目にはキーワード、13から15行目には使用するフォントファミリーを記載します。
タイトルなどで途中改行をしたい場合には、`\`で改行してください。
アブストラクトに入力されている`lorem` 関数は英文のダミーテキストを作成してくれる関数です。
`keywords` は`()` のリスト形式で指定されていることに注意してください。
フォントに関しては、設定したフォントがお使いのコンピュータになければ警告を出します。
以下のコマンドで使用可能なフォント一覧を確認できます。
```sh
typst fonts
```
こちらで存在するフォントを設定してください。
たとえば、Windowsであれば"MS PGothic" や "MS PMincho" が、Macであれば"Hiragino Kaku Gothic Pro" や "Hiragino Mincho Pro" が使えるかと思います。
また、使用したいフォントがない場合には、フォントをインストールしてください。

== 基本的な文法
章は `=`、節は `==`、項は `===` で始めます。
改段落は LaTeX と同じく改行を 2 つ以上挟みます。
数字つき箇条書きは `+` で、数字なしの箇条書きは `-` を文頭につけて書くことができます。
テキストの装飾は text 関数で行えます。
LaTeX に慣れている方は、Typst 公式ページの https://typst.app/docs/guides/guide-for-latex-users/ を読むと雰囲気がつかめると思います。

== 数式
数式番号をつけるような中央揃えの数式は、最初の`$` の後ろと閉じの`$` の前にスペースを挟み
```typ
  $ dot(x) &= A x + B u \
  y &= C x $ <eq:system>
```
のように書き、文中に書く数式は、`$` の前後にスペースを挟まず
```typ
  $x in RR^n$
```
というように書きます。
ここで `<eq:system>` は引用するときのラベルになります。

出力例はつぎの通りです。
以下のシステムを考える。
$ dot(x) &= A x + B u \
 y &= C x $ <eq:system>
ここで $x in RR^n$ は状態、$u in RR^m$ は入力、$y in RR^l$ は出力、$A in RR^(n times n)$、$B in RR^(n times m)$。および $C in RR^(l times n)$ は定数行列である。
このシステムに対して、目標値 $r(t)$ に対する偏差を $e = r - y$ とした以下の PI 制御器を使用する。
$ u = K_P e + K_I integral_0^t e d t $ <eq:PI-controller>
ただし、$K_P$ と $K_I$ はそれぞれ比例ゲイン、積分ゲインとする。

== 図と表
本稿を執筆時のバージョン Typst 0.13.1 では、PNG, JPEG, GIF, SVG の形式のイメージデータを挿入することができます。
PDFの挿入は muchpdfパッケージ(https://typst.app/universe/package/muchpdf)を使用すれば可能ですが、ここでは説明しません。
SVGとPNGの表示例としては以下の通りです。
```typ
  #figure(
    placement: bottom,
    image("figs/quadratic.svg", width: 90%),
    caption: [$x^2$ のグラフ],
  ) <fig:quadratic>

  #figure(
    placement: bottom,
    image("figs/sqrt-and-sin.png", width: 90%),
    caption: [$sqrt(x)$ と $sin x$ のグラフ],
  ) <fig:sqrt-sin>
```
ここで placement は、紙面の上 (top) に寄せるか下 (bottom) に寄せるかを決められます。言及している文章に近い方や見栄えが良い方に調整してください。

#figure(
  placement: bottom,
  image("figs/quadratic.svg", width: 90%),
  caption: [$x^2$ のグラフ],
) <fig:quadratic>

#figure(
  placement: bottom,
  image("figs/sqrt-and-sin.png", width: 90%),
  caption: [$sqrt(x)$ と $sin x$ のグラフ],
) <fig:sqrt-sin>

@tab:fonts は以下で記述されております。
```typ
  #figure(
    placement: top,
    caption: [フォントの設定],
    table(
      columns: 3,
      stroke: none,
      table.header(
        [項目],
        [サイズ (pt)],
        [フォント],
      ),
      table.hline(),
      [#text(18pt, "タイトル")], [18], [ゴシック体],
      [#text(12pt, "著者名")], [12], [ゴシック体],
      [#text(12pt, "章タイトル")], [12], [ゴシック体],
      [節、小節、本文], [10], [明朝体],
      [#text(9pt, "参考文献")], [9], [明朝体],
    )
  ) <tab:fonts>
```
table の columns の数に応じて、文字列の配列が自動的に整列されます。
`stroke: none` は枠線を消しています。
`table.hline()` を挟むとその位置に横線を引けます。

== 定理環境 <sec:theorem>
@def:definition1 や @lem:lemma1 などは以下で記述されております。

```typ
  #definition("用語 A")[
    用語 A の定義を書きます。
  ]<def:definition1>
  #lemma[
    補題を書きます。タイトルは省略することもできます。
  ]<lem:lemma1>
  #lemma("補題 C")[
    補題を書きます。番号は定義や補題ごとに 1 からカウントします。
  ]<lem:lemma2>
  #theorem("定理 D")[
    ここに定理を書きます。
  ]<thm:theorem1>
  #corollary[
    系を書きます。@def:definition1 のように、ラベルで参照することもできます。
  ]
  #proof([@thm:theorem1 の証明])[
    証明を書きます。証明終了として□印をつけています。
  ]
```

#red-warn[
  ここで、`definition`, `lemma`, `theorem`, `corollary`, `proof`は `lib.typ` で定義している関数であり、`#import`しなければ使用できません。
]
```typ
#import "libs/mscs/lib.typ": mscs as temp, definition, lemma, theorem, corollary, proof, appendix
```
さらに元をたどると#link("https://github.com/kimushun1101/typst-jp-conf-template/blob/5862f4fd21b4f00488a56657e198864625d117b8/jaconf-eng/lib.typ#L9")[`lib.typ`]でctheoremsパッケージ (https://typst.app/universe/package/ctheorems) をインポートして使用しております。
#red-warn[他のテンプレートを使用する際には#link("https://github.com/kimushun1101/typst-jp-conf-template/blob/5862f4fd21b4f00488a56657e198864625d117b8/jaconf-eng/lib.typ#L9-L35")[`lib.typ`のコード]を参考に、以下のようにご自身のコード内で定義および有効化をしてください。]

```typ
// Theorem environments
#let thmja = thmplain.with(base: {}, separator: [#h(0.5em)], titlefmt: strong, inset: (top: 0em, left: 0em))
#let definition = thmja("definition", context{text(font: state-font-heading.get())[定義]})
#let lemma = thmja("lemma", context{text(font: state-font-heading.get())[補題]})
#let theorem = thmja("theorem", context{text(font: state-font-heading.get())[定理]})
#let corollary = thmja("corollary", context{text(font: state-font-heading.get())[系]})
#let proof = thmproof("proof", context{text(font: state-font-heading.get())[証明]}, separator: [#h(0.9em)], titlefmt: strong, inset: (top: 0em, left: 0em))
// Enable packages.
#show: thmrules.with(qed-symbol: $square$)
```

== 参考文献
参考文献は `refs.yml` に記載してください。
Hayagriva という YAML 形式のフォーマットに従っています。
編集するだけであれば特に解説する必要はないと思います。
詳細が気になる方は https://github.com/typst/hayagriva をご参照ください。
参考文献の体裁は `libs/学会名/` にあるCSLファイルで制御しています。
これはCitation Style LanguageというXML形式で記述されております。
CSLファイルは著者が編集する必要はありませんが、詳細が気になる方は https://citationstyles.org/ をご参照ください。
日本語論文として重要な点は、CSL ファイルでは Hayagriva で記述された `language` の属性を見て、著者表示を"カンマ区切りのみ"にするか"カンマ区切り+最終著者の前にand" にするかを決定している点です。
したがって、英語文献だけでしたら YAML ファイルの代わりに bib ファイルも使用することができます。

文献内で引用された順番にフォーマットを整えて自動で参考文献の章が作られます。
引用の方法については後述します。
完成原稿では推奨されませんが、引用されていない論文も記載したい場合には full: true にすれば、すべての文献が出力されます。

== 引用
引用は "\@label" と記述することで、数式であれば@eq:system、図であれば@fig:quadratic、表であれば@tab:fonts、セクションであれば@sec:edit、節や項があるセクションであれば@sec:typst-install、付録セクションであれば@appendix:edit、参考文献であれば@kimura2015asymptotic のように表示されます。
参考文献は連続して引用すると @kimura2023doctor @kimura2021control @kimura2020facility @khalil2002control @sugie1999feedback @caamp2025aisuitcase と表示されます。
文法上では特に規則はありませんが、個人的にはラベルの命名規則として、数式の場合には "eq:" から、図の場合には "fig:" から、表の場合には"tab:" から、セクションの場合には "sec:" から、付録セクションであれば "appendix:" から始めるようにラベル名を設定しており、参考文献のラベルは "著者名発行年タイトルの最初の単語"で名付けております。

= おわりに <sec:conclusion>
まだまだTypst自体は発展途上中であり、最新の状態は日々変化しております。
また筆者の理解や表現が誤っている箇所もあるかと思います。
対応していただきたい内容や修正していただきたい内容などありましたら、#link("https://github.com/kimushun1101/typst-jp-conf-template")[GitHub] を通して、Issues や Pull Requests をいただけますと幸いです。
このテンプレートは日本語論文のために作成しておりますため、日本語での投稿で構いません。もちろん英語での投稿でも問題ありません。
誤字脱字や文法、表現など細かい修正でも大変ありがたいです。
筆者は、Typstが普及するためには学会のフォーマットで配布されることが不可欠だと感じています。
異なる学会のフォーマットも随時`libs`ディレクトリに追加していこうと思っております。
これらのファイルがTypst が普及の一助となれば幸いです。

#heading(numbering: none)[謝辞]
謝辞のように章番号が振られたくない見出しは以下のように設定します。
```typst
#heading(numbering: none)[謝辞]
```
謝辞のセクションでは、「この研究は☆☆☆の助成を受けて行われました。」や「〇〇〇大学との共同研究です。」
などの文章が書かれることを想定しています。

最後までお読みいただき誠にありがとうございました。

#block[
  #set text(lang: "en")
  #bibliography("refs.yml", full: false)
]

#show: appendix.with(numbering-appendix: "A.1")

= 付録の書き方 <appendix:edit>
参考文献の後ろに付録を付けたい場合には、
```typ
  #show: appendix.with(numbering-appendix: "A.1")
```
を追加してください。
その場所に`heading-appendix`で設定した文字（デフォルトでは「付　録」）が挿入されます。
それ以降に見出しを書くことで、章番号が`numbering-appendix`で設定した体裁で見出しがつきます。
デフォルトである`"A.1"`ではアルファベット順につきます。
`#show: appendix.with(numbering-appendix`の値を変更する場合には、
`#show: temp.with(`の引数である`numbering-appendix`の値も合わせて変更してください。
見出し番号をデフォルトから変更した際にこれを怠ると、付録の見出し番号と@appendix:edit のようなラベルの番号の表記が一致しなくなります。

また、@sec:theorem に示す定理環境と同様に、
#red-warn[`appendix`はこのテンプレートで定義している関数であり、`#import`しなければ使用できません。]

= 付録に複数のセクションがある場合
2つ目のセクションはBとなります。

== サブセクションの番号
サブセクションはB.1のようになります。
図はセクションアルファベットとリセットされた図番号が組み合わさります。

#figure(
  placement: bottom,
  image("figs/quadratic.svg", width: 90%),
  caption: [$x^2$ のグラフ],
) <fig:appendix>
