# Japananese Conference of Engineering

This is a template for **Japanese academic conference paper of engineerig**.

工学系の日本語の学会論文テンプレート。

## Usage

You can use this template in the Typst web app by clicking "Start from template"
on the dashboard and searching for `jaconf`.

Alternatively, you can use the CLI to kick this project off using the command

```
typst init @preview/jaconf
```

Typst will create a new directory with all the files needed to get you started.

## Configuration

This template exports the `jaconf` function with the following named arguments:

- `title-ja`: The paper's title in Japanese.
- `title-en`: The paper's title in English.
- `authors-ja`: The Authors' name and affiliations in Japanese.
- `authors-ja`: The Authors' name and affiliations in English.
- `abstract`: The content of a brief summary or `none`.
- `keywords`: Array of index terms to display after the abstract.
- `font-gothic`: The Gothic font used for headings.
- `font-mincho`: The Mincho font used for the body.
- `font-latin`: The Latin font used for description in English.
- `paper-columns`: The Latin font used for description in English.

The function also accepts a single, positional argument for the body of the
paper.

The template will initialize your package with a sample call to the `jaconf`
function in a show rule. If you want to change an existing project to use this
template, you can add a show rule like this at the top of your file:

```typ
#import "@preview/jaconf:0.1.0": jaconf, definition, lemma, theorem, corollary, proof, appendix

#show: jaconf.with(
  title-ja: [日本語学会論文のテンプレート \ - サブタイトル - ],
  title-en: [How to Write a Conference Paper in Japanese],
  authors-ja: [◯ 著者姓1 著者名1、著者姓2 著者名2(○○○大学)、著者姓3 著者名3 (□□□株式会社)],
  authors-en: [\*A. First, B. Second (○○○ Univ.), and C. Third (□□□ Corp.)],
  abstract: [#lorem(80)],
  keywords: ([Typst], [conference paper writing], [manuscript format]),
  font-gothic: "Noto Sans CJK JP",
  font-mincho: "Noto Serif CJK JP",
  font-latin: "New Computer Modern"
  // The following settings may warn of missing font families. Please set a font that exists in your environment as an alternative.
  // 以下の設定では存在しないフォントファミリーが含まれていると警告が出ます。環境に存在するフォントを設定してください。
  // font-gothic: ("BIZ UDPGothic", "MS PGothic", "Hiragino Kaku Gothic Pro", "IPAexGothic", "Noto Sans CJK JP"),
  // font-mincho: ("BIZ UDPMincho", "MS PMincho", "Hiragino Mincho Pro", "IPAexMincho", "Noto Serif CJK JP"),
  // font-latin: ("Times New Roman", "New Computer Modern")
)
```


基本

引数名 | 意味（用途） | デフォルト値（例）
-- | -- | --
title-ja | タイトル（日本語） | [日本語タイトル],
title-en | タイトル（英語） | [],
authors-ja | 著者名（日本語）| [著者]
authors-en | 著者名（英語）| []
abstract | アブストラクト | none
keywords | アブストラクト | ()
font-gothic | ゴシックフォント | "Noto Sans CJK JP"
font-mincho | 明朝フォント | "Noto Serif CJK JP"
font-latin | 英文フォント | "New Computer Modern"

オプション

引数名 | 意味（用途） | デフォルト値（例）
-- | -- | --
paper-columns | 段組み | 2
page-number | ページ数 | none
punctuation-comma-period | 句読点をカンマ・ピリオドに | true

見出し

引数名 | 意味（用途） | デフォルト値（例）
-- | -- | --
heading-abstract | アブストラクトの見出し | [*Abstract--*]
heading-keywords | キーワードの見出し | [*Key Words*: ]
heading-bibliography | 参考文献の見出し | "参考文献"
heading-appendix | 付録の見出し | "付録"

フォントサイズ

引数名 | 意味（用途） | デフォルト値（例）
-- | -- | --
font-size-title | タイトルのフォントサイズ | 16pt
font-size-authors-ja | 著者名のフォントサイズ | 12pt
font-size-authors-en | 著者名（英語）のフォントサイズ | 12pt
font-size-abstract | アブストラクトのフォントサイズ | 10pt
font-size-section | セクションのフォントサイズ | 11pt
font-size-bibliography | 参考文献のフォントサイズ | 9pt

補足語

引数名 | 意味（用途） | デフォルト値（例）
-- | -- | --
supplement-image | 図の補足語 | "図 : "
supplement-table | 表の補足語 | "表 : "

番号付け

引数名 | 意味（用途） | デフォルト値（例）
-- | -- | --
numbering-headings | 見出しの番号付け | "1.1"
numbering-appendix | 付録の接頭番号 | "A"
numbering-equation | 数式の接頭番号 | "(1)"

引数名 | 意味（用途） | デフォルト値（例）
-- | -- | --
bibliography-style | 参考文献のスタイル | "ieee"（"sice.csl"など通常はその学会に合わせたファイルを指定）
