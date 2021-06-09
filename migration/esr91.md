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

## Firefox88 / 88.0.1

* Widevineプラグインの更新の影響により発生していた、動画再生の問題が解消されました。
* Gen6グラフィックチップの環境において、TwitterおよびWebRTCの動画再生の問題が解消されました。
* ハイコントラストモードにおいて、設定画面のメニュー項目の内容を読めない状態になっていた問題が解消されました。
* PDFプレビューが、JavaScriptが埋め込まれたフォームに対応しました。
* 印刷時の余白の単位が言語ごとにローカライズされるようになりました。
* Webサイトをまたいだプライバシー情報の漏洩を防ぐため、JavaScriptでのwindow.nameが、Webサイトをまたいだ遷移で自動消去されるようになりました。
* スクリーンリーダーにおいて、視覚的に非表示になっているコンテンツ（Google Helpのパネルなど）が読み上げられてしまわないようになりました。
* マイクとカメラへのアクセスの許可について、ユーザーがそのWebサイトの同じタブで同じ機器の許可を50秒以内に与えていた場合、再度の許可を求めないようになりました。
* 「スクリーンショット」機能がアドレスバーのページアクションメニューから削除されました。スクリーンショットを取得するためには、ページ上の右クリックメニューを使うか、ツールバーカスタマイズでツールバー上にボタンを配置する必要があります。
* FTPへの対応が、Firefox 90での機能廃止を前提に、無効化されました。（`network.ftp.enabled`で有効化できます。
* Linuxにおいて、タッチパッドでのピンチイン・ピンチアウトでのズーム操作がよりスムーズになりました。

### ポリシー設定

* ShowHomeButton が追加され、ホームボタンの初期状態での表示を制御できるようになりました。
* UserMessaging に SkipOnboarding オプションが追加されました。trueに設定する事で、新しいタブのページでの「ようこそ」のメッセージが抑制されます。

### Web開発者向けの変更

* macOSにおいて、フォント種別monospaceに対する既定のフォントがMenioに変更されました。
* 非標準の `-moz-outline-radius` プロパティが廃止されました。
* 非標準の`:-moz-sumbit-invalid` 疑似クラスが、廃止を前提に無効化されました。
* 非標準の`:-moz-ui-invalid`と`:-moz-ui-valid`に対するスタイル付けが行われなくなりました。
* FTP廃止に備えて、代替手段としてFTPを処理するアドオンを作成できるようになりました。

## Firefox89

* 外観（テーマ）が変更されました。
  * タッチ操作を前提に、UI要素間の余白が全体的に増加しました。
  * メニュー項目のラベル、並び順などが部分的に変化しました。
* プライベートブラウジングモードにおいて、クロスサイトCookieを初期状態でブロックするようになりました。
* Webページのフォームコントロールの実装が刷新され、ユーザー体験とページ読み込み速度が向上しました。
* 「スクリーンショット」機能がページ上の右クリックでのコンテキストメニューから使用できるようになりました。また、ツールバーボタンを任意の位置に配置できるようになりました。
* PDFファイルのプレビュー時に署名が表示されるようになりました。

### Windows以外のプラットフォームでの変更

* macOSにおいて、ページ終端までスクロールした場合に跳ね返る動作（バウンス動作）が実装されました。
* macOSにおいて、トラックパッドを二本指でダブルタップするか、マジックマウスを1本指でダブルタップしると、当該要素にフォーカスするようにズームします。
* macOSにおいて、ページ内のコンテキストメニューがOSネイティブの外観になり、Darkモードに対応しました。
* macOSにおいて、画像表示の際の色再現性が向上しました。
* macOSにおいて、フルスクリーンモードでマウスを画面最上部に移動した際に、システムのメニューバーが表示されても、タブがその下に隠れないようになりました。
* macOSにおいて、フルスクリーンモードでツールバーを非表示にしてより高い没入感を得られる世になりました。（Windows、Linuxの動作と同様になりました。）
* Linuxにおいて、すべてのデスクトップ環境でWebRenderが有効化されました。

### ポリシー設定

* `DisablePasswordReveal` ポリシーが使われている場合に、パスワードマネージャで新しいログイン情報を保存できない不具合が解消されました。
* `AllowedDomainsForApps` ポリシーが追加されました。Google Workspaceにアクセスすることを許可するドメインをカンマ区切りの文字列で指定できます。（同名のChromeのポリシーを実装したもの）
* `ExtensionSettings` ポリシーの機能が強化され、個々の拡張機能の自動更新を `updates_disabled` で無効化できるようになりました。
* `Preferences` ポリシーで、`gfx.`および`layers.`から始まる名前の設定を制御できるようになりました。

### Web開発者・アドオン開発者向けの変更

* DeviceProximityEvent、UserProximityEvent、DeviceLightEventが廃止されました。
* ブラウザーの外観の変更に伴い、テーマの配色のうち `tab_background_separator` と `toolbar_field_separator` の情報が利用されなくなりました。
* ブラウザーの外観の変更に伴い、アドレスバー右端の「...」ボタン配下の項目をピン留めする機能が廃止されました。また、`page_action`の`pinned`属性が無視されるようになりました。
* `page_action`で追加された項目に対する「アドレスバーから削除」操作が廃止されました。


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
