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
[info][/info]などのタグを生成 | `:info + enter` | info, code, title, hrに対応

## How to build

### Web Build

Build your app as an extension.

Please move to the root directory of the created app in the terminal and execute the following command.

```
% flutter build web --web-renderer html --csp
```

### Adding to Chrome Extensions

```
chrome://extensions/
```

When the extension page opens, turn on developer mode in the top right.

Press "Load unpackaged extension" and select the web folder in the build directory of your Flutter project.

You have finished adding the extension.
