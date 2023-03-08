# チャットワークのChrome拡張機能

## TO以外のチャットをすべて一括既読

以下を入力して保存することで、TO以外のチャットをすべて既読できます

- MYID
- ACCESS_TOKEN
- CLIENT_VER

<img src="/assets/images_github/chatworker_1.png" width="250px">

## コマンドでタグの生成

内容 | ショートカット | 備考
--- | --- | ---
[info][/info]などのタグを生成 | `:info + enter` | info, code, titleに対応
[hr]のタグを生成 | `:hr + enter` |

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

ファイル選択のポップアップが表示されるので、本ソースコードの「webフォルダ」を選択して決定してください。

[![Image from Gyazo](https://i.gyazo.com/060749e80b6b4699fe4998bc96c242aa.png)](https://gyazo.com/060749e80b6b4699fe4998bc96c242aa)

以上で追加は完了です。

[![Image from Gyazo](https://i.gyazo.com/aa1406138e4a2f40af53f7018698d749.png)](https://gyazo.com/aa1406138e4a2f40af53f7018698d749)

## How to build (for Developer)

### Web Build

Build your app as an extension.

Please move to the root directory of the created app in the terminal and execute the following command.

```
% flutter build web --web-renderer html --csp
```
