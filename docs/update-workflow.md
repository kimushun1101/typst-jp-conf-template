# アップデートの作業手順

自分用メモ。

## 現状の確認

[Typst Universe](https://typst.app/universe/package/jaconf-mscs)から作成してエラーやワーニングを確認する。

```
cd
typst init @preview/jaconf-mscs:0.1.1 typst-universe
typst c typst-universe/main.typ
ls typst-universe
```

## 修正

- `jaconf-mscs/lib.typ`のエラーやワーニングを修正
- バージョンを上げる
  - `jaconf-mscs/typst.toml`の`version`と`compiler`を更新
  - `@preview/jaconf-mscs:0.1.1`で検索して現在のバージョンに置換

## ローカルパッケージで確認

このリポジトリにある`jaconf-mscs`ディレクトリ（フォルダー）の中身を特定のディレクトリに配置することで、ユーザーのどのディレクトリからでもテンプレートファイルを作成できます。特定のディレクトリとは以下の通りです。

- ~/.local/share/typst/packages/local/${name}/${version} # Linux
- ~/Library/Application Support/typst/packages/local/${name}/${version} # macOS (Default Installer)
- %APPDATA%/typst/packages/local/${name}/${version} # Windows

さらに、作成したtemplateディレクトリにある`main.typ`の`#import "@preview/...`を`#import "@local/...`に書き換えてください。

たとえばLinuxの場合には、以上の操作を以下のコマンドで行えます。

```sh
# cd "path to typst-jp-conf-template"
pkgname=jaconf-mscs
pkgver=$(grep -E 'version *= *".*"' ${pkgname}/typst.toml | grep -Eo '".*"' | tr -d '"')
pkgdir=~/.local/share/typst/packages/local/${pkgname}/${pkgver}
mkdir -p ${pkgdir}
cp -r ${pkgname}/* ${pkgdir}
sed -i "s|@preview|@local|" ${pkgdir}/template/main.typ
```

上記を適用した状態で、別ターミナルで以下のコマンドを入力する。
エラーやワーニングが起らず、`main.pdf`ができていればOK。

```sh
cd
typst init @local/jaconf-mscs typst-local
typst c typst-local/main.typ
ls typst-local
```

## Typst Universe更新

1. https://github.com/kimushun1101/typst-packages にアクセスして`main`ブランチをアップデート。その後手元にgit pullする。
2. 以下のコマンドでコピーする。`typstpkgs=~/typst_ws/typst-packages`が異なれば変更する。

    ```sh
    # cd "path to typst-jp-conf-template"
    typstpkgs=~/typst_ws/typst-packages
    pkgname=jaconf-mscs
    pkgver=$(grep -E 'version *= *".*"' ${pkgname}/typst.toml | grep -Eo '".*"' | tr -d '"')
    pkgdir=${typstpkgs}/packages/preview/${pkgname}/${pkgver}
    mkdir -p ${pkgdir}
    cp -r ${pkgname}/* ${pkgdir}
    ```

3. プルリクエストを出す。
    - [packages/jaconf-mscs:0.1.0](https://github.com/typst/packages/pull/1559)
    - [packages/jaconf-mscs:0.1.1](https://github.com/typst/packages/pull/2287)
4. `typst-jp-conf-template`は`jaconf-mscs:*.*.*`などとコミットしておきドラフトプルリクエストにしておく。
5. `packages`のプルリクエストがマージされたら、`typst-jp-conf-template`のドラフトプルリクエストもマージする。
    - [typst-jp-conf-template/Update jaconf-mscs:0.1.1](https://github.com/kimushun1101/typst-jp-conf-template/pull/18)

## 後片付け

```sh
rm -rf typst-universe typst-local
```
