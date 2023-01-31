# chatwork_extension

A new Flutter project.

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
