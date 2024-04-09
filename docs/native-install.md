# ローカル環境構築

## コマンドによるインストール
Typst のインストール方法は，[Typst の GitHubページ](https://github.com/typst/typst) にある通りですが，以下の 3 つのパターンが簡単かと思われます．

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

## コマンドによるコンパイル
1. [Typst](https://typst.app/) をインストール．
2. 解凍したフォルダーの `main.typ` を編集．
3. PowerShell やターミナルで `main.typ` のあるディレクトリに移り，以下のコマンドで `main.pdf` を生成．
   ```
   typst compile main.typ
   ```
