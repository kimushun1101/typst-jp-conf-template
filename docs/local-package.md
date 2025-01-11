# Typst Package について

`typst.toml` には、[Typst Packages](https://github.com/typst/packages) にある様式の通りにプロパティが登録されています。これは、Typst Universeにテンプレートファイルを公開し、コンパイラが `typst init` コマンドを実行するためのメタデータです。ただし、現時点では、Typst Universeに当該テンプレートは登録されていません。

このリポジトリの中身を特定のディレクトリ（フォルダー）に配置することで、ユーザのどのディレクトリからでもテンプレートファイルを作成できます。特定のディレクトリとは以下の通りです。

- ~/.local/share/typst/packages/local/typst-jp-conf-template/{version} # Linux
- ~/Library/Application Support/typst/packages/local/typst-jp-conf-template/{version} # macOS (Default Installer)
- %APPDATA%/typst/packages/local/typst-jp-conf-template/{version} # Windows

上記を適用した状態で、以下のコマンドを入力すると、ディレクトリが初期化されます。

```sh
typst init @local/typst-jp-conf-template
```
