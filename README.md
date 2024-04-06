# typst-jp-conf-template
Typst で日本語論文を書くときのテンプレートです．

[vscode-typst.webm](https://github.com/kimushun1101/typst-jp-conf-template/assets/13430937/f227b85b-0266-417b-a24a-54f28f9a71b8)


| ファイル  | 意味                    |
| -------- | ----------------------- |
| main.typ | 原稿の Typst ソースコード |
| refs.*　 | 参考文献ファイル          |


| ディレクトリ | 含まれるファイルの種類          |
| ------------- | --------------------------- |
| figs　　      | 論文に使用する画像ファイル    |
| libs　　      | 体裁を整えるライブラリファイル |


雰囲気を掴みたい場合には [こちらの Typst Web Application](https://typst.app/project/w41EH6HRoEsXp95IW_y1WK) をお試しください．  
コンパイル済みの資料を確認したいだけでしたら [こちらの GitHub Pages](https://kimushun1101.github.io/typst-jp-conf-template/typst-jp-conf.pdf) からお読みできます．

## ローカル開発環境構築
[Typst](https://typst.app/) をインストール方法を示します．  
[Typst の GitHubページ](https://github.com/typst/typst) にある通りですが，Typst のローカル環境へのインストールは以下の 3 つのパターンが簡単かと思われます．

### Windows
PowerShell を開き以下のコマンドを入力する．
```powershell
winget install --id Typst.Typst
```
`winget` コマンドが有効でない場合には，Microsoft Store から [アプリインストーラー](https://apps.microsoft.com/detail/9nblggh4nns1) をインストールすると使えるようになります．

### Mac
[Homebrew](https://brew.sh/ja/) を導入して，以下のコマンドを入力する．
```sh
brew install typst
```
[このページ](https://brew.sh/ja/) の通りですが，Homebrew のインストールは以下のコマンドで行えます．
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Rust を通してインストール
Ubuntu の場合などはこの方法をオススメします．
[Rust](https://www.rust-lang.org/ja/tools/install) をインストールして，以下のコマンドを入力する．
```sh
cargo install --git https://github.com/typst/typst --locked typst-cli
```
[このページ](https://www.rust-lang.org/ja/tools/install) の通りですが，Rust のインストールは以下のコマンドで行えます．
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## 使用方法
1. GitHub に慣れていない方は，GitHub ページの `<>Code▼` から `Download ZIP` して展開してください．  
慣れている方は，`git clone` したり `use this template` したり，適宜扱ってください．
2. PowerShell やターミナルで展開したディレクトリに移り，以下のコマンドを入力することで `main.pdf` が生成されます．
   ```
   typst compile main.typ
   ```

### VS Code を使用する場合
1. [VS Code](https://code.visualstudio.com/) をインストール．
1. VS Code で `File`→`Open Folder` でこのフォルダーを開く．  
2. 推奨拡張機能をインストール．  
  Extensions (`Ctrl` + `Shift` + `X`) の `Search Extensions in Marketplace` のテキストボックスに `@recommended` と入力すると表示される，以下の拡張機能をinstall をクリック．  
    - [Typst LSP](https://marketplace.visualstudio.com/items?itemName=nvarner.typst-lsp)
    - [Typst Preview](https://marketplace.visualstudio.com/items?itemName=mgt19937.typst-preview)
    - [Tasks Shell Input](https://marketplace.visualstudio.com/items?itemName=augustocdias.tasks-shell-input)
1. Explorer (`Ctrl` + `Shift` + `E`) から `main.typ` を開いた状態で，画面右上にある Typst Preview の方の ![view-icon](https://github.com/kimushun1101/typst-jp-conf-template/assets/13430937/a44c52cb-d23a-4fdb-ac9f-dc2b47deb40a) アイコンをクリック (
 `Ctrl` + `K` のあと `V`) でプレビューを表示．
2. `Ctrl` + `S` で PDF を生成．

## 参考元
- (unofficial) IFAC Conference Template for Typst : https://github.com/typst/packages/tree/main/packages/preview/abiding-ifacconf/0.1.0
- charged-ieee : https://github.com/typst/packages/tree/main/packages/preview/charged-ieee/0.1.0
- IEEE style as per the 2021 guidelines, V 01.29.2021. : https://editor.citationstyles.org/styleInfo/?styleId=http%3A%2F%2Fwww.zotero.org%2Fstyles%2Fieee
- GitHub Pages へのデプロイ : https://github.com/yukukotani/typst-coins-thesis

## ライセンス
参考元にならってライセンスを付与しています．  
Typst ファイル : MIT No Attribution  
CSL ファイル : Creative Commons Attribution-ShareAlike 3.0 License  
