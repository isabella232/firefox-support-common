# README

デモンストレーション用メタインストーラ

## 動作環境

Windows 98以降（Windows 7にて動作検証済み）

## インストール手順

### 事前準備

#### 1. インストーラの展開

1. FxDemoInstaller-source.zipをダブルクリックし、任意の場所に展開する。
2. TODO: Firefoxのインストーラの配置手順から記述する。（リポジトリの情報）

#### 2. インストーラの生成

1. 1.1で展開されたFxDemoInstaller-sourceフォルダ内のFxDemoInstaller.batを実行する。

### インストール

#### インストーラの実行

1. 2.1で生成されたFxDemoInstaller-45.0.exeをダブルクリックする。
2. 「インストールが完了しました」というダイアログが表示されたら、OKをクリックする。

#### インストールの確認

* TODO: インストール先、プロファイル保存先の情報を追加する
* デスクトップに「Mozilla Firefox Demo」というショートカットが作成されていること。
* スタートメニューに「Mozilla Firefox Demo」が追加されていること。

## アンインストール手順

### アンインストールの実行

1. コントロールパネルより、「プログラムのアンインストール」または「プログラムと機能」を選択する。
2. 「Fx Demo Installer」を選択し、アンインストールを実行する。
3. 「C:\Program Files (x86)\ClearCode Inc」フォルダが残っている場合、手動で削除する
4. 「C:\Program Files (x86)\Mozilla Firefox Demo」フォルダが残っている場合、手動で削除する
5. TODO: プロファイルの削除

### アンインストールの確認

* 「プログラムと機能」のインストール済みプログラム一覧に以下が含まれていないこと。
  * Fx Meta Installer
  * Mozilla Firefox Demo
* デスクトップに「Mozilla Firefox Demo」というショートカットが存在しないこと。
* スタートメニューに「Mozilla Firefox Demo」という項目が存在しないこと。
* TODO: プロファイルの削除

## 変更点リスト

TODO

## 通常版との比較手順

TODO
