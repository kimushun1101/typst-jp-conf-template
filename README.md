![Deploy workflow](https://github.com/kimushun1101/typst-jp-conf-template/actions/workflows/release.yml/badge.svg)
![Deploy workflow](https://github.com/kimushun1101/typst-jp-conf-template/actions/workflows/gh-pages.yml/badge.svg)

# typst-jp-conf-template

Typst Universeに[jaconf-mscs](https://typst.app/universe/package/jaconf-mscs)というテンプレートで登録されました。  
テンプレートの使い方についてはZennで[Typstテンプレートを使用する](https://zenn.dev/kimushun1101/articles/typst-template)という記事を書いております。

Typstで日本語論文を書くときのテンプレートです。
コンパイル済みの資料は[GitHub Pages](https://kimushun1101.github.io/typst-jp-conf-template/typst-jp-conf.pdf)からお読みできます。  
Typstの概要について知りたい方は、[スライド資料](https://github.com/kimushun1101/How-to-use-typst-for-paper-jp)も作成しましたのでご覧ください。

[vscode-typst.webm](https://github.com/kimushun1101/typst-jp-conf-template/assets/13430937/f227b85b-0266-417b-a24a-54f28f9a71b8)

| ファイル  | 意味                    |
| -------- | ----------------------- |
| main.typ | 原稿の Typst ソースコード |
| refs.*　 | 参考文献ファイル          |

| ディレクトリ | 含まれるファイルの種類          |
| ------------- | --------------------------- |
| figs　　      | 論文に使用する画像ファイル    |
| libs　　      | 体裁を整えるライブラリファイル |

雰囲気を掴みたい場合には [こちらの Typst Web Application](https://typst.app/project/wXmeFlJ5bhx1awSRuJRiUf) をお試しください。  

## 使用方法

GitHubに慣れていない方は、GitHubページの `<>Code▼` から `Download ZIP` して展開してください。  
慣れている方は、`git clone` したり `use this template` したり、適宜扱ってください。
このテンプレートをローカルパッケージとして登録したい場合には、[こちら](docs/local-package.md)の説明をご覧ください。

### VS Codeを使用する場合

1. [VS Code](https://code.visualstudio.com/) をインストール。
2. VS Codeで`File`→`Open Folder` でこのフォルダーを開く。  
3. 推奨拡張機能をインストール。  
  Extensions (`Ctrl` + `Shift` + `X`) の `Search Extensions in Marketplace` のテキストボックスに `@recommended` と入力すると表示される、以下の拡張機能をinstallをクリック。  
    - [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)
4. Explorer (`Ctrl` + `Shift` + `E`) から `main.typ` を開いた状態で、画面右上にあるTypst Previewの方の ![view-icon](https://github.com/kimushun1101/typst-jp-conf-template/assets/13430937/a44c52cb-d23a-4fdb-ac9f-dc2b47deb40a) アイコンをクリック (
 `Ctrl` + `K` のあと `V`) でプレビューを表示。[トップにある動画](#typst-jp-conf-template) の操作です。
5. `Ctrl` + `S` でPDFを生成。

### 他の方法で使用する場合

[別ページ](docs/compile.md)をご参照ください。

## 参考元

- (unofficial) IFAC Conference Template for Typst : https://github.com/typst/packages/tree/main/packages/preview/abiding-ifacconf/0.1.0
- charged-ieee : https://github.com/typst/packages/tree/main/packages/preview/charged-ieee/0.1.0
- IEEE style as per the 2021 guidelines, V 01.29.2021. : https://editor.citationstyles.org/styleInfo/?styleId=http%3A%2F%2Fwww.zotero.org%2Fstyles%2Fieee
- GitHub Pagesへのデプロイ : https://github.com/yukukotani/typst-coins-thesis

## ライセンス

参考元にならってライセンスを付与しています。  
Typstファイル : MIT No Attribution  
CSLファイル : Creative Commons Attribution-ShareAlike 3.0 License  
