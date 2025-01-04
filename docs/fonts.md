# フォントの設定

[テンプレート関数の引数](../main.typ#L16-L18)で渡すことができます。

基本的にWindowsではMSフォント、Macではヒラギノフォントが標準でインストールされているはずです。
それらに変更していただいても問題ありません。
Linuxでは、ご自身でインストールする必要があるかもしれません。
たとえばUbuntuの場合には

```sh
sudo apt-get update
sudo apt-get install -y fonts-noto fonts-noto-cjk fonts-noto-cjk-extra
```

でNotoフォントがインストールできます。
BIZ UDフォントのインストールは以下で行えます。

```sh
# Install BIZUDGothic
curl -L https://github.com/googlefonts/morisawa-biz-ud-gothic/releases/latest/download/BIZUDGothic.zip -o BIZUDGothic.zip
sudo unzip BIZUDGothic.zip -d /usr/local/share/fonts/BIZUDGothic/
rm -rf BIZUDGothic.zip

# Install BIZUDMincho
curl -L https://github.com/googlefonts/morisawa-biz-ud-mincho/releases/latest/download/morisawa-biz-ud-mincho-fonts.zip -o morisawa-biz-ud-mincho-fonts.zip
unzip morisawa-biz-ud-mincho-fonts.zip
sudo mkdir -p /usr/local/share/fonts/BIZUDMincho
sudo mv morisawa-biz-ud-mincho-fonts/fonts/ttf/*.ttf /usr/local/share/fonts/BIZUDMincho/
rm -rf morisawa-biz-ud-mincho-fonts*

# Update fonts cache
fc-cache -vf
```

ちなみにGitHub Actionsで自動生成されるPDFは上記の設定を [.github/workflows/gh-pages.yml](../.github/workflows/gh-pages.yml#L22-L23) で行っております。

## フォント選定の考え方

1. できるだけデフォルトで入っている
2. 入っていない場合にはインストールが簡単
3. プロポーショナルフォントが望ましい
4. どのOSでも外観を似せたい
