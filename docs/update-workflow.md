# アップデートの作業手順

自分用メモ。

## 必要コマンドの準備

`typst`、`typst-upgrade`、`oxipng`、`typos`をインストールする。

```
cargo install typst-cli typst-upgrade oxipng typos-cli
```

## 現状の確認

[Typst Universe](https://typst.app/universe/package/jaconf)から作成してエラーやワーニングを確認する。

```
cd
typst init @preview/jaconf:0.4.0 test-typst-universe
typst c test-typst-universe/main.typ
ls test-typst-universe
```

## 修正

- `jaconf/lib.typ`のエラーやワーニングを修正
- バージョンを上げる
  - `jaconf/typst.toml`の`version`と`compiler`を更新
  - `@preview/jaconf:0.4.0`で検索して現在のバージョンに置換
- 外部パッケージのバージョン確認

    ```sh
    typst-upgrade -dv jaconf/lib.typ
    ```

- スペルチェック

    ```sh
    typos
    ```

## ローカルパッケージで確認

このリポジトリにある`jaconf`ディレクトリ（フォルダー）の中身を特定のディレクトリに配置することで、ユーザーのどのディレクトリからでもテンプレートファイルを作成できます。特定のディレクトリとは以下の通りです。

- ~/.local/share/typst/packages/local/${name}/${version} # Linux
- ~/Library/Application Support/typst/packages/local/${name}/${version} # macOS (Default Installer)
- %APPDATA%/typst/packages/local/${name}/${version} # Windows

さらに、作成したtemplateディレクトリにある`main.typ`の`#import "@preview/...`を`#import "@local/...`に書き換えてください。

たとえばLinuxの場合には、以上の操作を以下のコマンドで行えます。

```sh
# cd "path to typst-jp-conf-template/jaconf"
pkgname=$(grep -E 'name *= *".*"' typst.toml | grep -Eo '".*"' | tr -d '"')
pkgver=$(grep -E 'version *= *".*"' typst.toml | grep -Eo '".*"' | tr -d '"')
pkgdir=~/.local/share/typst/packages/local/${pkgname}/${pkgver}
mkdir -p ${pkgdir}
rm -f lib.pdf template/main.pdf
cp -r * ${pkgdir}
sed -i "s|@preview|@local|" ${pkgdir}/template/main.typ
```

上記を適用した状態で、別ターミナルで以下のコマンドを入力する。
エラーやワーニングが起らず、`main.pdf`ができていればOK。

```sh
pkgname=$(grep -E 'name *= *".*"' typst.toml | grep -Eo '".*"' | tr -d '"')
rm -rf ~/test-typst-local
typst init @local/${pkgname} ~/test-typst-local
typst c ~/test-typst-local/main.typ
ls ~/test-typst-local
xdg-open ~/test-typst-local/main.pdf
```

サムネイル画像の作成

```sh
cd ~/test-typst-local
typst compile --pages 1 --ppi 250 --root . main.typ thumbnail.png
oxipng -o 4 --strip safe --alpha thumbnail.png
# cp thumbnail.png repo
```

## Typst Universe更新

1. https://github.com/kimushun1101/typst-packages にアクセスして`main`ブランチをアップデート。その後手元にgit pullする。
2. 以下のコマンドでコピーする。`typstpkgs=~/typst_ws/typst-packages`が異なれば変更する。

    ```sh
    # cd "path to typst-jp-conf-template/jaconf"
    typstpkgs=~/typst_ws/typst-packages
    pkgname=$(grep -E 'name *= *".*"' typst.toml | grep -Eo '".*"' | tr -d '"')
    pkgver=$(grep -E 'version *= *".*"' typst.toml | grep -Eo '".*"' | tr -d '"')
    pkgdir=${typstpkgs}/packages/preview/${pkgname}/${pkgver}
    mkdir -p ${pkgdir}
    rm -f lib.pdf template/main.pdf
    cp -r * ${pkgdir}
    ```

3. プルリクエストを出す。
    - [packages/jaconf-mscs:0.1.0](https://github.com/typst/packages/pull/1559)
    - [packages/jaconf-mscs:0.1.1](https://github.com/typst/packages/pull/2287)
    - [packages/jaconf:0.1.0](https://github.com/typst/packages/pull/2382)
    - [packages/jaconf:0.2.0](https://github.com/typst/packages/pull/2402)
    - [packages/jaconf:0.3.0](https://github.com/typst/packages/pull/2517)
4. `typst-jp-conf-template`は`jaconf:*.*.*`などとコミットしておきドラフトプルリクエストにしておく。
5. `packages`のプルリクエストがマージされたら、`typst-jp-conf-template`のドラフトプルリクエストもマージする。
    - [typst-jp-conf-template/Update jaconf-mscs:0.1.1](https://github.com/kimushun1101/typst-jp-conf-template/pull/18)

## 後片付け

```sh
cd
rm -rf test-typst-universe test-typst-local
```
