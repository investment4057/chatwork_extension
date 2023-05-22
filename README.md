# チャットワークのChrome拡張機能

## はじめに

本アプリのご使用によって、以下の内容に同意していただいたものとみなします。

正式にストアにリリースしているわけではありませんので、ご使用は自己責任でお願いいたします。

本アプリがユーザーの特定の目的に適合すること、期待する機能・商品的価値・正確性・有用性を有すること、および不具合が生じないことについて、何ら保証するものではありません。

当方の都合によりアプリの仕様を変更できます。

私たちは、本アプリの提供の終了、変更、または利用不能、本アプリの利用によるデータの消失または機械の故障もしくは損傷、その他本アプリに関してユーザーが被った損害につき、賠償する責任を一切負わないものとします。

## TO以外のチャットをすべて一括既読

以下を入力して保存することで、TO以外のチャットをすべて既読できます

- MYID
- ACCESS_TOKEN
- CLIENT_VER

[![Image from Gyazo](https://i.gyazo.com/19da361c0a5edf0f5c0b6a1ea999643b.png)](https://gyazo.com/19da361c0a5edf0f5c0b6a1ea999643b)

※チャットワーク上で右クリック → ページのソースを表示 → 以下の赤枠部分をコピペしてください。

[![Image from Gyazo](https://i.gyazo.com/636aa2e13c15f397d626380b746d534c.png)](https://gyazo.com/636aa2e13c15f397d626380b746d534c)

~~## コマンドでタグの生成~~

内容 | ショートカット | 備考
--- | --- | ---
~~[info][/info]などのタグを生成~~ | ~~`:info + enter`~~ | ~~info, code, titleに対応~~
~~[hr]のタグを生成~~ | ~~`:hr + enter`~~ |

<!-- [![Image from Gyazo](https://i.gyazo.com/b49ee42598972dfe6e1b2b99da32e46f.gif)](https://gyazo.com/b49ee42598972dfe6e1b2b99da32e46f) -->

## 拡張機能の導入方法

本アプリをChromeの拡張機能へ追加する方法です。

Chromeを開き、アドレスバーに以下を入力してEnterしてください。

※右上の3つのドット → 設定 → 拡張機能でも同様のページが開きます。

```
chrome://extensions/
```

拡張機能のページが開いたら、右上のデベロッパーモードをオンにします。

[![Image from Gyazo](https://i.gyazo.com/56adfe8f1fa3a84f23521b748e806536.png)](https://gyazo.com/56adfe8f1fa3a84f23521b748e806536)

オンにすると、拡張機能の検索バーの下に、3つボタンが表示されます。

その中の「パッケージ化されていない拡張機能を読み込む」をクリックください。

[![Image from Gyazo](https://i.gyazo.com/81ace0142c95c933a77a35f46369df5a.png)](https://gyazo.com/81ace0142c95c933a77a35f46369df5a)

ファイル選択のポップアップが表示されるので、本ソースコードの「buildフォルダ」内にある「webフォルダ」を選択して決定してください。

[![Image from Gyazo](https://i.gyazo.com/cb61b0495627608f70f2fc802361235f.png)](https://gyazo.com/cb61b0495627608f70f2fc802361235f)

以上で追加は完了です。

[![Image from Gyazo](https://i.gyazo.com/aa1406138e4a2f40af53f7018698d749.png)](https://gyazo.com/aa1406138e4a2f40af53f7018698d749)

また、拡張機能のピンマークをクリックしておくと、ブラウザに常時表示されるようになり、表示されたアイコンをクリックするとアプリが起動します。

[![Image from Gyazo](https://i.gyazo.com/a69e41582c4871f48f4d481681ea32fb.png)](https://gyazo.com/a69e41582c4871f48f4d481681ea32fb)

## How to build (for Developer)

### Web Build

Build your app as an extension.

Please move to the root directory of the created app in the terminal and execute the following command.

```
% flutter build web --web-renderer html --csp
```
