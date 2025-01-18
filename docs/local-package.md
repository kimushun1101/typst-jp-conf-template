# Typst Package について

`typst.toml` には、[Typst Packages](https://github.com/typst/packages) にある様式の通りにプロパティが登録されています。これは、Typst Universeにテンプレートファイルを公開し、コンパイラが `typst init` コマンドを実行するためのメタデータです。ただし、現時点では、Typst Universeに当該テンプレートは登録されていません。

## ローカルパッケージの作成

このリポジトリにある`jaconf-mscs`ディレクトリ（フォルダー）の中身を特定のディレクトリに配置することで、ユーザーのどのディレクトリからでもテンプレートファイルを作成できます。特定のディレクトリとは以下の通りです。

- ~/.local/share/typst/packages/local/${name}/${version} # Linux
- ~/Library/Application Support/typst/packages/local/${name}/${version} # macOS (Default Installer)
- %APPDATA%/typst/packages/local/${name}/${version} # Windows

さらに、作成したtemplateディレクトリにある`main.typ`の`#import "@preview/...`を`#import "@local/...`に書き換えてください。

たとえばLinuxの場合には、以上の操作を以下のコマンドで行えます。

```
# cd "path to typst-jp-conf-template"
pkgname=jaconf-mscs
pkgver=$(grep -E 'version *= *".*"' ${pkgname}/typst.toml | grep -Eo '".*"' | tr -d '"')
pkgdir=~/.local/share/typst/packages/local/${pkgname}/${pkgver}
mkdir -p ${pkgdir}
cp -r ${pkgname}/* ${pkgdir}
sed -i "s|@preview|@local|" ${pkgdir}/template/main.typ
```

## ローカルパッケージの使用

上記を適用した状態で、以下のコマンドを入力すると、ディレクトリが初期化されます。

```sh
typst init @local/jaconf-mscs
```
