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

* Intel/AMD GPUを搭載したWindowsにおいて、WebRenderが有効化されるようになりました。
* 「新しいタブ」ページにPocketのおすすめが表示されるようになりました（ドイツのみ）
* macOS 10.9 (Maverics) 10.10 (Yosemite) 10.11 (El Capitan) のサポートが終了しました。

### 開発

* `<a>`および`<area>`要素で、`target="_blank"`を設定すると`rel="noopener"`が暗黙に仮定されるようになりました。

### アクセシビリティ

* JAWSスクリーンリーダの使用時に頻繁にクラッシュする問題を解決しました。
* スクリーンリーダーでSVGの`title`と`desc`要素にアクセスできるようになりました。

### ポリシー設定

* `PrimaryPassword`ポリシーで、マスターパスワードの使用を強制できるようになりました。
* `Cookies`ポリシーで、現在のセッションのみCookieを許可するドメインを指定できるようになりました。
* `Preferences`ポリシーの設定名が一部変更になりました。
  * 旧: `media.peerconnection.ice.obfuscate_host_addresses.whitelist`
  * 新: `media.peerconnection.ice.obfuscate_host_addresses.blocklist`

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

## Firefox87

* プライベートブラウジングモードおよび、スマートブロック機能によるより厳密なトラッキング保護において、Webサイトの動作が壊れる問題の発生を軽減しました。
* HTTPリファラの既定の送信ポリシーを変更し、URLのパス部分とクエリ文字列を除去した状態で送出するようにしました。
* ページ内検索で「すべて強調表示」がOKの時に、検索結果があるページ上の位置をスクロールバー上に表示するようにしました。
* シレジア語ロケールに対応しました。
* 動画再生・音声再生のUIをキーボードで操作できるようになりました。
* スクリーンリーダーがHTMLのmeta要素を読み上げるようになりました。
* アドオンマネージャの画面内で、初期フォーカス状態がより使いやすい状態に設定されるようになりました。
* ARIAのアクセシビリティ属性（aria-labeledby/describedby）の値の変更をイベントで通知するようになりました。
* Backspaceキーに対する「戻る」操作へのショートカット割り当てを廃止しました。`browser.backspace_action`を`0`にすることで、ショートカットを再度有効化できます。また、代替のショートカットとしてAlt-←（macOSではCommand-←）が使用できます。
* ライブラリーメニューから「同期タブ」「最近のハイライト」「Pocket」を削除しました。
* 「ヘルプ」メニューの内容を整理しました。
* 画像のコンテキストメニューの「画像の情報を表示」を廃止しました。
* TLSクライアント証明書を使っている組織において、`network.cors_preflight.allow_client_cert`の切り替えにより、Google Chrome互換のCORSプロトコルの取り扱いが可能になりました。
* macOSにおいて、組み込みのスクリーンリーダーであるVoiceOverに全面的に対応しました。

### ポリシー設定

* GPOやmacOSのプロファイル設定が有効な場合でも、policies.jsonが読み込まれるようになりました。競合する設定内容は、GPOやプロファイル設定の物が優先されます。

### Web開発者向けの変更

* 非標準の、テーマに関係したメディアクエリについて、以下の物がWebページからは利用できないようになりました。
  * `-moz-mac-graphite-theme`
  * `-moz-mac-lion-theme`
  * `-moz-maemo-classic`
  * `-moz-windows-classic`
  * `-moz-windows-compositor`
  * `-moz-windows-default-theme`
  * `-moz-windows-theme`
  * `-moz-scrollbar-end-backward`
  * `-moz-scrollbar-end-forward`
  * `-moz-scrollbar-start-backward`
  * `-moz-scrollbar-start-forward`
  * `-moz-scrollbar-thumb-proportional`
  * `-moz-menubar-drag`
* caption-sideの非標準の値（left, right, top-outside, bottom-outside）が廃止を前提に無効化されました。（`layout.css.caption-side-non-standard.enabled`で再度有効化できます。）


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
