# trykernel_devenv

このリポジトリは[Interface 2023年7月号](https://interface.cqpub.co.jp/magazine/202307/)のRTOS「Try Kernel」開発環境構築の補助を目的とした，非公式のリポジトリです．

このリポジトリは，VSCodeの[Devcontainer](https://code.visualstudio.com/docs/devcontainers/containers)を使用した開発を前提としています．

また，このリポジトリはホストOSとしてLinuxを想定しており，Ubuntu 22.04でのみ動作検証しています．

## 使い方
[こちらの記事](https://satumaimo-10.hatenablog.com/entry/2023/08/11/211126)の「Devcontainerを用いた環境構築の半自動化」をご参照ください．

## ライセンス
本リポジトリはMITライセンスの下配布しています．

ただし，下記ファイルは[pico-examples](https://github.com/raspberrypi/pico-examples)から流用しているため，BSD 3-Clauseライセンスが継承されます．
```
workspace/.vscode/launch.json
workspace/.vscode/settings.json
```

## その他
本リポジトリに関して問題がありましたら，Issuesへ投稿いただくか，[satumaimo](https://twitter.com/Satumaimo_10)までご一報ください．
