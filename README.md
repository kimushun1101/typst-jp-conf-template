![Deploy workflow](https://github.com/kimushun1101/typst-jp-conf-template/actions/workflows/release.yml/badge.svg)
![Deploy workflow](https://github.com/kimushun1101/typst-jp-conf-template/actions/workflows/gh-pages.yml/badge.svg)

# typst-jp-conf-template

Typstで日本語論文を書くときのテンプレートです。
コンパイル済みの資料は[GitHub Pages](https://kimushun1101.github.io/typst-jp-conf-template/typst-jp-conf.pdf)からお読みできます。  
Typstの概要について知りたい方は、[スライド資料](https://github.com/kimushun1101/How-to-use-typst-for-paper-jp)も作成しましたのでご覧ください。

[vscode-typst.webm](https://github.com/kimushun1101/typst-jp-conf-template/assets/13430937/f227b85b-0266-417b-a24a-54f28f9a71b8)

| ファイル  | 意味                    |
| -------- | ----------------------- |
| main.typ | 原稿の Typst ソースコード |
| refs.*　 | 参考文献ファイル          |

| ディレクトリ  | 含まれるファイルの種類        |
| ----------- | ------------------------- |
| figs        | 論文に使用する画像ファイル    |
| libs        | 体裁を整えるライブラリファイル |
| jaconf      | `jaconf`パッケージのファイル |
| jaconf-mscs | `jaconf-mscs`パッケージのファイル |

雰囲気を掴みたい場合には [こちらの Typst Web Application](https://typst.app/project/wXmeFlJ5bhx1awSRuJRiUf) をお試しください。  

## 使い方

本ソースコードは[jaconf-mscs](https://typst.app/universe/package/jaconf-mscs)という名前でTypst Universeに登録しました。
Typstをインストール済みであれば以下のCLIでお試しいただけます。

```
typst init @preview/jaconf-mscs:0.1.1
```

VS Codeを用いたGUI操作については、[Typstテンプレートを使用する](https://zenn.dev/kimushun1101/articles/typst-template)という記事で紹介しております。

### VS Codeの場合

1. `File`→`Open Folder` で`main.typ`があるフォルダーを開く。
2. Extensions (`Ctrl` + `Shift` + `X`) から拡張機能[Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)をインストール。
3. Explorer (`Ctrl` + `Shift` + `E`) から `main.typ` を開いた状態で、画面右上にある ![view-icon](https://github.com/kimushun1101/typst-jp-conf-template/assets/13430937/a44c52cb-d23a-4fdb-ac9f-dc2b47deb40a) アイコン（Typst Preview）をクリック。
4. `Ctrl` + `S` でPDFを生成。

### 他のエディターの場合

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
