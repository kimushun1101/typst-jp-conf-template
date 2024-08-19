# フォントの設定

lib.typ で設定されております．
例えば RSJ の場合は [libs/rsj-conf/lib.typ](../libs/rsj-conf/lib.typ#L5-L7) にあります．

基本的に Windows では MS フォント，Mac ではヒラギノフォントが自動的に選択されるはずです．
Linux では，フォントがインストールされておりませんので，ご自身でインストールする必要があるかもしれません．
例えば Ubuntu の場合には
```
sudo apt-get update
sudo apt-get install -y fonts-noto fonts-noto-cjk fonts-noto-cjk-extra
```
で Noto フォントがインストールできます．
ちなみに GitHub Actions で自動生成される PDF は上記の設定を [.github/workflows/gh-pages.yml](../.github/workflows/gh-pages.yml#L22-L23) で行っております．

以下，本文より引用．

> ここで，ゴシック体とは "MS PGothic", "Hiragino Kaku Gothic Pro", "IPAexGothic", "Noto Sans CJK JP" のいずれか，明朝体とは ""MS PMincho", "Hiragino Mincho Pro", "IPAexMincho", "Noto Serif CJK JP" のいずれかで見つかるものが採用されます．
> これらのフォントがお使いのコンピュータになければインストールするか，代わりに使いたいフォントがあればソースコードの方に追加してください．
> 以下のコマンドで使用可能なフォント一覧を確認できます．
>   ```sh
>   typst fonts
>   ```
