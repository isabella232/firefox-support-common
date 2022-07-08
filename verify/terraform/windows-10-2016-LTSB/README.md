Azure検証環境構築
=================

## はじめに

このフォルダのリソースを使うことで、検証環境を自動的にAzure環境に作成することができる。

この環境の構築にはTerraformとAnsibleを利用している。

## 1. Terraformをインストールする

公式サイトからTerraformをダウンロードする。

    $ wget https://releases.hashicorp.com/terraform/1.2.4/terraform_1.2.4_linux_amd64.zip
    $ wget https://releases.hashicorp.com/terraform/1.2.4/terraform_1.2.4_SHA256SUMS
    $ wget https://releases.hashicorp.com/terraform/1.2.4/terraform_1.2.4_SHA256SUMS.sig

GPGで署名を検証する。

    $ gpg --recv-key 72D7468F
    $ gpg --verify terraform_1.2.4_SHA256SUMS.sig

ファイルの整合性をチェックする。

    $ sha256sum --ignore-missing --c terraform_1.2.4_SHA256SUMS

バイナリを展開して、パスを通った所に移動する。

    $ unzip terraform_1.2.4_linux_amd64.zip
    $ mv terraform /usr/local/bin

## 2. Ansibleをインストールする

まずはPythonのパッケージマネージャ (pip) を使えるようにしておく。

    $ sudo apt install python-pip

その上で、Ansibleをインストールする。

    $ pip install --user ansible
    $ pip install --user paramiko
    $ pip install --user pywinrm

実行ファイルにパスを通しておく。

    $ export PATH=$PATH:~/.local/bin/

## 3. Azureで作業用の認証情報を作成する

https://portal.azure.com/#home にアクセスして、右上のメニューバーから
「Cloud Shell」を選択する。

サブスクリプションIDを取得して環境変数に代入する。

    (azure) % az account list | grep id
    (azure) % export SUBSCRIPTION_ID="..." # id

作業用の認証情報を作成する。

    (azure) $ az ad sp create-for-rbac --role="Contributor" \
                       --scopes="/subscriptions/${SUBSCRIPTION_ID}"

JSONが返却されるので、対応する値を手元のenv.shに埋める。

    export ARM_SUBSCRIPTION_ID=""  # SUBSCRIPTION_ID
    export ARM_CLIENT_ID=".."      # appId
    export ARM_CLIENT_SECRET=""    # password
    export ARM_TENANT_ID=""        # tennant

手元のシェルで環境変数として読み込んでおく。

    $ source env.sh

## 4. Terraformで実際に環境を作成する

ここまで準備ができたら、手元でmakeを実行すればよい。

    $ make

## 5. 環境を削除する

次のコマンドで環境を削除できる。

    $ make destroy

たまに失敗するので、その時は手でリソースグループを削除する。
