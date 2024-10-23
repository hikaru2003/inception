# コンテナ

* ホストマシン上の隔離された領域のこと
* イメージから作成される
* 複数のコンテナは互いに独立している、干渉しない
* DockerのCLIやAPIを使って、生成・起動・停止をすることができる

# イメージ

* コンテナの実行に必要なパッケージ
* ファイルやメタ情報を集めたもの

# Dockerfile

* 既存のイメージにレイヤを重ねるためのテキストファイル
* 既存のイメージでは、足りないコマンドやインストールされていないコマンドを追加できる

# compose

* Yamlファイルを書くことで、複数のコンテナをまとめて起動するためのコマンド

# 基本の動かし方

1. イメージを作成する

```
docker image build
```

2. イメージからコンテナを起動する

```
docker container run [option] <image> [command]
```

3. コンテナを操作する

```
docker container exec
```

## コマンド一覧

```
# コンテナ一覧を確認
docker container ls

# コンテナを停止
docker container stop [option] <container>

# コンテナを削除
docker container rm 
```