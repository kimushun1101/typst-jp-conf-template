# コンパイル方法

## VS Codeを使用

[README.md](../README.md)をご参照ください。

## Typst app にアップロード

1. [Typst app](https://typst.app/)から `Sign up` でアカウントを作成
2. `Empty document` から新規プロジェクトを作成
3. zip 展開したファイルおよびフォルダーをアップロード
4. main.typの目のアイコンが閉じていれば、これ![image](https://github.com/user-attachments/assets/bf5dc1c8-78c4-4bb9-9d78-b8ea93271236)をクリック

## コマンドによるインストール

Typstのインストール方法は、[TypstのGitHubページ](https://github.com/typst/typst) にある通りですが、以下の3つのパターンが簡単かと思われます。

### Windows

PowerShellを開き以下のコマンドを入力する。

```powershell
winget install --id Typst.Typst
```

`winget`コマンドが有効でない場合には、Microsoft Storeから[アプリインストーラー](https://apps.microsoft.com/detail/9nblggh4nns1)をインストールすると使えるようになります。

### Mac

1. [Homebrew](https://brew.sh/ja/) をインストール

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. 以下のコマンドを入力

   ```sh
   brew install typst
   ```

### Rust を通してインストール

Ubuntuの場合などはこの方法をオススメします。

1. [Rust](https://www.rust-lang.org/ja/tools/install) をインストール

   ```sh
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

2. 以下のコマンドを入力する。

   ```sh
   cargo install --git https://github.com/typst/typst --locked typst-cli
   ```

## コマンドによるコンパイル

1. 解凍したフォルダーの `main.typ` を編集
2. PowerShellやターミナルで `main.typ` のあるディレクトリに移り、以下のコマンドで `main.pdf` を生成

   ```sh
   typst compile main.typ
   ```

3. 編集しながらコンパイルしたい場合には、以下のコマンドも便利です。

   ```sh
   typst watch main.typ
   ```
