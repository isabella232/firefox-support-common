---
title:     Firefox ESR78からESR91の変更点
author:    株式会社クリアコード
date:      2021年7月13日
toc-title: 目次
---

# Firefox ESR91のリリーススケジュール

[Mozillaのリリースカレンダー](https://wiki.mozilla.org/RapidRelease/Calendar)では、Firefox ESR91のリリース予定は以下の通り記載されています。

|リリース日     |通常版リリースバージョン|ESR版リリースバージョン|備考               |
|---------------|------------------------|-----------------------|-------------------|
| 2021年7月13日 | Firefox 90             | 78.12                 |                   |
| 2021年8月10日 | Firefox 91             | 78.13/91.0            |                   |
| 2021年9月7日  | Firefox 92             | 78.14/91.1            |                   |
| 2021年10月5日 | Firefox 93             | 78.15/91.2            |78ESRのサポート終了|

* Firefox 78ESRのサポートは、2021年10月5日で終了します（以後はセキュリティ更新が提供されません）。
* 日付は太平洋標準時 (UTC-0800) 基準のため、日本時間では表記の日付の約1日後がリリース日となります。
* なお、リリーススケジュールは予告なく変更される可能性があります。

## Firefox 79

* WebRenderのロールアウト対象の環境が拡大しました。
* ポリシーで特定のドメインのみCookieの使用を許可できるようになりました。
* ポリシーでマスターパスワードの使用を必須にできるようになりました。
* macOS 10.9 (Maverics) 10.10 (Yosemite) 10.11 (El Capitan) のサポートが終了しました。

## Firefox 80

* FirefoxをWindowsのPDFアプリとして設定できるようになりました。
  ![](esr91/default-app-pdf.png)
* HTTPSからHTTPにフォーム投稿した時の警告を抑止できるようになりました。
  ![](esr91/insecure-form.png)
* ポリシーでバーチャルリアリティの許可通知を制御できるようになりました。

## Firefox 81

* キーボードやヘッドセットで動画を再生・停止できるようになりました。
* FIrefoxの標準テーマに「Firefox AlpenGlow」が追加されました。
  ![](esr91/alpenglow.png)
* クレジットカード情報の自動記入をサポートしました（アメリカのみ）
* `.xml`、`.svg`、`.webp` (ウェッピー) ファイルを表示できるようになりました。
* Windowsの`.lnk`ショートカットをサポートしました。
* ポリシーによる`about:config`の設定が拡大されました（`Preferences`ポリシーを利用中の場合は移行が必要です）
* Microsoft IntuneでMSIをインストールできない不具合が修正されました。

## リンク

### リリースノート

* [Firefox 79.0](https://www.mozilla.org/en-US/firefox/79.0/releasenotes/)
* [Firefox 80.0](https://www.mozilla.org/en-US/firefox/80.0/releasenotes/)
  * [Firefox 80.0.1](https://www.mozilla.org/en-US/firefox/80.0.1/releasenotes/)
* [Firefox 81.0](https://www.mozilla.org/en-US/firefox/81.0/releasenotes/)
  * [Firefox 81.0.1](https://www.mozilla.org/en-US/firefox/81.0.1/releasenotes/)
  * [Firefox 81.0.2](https://www.mozilla.org/en-US/firefox/81.0.2/releasenotes/)
* [Firefox 82.0](https://www.mozilla.org/en-US/firefox/82.0/releasenotes/)
  * [Firefox 82.0.1](https://www.mozilla.org/en-US/firefox/82.0.1/releasenotes/)
  * [Firefox 82.0.2](https://www.mozilla.org/en-US/firefox/82.0.2/releasenotes/)
  * [Firefox 82.0.3](https://www.mozilla.org/en-US/firefox/82.0.3/releasenotes/)
* [Firefox 83.0](https://www.mozilla.org/en-US/firefox/83.0/releasenotes/)
* [Firefox 84.0](https://www.mozilla.org/en-US/firefox/84.0/releasenotes/)
  * [Firefox 84.0.1](https://www.mozilla.org/en-US/firefox/84.0.1/releasenotes/)
  * [Firefox 84.0.2](https://www.mozilla.org/en-US/firefox/84.0.2/releasenotes/)
* [Firefox 85.0](https://www.mozilla.org/en-US/firefox/85.0/releasenotes/)
  * [Firefox 85.0.1](https://www.mozilla.org/en-US/firefox/85.0.1/releasenotes/)
  * [Firefox 85.0.2](https://www.mozilla.org/en-US/firefox/85.0.2/releasenotes/)
* [Firefox 86.0](https://www.mozilla.org/en-US/firefox/86.0/releasenotes/)
  * [Firefox 86.0.1](https://www.mozilla.org/en-US/firefox/86.0.1/releasenotes/)
* [Firefox 87.0](https://www.mozilla.org/en-US/firefox/87.0/releasenotes/)
* [Firefox 88.0](https://www.mozilla.org/en-US/firefox/88.0/releasenotes/)
  * [Firefox 88.0.1](https://www.mozilla.org/en-US/firefox/88.0.1/releasenotes/)
* [Firefox 89.0](https://www.mozilla.org/en-US/firefox/89.0/releasenotes/)

### その他

* [OS X 10.9/10.10/10.11 サポート終了](https://support.mozilla.org/en-US/kb/firefox-mac-osx-users-esr)
