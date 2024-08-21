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
BIZ UD フォントのインストールは
```
# Install BIZUDGothic
curl -L https://github.com/googlefonts/morisawa-biz-ud-gothic/releases/latest/download/morisawa-biz-ud-gothic-fonts.zip -o morisawa-biz-ud-gothic-fonts.zip
unzip morisawa-biz-ud-gothic-fonts.zip
sudo mkdir /usr/local/share/fonts/BIZUDGothic
sudo mv morisawa-biz-ud-gothic-fonts/fonts/ttf/*.ttf /usr/local/share/fonts/BIZUDGothic/
rm -rf morisawa-biz-ud-gothic-fonts*

# Install BIZUDMincho
curl -L https://github.com/googlefonts/morisawa-biz-ud-mincho/releases/latest/download/morisawa-biz-ud-mincho-fonts.zip -o morisawa-biz-ud-mincho-fonts.zip
unzip morisawa-biz-ud-mincho-fonts.zip
sudo mkdir /usr/local/share/fonts/BIZUDMincho
sudo mv morisawa-biz-ud-mincho-fonts/fonts/ttf/*.ttf /usr/local/share/fonts/BIZUDMincho/
rm -rf morisawa-biz-ud-mincho-fonts*

# Update fonts cache
fc-cache -vf
```



ちなみに GitHub Actions で自動生成される PDF は上記の設定を [.github/workflows/gh-pages.yml](../.github/workflows/gh-pages.yml#L22-L23) で行っております．

以下，本文より引用．

> ここで，ゴシック体とは "MS PGothic", "Hiragino Kaku Gothic Pro", "IPAexGothic", "Noto Sans CJK JP" のいずれか，明朝体とは ""MS PMincho", "Hiragino Mincho Pro", "IPAexMincho", "Noto Serif CJK JP" のいずれかで見つかるものが採用されます．
> これらのフォントがお使いのコンピュータになければインストールするか，代わりに使いたいフォントがあればソースコードの方に追加してください．
> 以下のコマンドで使用可能なフォント一覧を確認できます．
>   ```sh
>   typst fonts
>   ```

## フォント選定の理由

1. できるだけデフォルトで入っている
2. 入っていない場合にはインストールが簡単
3. プロポーショナルフォントが望ましい
4. どの OS でも外観を似せたい
