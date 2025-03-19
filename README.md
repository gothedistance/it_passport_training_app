# it_passport_training_app
ITパスポートの問題を解いて学習するサンプルアプリ


## Flutter 環境構築

下記のIDEの最新バージョンをインストールしてください。
- Visual Studio Code
- Android Studio
- XCode

## レポジトリをCloneする方法
- https経由とSSH経由というのがありまして・・・・
- git clone git@github.com:gothedistance/it_passport_training_app.git

### asdf のセットアップ

プロジェクト単位で Flutter のバージョンを切り替えられるようにしたいので、[asdf](https://asdf-vm.com)というライブラリを使います。

```bash
$ brew install asdf
$ echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
$ asdf # コマンドが認識できたらOK
```

以上で、asdf のインストールは完了です。

### .tool-versions ファイルについて

プロジェクトのルートフォルダに、`.tool-versions` というファイルがあります。これは、`asdf`でインストールする内容をまとめたもので、プロジェクト単位任意のバージョンを指定できます。

この時、メンバー間でSDKのバージョンを揃えるための工夫が必要です。SDKのパスを参照する時にシンボリックリンクを使うというものです。
`asdf`が ユーザーのホームディレクトリに各種SDKをインストールするため、VSCodeで`dart.flutterSDKPath`を書く時に各ユーザーの名前がパスに入ると共有できないため。

詳しくはこちらを見て下さい。
https://zenn.dev/k9i/articles/0c169499f15b0c

また、`flutter_sdk`配下をコード解析の対象にするとVS CodeのPROBLEMSが大変なことになるので、`analysis_options.yaml`に`exclude` するように追記しています。

以上で、Flutter のセットアップは完了です。
