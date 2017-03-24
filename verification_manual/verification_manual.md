% Firefoxカスタマイズ内容の検証手順
% 株式会社クリアコード
% 20XX年X月X日

<!--======================================================================-->

# はじめに

対象のFirefoxのバージョンは{{firefox_version}}とする。

検証環境は{{windows_version}}とする。

参照する設定資料は{{configuration_sheet_name}}とする。

<!--======================================================================-->

# 新規インストールに関するカスタマイズ

## メタインストーラを使用した、新規インストールの手順

- メタインストーラの名称は{{meta_installer_name}}、ファイル名は{{meta_installer_file_name}}とする。 
- メタインストーラの表示バージョンは{{meta_installer_version}}とする。 
- Firefoxのインストール先は{{install_path}}とする。 
- デスクトップのショートカットは{{desktop_shortcut_path}} に作成するものとする。 
- スタートメニューのショートカットは{{start_menu_shortcut_path}}に作成するものとする。 

### 確認する項目

- Install-1-\* 
- Install-2-\* 
- Install-3-\* 
- Install-4-\* 
- Install-5-\* 
- Install-6-\* 
- Install-7-\* 
- Install-8-\* 
- Install-9-2 
- Install-11-\* 
- Application-1-\* 
- Application-2-\* 
- Application-3-\* 
- Admin-1-\* 
- Update-4-\* 

### 準備

1. コントロールパネル→プログラムと機能で以下がインストールされているならばアンインストールする。  
    1. {{meta_installer_name}} 
    2. Mozilla Firefox  
    3. Mozilla Maintenance Service  
2. 以下のファイル、フォルダを削除する。
    1. {{install_path}} 
    2. C:\\Program Files (x86)\\ClearCode Inc  
    3. Firefoxのユーザープロファイル（%AppData%\\Mozilla） 
    4. Firefoxのテンポラリファイルおよびキャッシュファイル（%LocalAppData%\\Mozilla） 

### 検証

1. メタインストーラ作成キット一式を用意する。
    - 確認項目 
        1. メタインストーラ作成キット一式の格納フォルダ名が「{{meta_installer_file_name}}-source」である。(Install-2-\*) 
2. 不要なファイルを削除する。
    - {{meta_installer_file_name}}\*.exe
3. fainstall.iniを開き、検証環境に合わせて内容を修正する。 
    - フルパスが指定されている箇所で当該パスのドライブが存在しない場合、検証用としてファイル中の「（ドライブレター）:/」の指定をすべて「C:/（ドライブレター）/」に置換する。\
      以下、ファイルの作成先はすべて置換後のパスで読み替える。 
4. {{meta_installer_file_name}}.batを実行する。
    - 確認項目
        1. {{meta_installer_file_name}}.exeが作成される。(Install-9-1)\
           または、{{meta_installer_file_name}}-{{meta_installer_version}}.exeが作成される。(Install-9-2) 
5. 作成された{{meta_installer_file_name}}\*.exeを実行する。
    - 確認項目
        1. メタインストーラの圧縮ファイルを展開する様子を示すダイアログが表示される。 
        2. メタインストーラのウィザードが表示される。(Install-3-2)(Install-6-\*)\
            または、ウィザードが表示されない。(Install-3-3) 
        3. インストール完了後に「{{finish_title}}」のタイトルで「{{finish_message}}」のメッセージが表示される。(Install-4-2)\
            または、メッセージが表示されない。(Install-4-1)
        4. インストール完了後に「{{restart_title}}」のタイトルで「{{restart_message}}」のメッセージが表示される。(Install-5-2)\
            または、メッセージが表示されない。(Install-5-1)

6. インストールされた環境が想定通りか確認する。
    - 確認項目
        1. 以下のファイル、フォルダが存在する。
            1. {{install_path}}\\firefox.exe (Install-8-\*) 
            2. {{install_path}}\\{{mcd_local_file}} (Admin-1-\*) 
            3. {{desktop_shortcut_path}} (Application-1-1/3) 
            4. {{start_menu_shortcut_path}} (Application-2-1/3) 
        2. 以下のファイル、フォルダが存在しない。
            1. {{desktop_shortcut_path}} (Application-1-2) 
            2. {{start_menu_shortcut_path}} (Application-2-2) 
        3. Windows Vista以前のクイック起動バーにMozilla Firefoxのショートカットが表示されている。(Application-3-1)\
            またはショートカットが表示されていない。(Application-3-2) 
        3. Windows Vista以降のタスクバーにMozilla Firefoxのショートカットが表示されている。(Install-11-1)\
            またはショートカットが表示されていない。(Install-11-2) 
        4. コントロールパネル→プログラムと機能で、以下の通りとなっている。 
            1. 「Mozilla Firefox {{firefox_version}}」がインストールされている。（ベータ版を用いた検証の場合、バージョン表記は「beta」を除いた数字が期待される。）(Install-7-\*) 
            2. 「{{meta_installer_name}}」がインストールされている。(Install-1-\*) 
            3. 「{{meta_installer_name}}」のバージョンが「{{meta_installer_version}}」と表示されている。(Install-9-2) 
            4. 「Mozilla Maintenance Service」がインストールされている。(Update-4-1)\
                または、インストールされていない。(Update-4-2) 

## 専用ユーザープロファイルの作成と使用

- 専用ユーザープロファイルの作成先は{{special_profile_path}}とする。 
- 専用ユーザープロファイルの名前は{{special_profile_name}}とする。 

### 確認する項目

- Application-1-3 
- Application-2-3 
- Application-6-2 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. Windowsエクスプローラ（フォルダウィンドウ）を開き、ロケーションバーに「{{special_profile_path}}」と入力してEnterを押す。 
    - 確認項目
        1. 「{{special_profile_name}}」フォルダが存在する。(Application-6-2) 
        2. フォルダの内容は空である。(Application-6-2) 
2. {{desktop_shortcut_path}}のプロパティを開く。 
    - 確認項目 
        1. 作業フォルダが「"（Firefoxの実行ファイルがあるフォルダパス）"」である。(Application-1-3) 
        2. 「リンク先」末尾に「-profile {{special_profile_path}}\\{{special_profile_name}}」というオプションが指定されている。（環境変数の参照記法がそのまま含まれている）(Application-1-3) 
3. {{start_menu_shortcut_path}}のプロパティを開く。 
    - 確認項目 
        1. 作業フォルダが「"（Firefoxの実行ファイルがあるフォルダパス）"」である。(Application-2-3) 
        2. 「リンク先」末尾に「-profile {{special_profile_path}}\\{{special_profile_name}}」というオプションが指定されている。（環境変数の参照記法がそのまま含まれている）(Application-2-3) 
4. Windowsエクスプローラ（フォルダウィンドウ）を開き、ロケーションバーに「{{special_profile_path}}\\{{special_profile_name}}」と入力してEnterを押す。 
5. {{desktop_shortcut_path}}をダブルクリックし、Firefoxを起動する。 
    - 確認項目 
        1. Firefoxの起動後、4で開いたフォルダに「prefs.js」などのファイルが作成される。 
 
## 旧バージョンとの共存

### 確認する項目

- Install-1-2 
- Install-2-2 
- Application-1-3 
- Application-2-3 
- Application-6-\* 

### 準備

1. コントロールパネル→プログラムと機能 で以下がインストールされているならばアンインストールする。  
    1. {{meta_installer_name}} 
    2. 旧バージョンのメタインストーラ 
    3. Mozilla Firefox  
    4. Mozilla Maintenance Service  
2. 以下のファイル、フォルダを削除する。
    1. {{install_path}} 
    2. 旧バージョンのメタインストーラによってインストールされたFirefox 
    3. C:\\Program Files (x86)\\ClearCode Inc  
    4. Firefoxのユーザープロファイル（%AppData%\\Mozilla） 
    5. Firefoxのテンポラリファイルおよびキャッシュファイル（%LocalAppData%\\Mozilla） 
    6. スタートメニューに登録されたショートカット（%AppData%\\Microsoft\\Internet Explorer\\Quick Launch\\User Pinned\\StartMenu\\ 内に作られたショートカット） 
3. 旧バージョン、新バージョンの各メタインストーラ作成キット内のバッチファイルを実行し、インストーラの実行ファイルを作成しておく。 

### 検証

1. 旧バージョンのメタインストーラを実行する。 
2. {{desktop_shortcut_path}}をダブルクリックし、Firefoxを起動する。 
3. パネルメニューを開き、パネルメニュー内の「？」をクリックして、サブメニューから「Firefoxについて」を選択する。 
    - 確認項目 
        1. Firefoxのバージョンが旧バージョンのメタインストーラに同梱されたバージョンであると表示される。 
4. ユーザが変更可能な何らかの設定を変更する。 
    - 例： 
        1. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
        2. オプション画面の「検索」を開く。 
        3. 「既定の検索エンジン」を「Google」から「Yahoo！JAPAN」に変更する。 
5. Firefoxを終了する。 
6. 旧バージョン起動用のショートカットをスタートメニューのよく使うアプリケーション一覧の上にドラッグし、「スタート メニューに表示する」の表示が出たらドロップする。(Application-1-3)(Application-2-3) 
    - 確認項目 
        1. スタートメニュー最上部に、ボーダーラインで区切られた状態で旧バージョン起動用のショートカットが表示される。 
        2. 追加されたショートカットを右クリックして「プロパティ」を選択して開かれたショートカットのプロパティにおいて、ショートカットのリンク先が旧バージョンの実行ファイルの位置である。 
7. 新バージョンのメタインストーラを実行する。 
    - 確認項目
        1. 以下のファイル、フォルダが存在する。
            1. （旧バージョンのFirefoxのインストール先）\\firefox.exe 
            2. （旧バージョンのFirefoxのインストール先）\\{{mcd_local_file}} 
            3. {{install_path}}\\firefox.exe(Install-1-2)(Install-2-2) 
            4. {{install_path}}\\{{mcd_local_file}}(Install-1-2)(Install-2-2) 
8. {{desktop_shortcut_path}}をダブルクリックし、Firefoxを起動する。 
9. パネルメニューを開き、パネルメニュー内の「？」をクリックして、サブメニューから「Firefoxについて」を選択する。 
    - 確認項目 
        1. Firefoxのバージョンが{{firefox_version}}であると表示される。(Install-1-2)(Install-2-2) 
10. 旧バージョンで設定した設定が維持されている。(Application-1-3)(Application-2-3)(Application-6-1)または、設定が初期状態になっている。
    (Application-1-3)(Application-2-3)(Application-6-2) 
    - 例： 
        1. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
        2. オプション画面の「検索」を開く。 
        3. 「既定の検索エンジン」として「Google」が選択されている。(Application-6-1)または「Yahoo！JAPAN」が選択されている。(Application-6-2) 
11. Firefoxを終了する。 
12. スタートメニュー最上部に、ボーダーラインで区切られた状態で存在しているショートカットを右クリックして「プロパティ」を選択し、ショートカットのプロパティを開く。 
    - 確認項目 
        1. ショートカットのリンク先が新バージョンの実行ファイルの位置である。(Application-1-3)(Application-2-3) 
13. 旧バージョンのメタインストーラを実行する。 
    - 確認項目
        1. 以下のファイル、フォルダが存在する。
            1. （旧バージョンのFirefoxのインストール先）\\firefox.exe 
            2. （旧バージョンのFirefoxのインストール先）\\{{mcd_local_file}} 
            3. {{install_path}}\\firefox.exe(Install-1-2)(Install-2-2) 
            4. {{install_path}}\\{{mcd_local_file}}(Install-1-2)(Install-2-2) 
14. {{desktop_shortcut_path}}をダブルクリックし、Firefoxを起動する。 
15. パネルメニューを開き、パネルメニュー内の「？」をクリックして、サブメニューから「Firefoxについて」を選択する。 
    - 確認項目 
        1. Firefoxのバージョンが旧バージョンのメタインストーラに同梱されたバージョンであると表示される。 
16. 旧バージョンで設定した設定が維持されている。(Application-1-3)(Application-2-3)(Application-6-\*) 
    - 例： 
        1. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
        2. オプション画面の「検索」を開く。 
        3. 「既定の検索エンジン」として「Yahoo！JAPAN」が選択されている。(Application-6-\*)

<!--======================================================================-->

# 起動時の状態に関するカスタマイズ

## 起動時の状態の制御

### 確認する項目

- Admin-2-\* 
- Admin-3-\* 
- Admin-4-1 
- Startup-1-\* 
- Startup-2-\* 
- Startup-3-\* 
- Startup-4-2 
- Startup-5-2 
- Startup-6-\* 
- Startup-7-\* 
- Startup-8-\* 
- Update-4-2

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. Firefoxのユーザープロファイル（{{special_profile_path}}）を削除する。 
3. 以下のアドオンを無効化する。 
    1. Disable about:config 
    2. globalChrome.css 
4. 他に導入対象のアドオンがない場合、「Disable Sync」を管理者権限でインストールするよう配置しておく。
   （ファイル「disablesync@clear-code.com.xpi」を「browser/extensions/」の位置に置く。）
5. システムの規定のブラウザを別のブラウザに設定する。

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。 
    - 確認項目
        1. Firefoxが起動した時に「設定移行ウィザード」が表示される。(Startup-1-1)\
           または、表示されない。(Startup-1-2) 
        2. Firefoxを既定のブラウザにするか尋ねられる。(Startup-3-1)\
            または、尋ねられない。(Startup-3-2) 
        3. Firefox既定のホーム画面が表示される。(Startup-2-1)\
            または、{{home_page}}が表示される。
            (Startup-2-2/3) 
        4. 導入対象のアドオンが無効化されている。(Admin-2-1)(Admin-4-1)\
           または、有効化され機能している。(Admin-2-2)(Admin-4-1)
2. ホームページのタブとして既定のホームページ（about:home）が開かれていない場合、ロケーションバーに「about:home」と入力し、ホームページを開く。(Startup-6-\*)  
    - 確認項目
        1. 既定のホームページ内に「あなたの権利について……」のリンクおよび情報が表示される。(Startup-6-1)\
           または、表示されない。(Startup-6-2) 
3. 任意のWebページを開く。 
4. Webページ内のリンクをドラッグし、ツールバー上の「ホーム」ボタンにドロップする。 
    - 確認項目
        1. 「このWebページまたはファイルを新しいホームページに設定します。よろしいですか？」と問われ、「はい」を選択した後でツールバー上の「ホーム」ボタンをクリックすると、ドラッグ&ドロップしたリンク先のページが開かれる。(Startup-2-2)\
          または、「ホーム」ボタンへのドロップが不可能である。(Startup-2-3) 
7. ロケーションバーに「about:config」と入力し、詳細設定一覧を開いて、各設定値を確認する。 
    - 確認項目 
        1. 「extensions.shownSelectionUI」の値が存在しないか、「false」である。(Admin-3-1)\
            または、「true」である。(Admin-3-2) 
        2. 「browser.startup.homepage\_override.mstone」の値が「ignore」である。(Startup-4-2) 
8. 詳細設定において、「extensions.lastAppVersion」を「1.0」に変更する。 
9. Firefoxを再起動する。 
    - 確認項目 
        1. アドオンの更新の確認が行われる。(Admin-3-1)\
            または、確認が行われない。(Admin-3-2) 
10. メニューバーの「ブックマーク」を開く。 
    - 確認項目 
        1. 既定の項目が作成されていない。(Startup-5-2) 
11. Firefoxのウィンドウのツールバー上で右クリックし、「ブックマークツールバー」を選択する。 
    - 確認項目 
        1. ブックマークツールバー上に既定の項目が作成されていない。(Startup-5-2) 
13. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
14. オプション画面の「一般」を開く。 
    - 確認項目 
        1. 既定のブラウザの項目内の「起動時にFirefoxが既定のブラウザであるか確認する」のチェックが外れていて、無効化されている。
            (Startup-3-2) 
15. Firefoxを終了し、以下のアドオンを有効化する。 
    - globalChrome.css 
16. Firefoxを起動し、パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
17. オプション画面の「一般」を開く。 
    - 確認項目 
        1. 「現在のページを使用」「ブックマークを使う」「初期設定に戻す」ボタンが表示されていない。
            (Startup-2-3) 
        2. 既定のブラウザの項目内の「起動時にFirefoxが既定のブラウザであるか確認する」のチェックおよび規定のブラウザに設定するボタンが表示されていない。(Startup-3-2) 
18. オプション画面の「詳細」を開き、「更新」を選択する。 
    - 確認項目 
        1. 「更新のインストールにバックグラウンドサービスを使用する」のチェックが外れており、無効化されている。
            (Update-4-2) 
19. Firefoxを終了し、システムの時計を1年先の日付に進めてからFirefoxを起動する。
    - 確認項目 
        1. 「お久しぶりです！ Firefoxはしばらく使われていないようです。プロファイルを掃除して新品のようにきれいにしますか？」というメッセージが表示される。（Startup-7-1）
           もしくは、表示されない。（Startup-7-2）
20. Firefoxを終了し、プロファイルを削除してからFirefoxを起動する。ホームページを既定の状態から変更している場合は、「 https://www.mozilla.org/ja/firefox/{{meta_installer_version}}/tour/ 」と入力し、ページを開く。(Startup-8-\*) 
    - 確認方法 
        1. UIツアーが開始される。(Startup-8-1)\
           または、開始されない。(Startup-8-2) 

### 後始末

1. 以下のアドオンを有効化する。 
    1. Disable about:config 
    2. globalChrome.css 

## アドオンの署名確認の無効化

### 確認する項目

- Admin-4-*

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. アドオンの未署名のインストールパッケージとして、テストケースのunsigned-sample-addon@clear-code.com.xpiを用意する。 

### 検証

1. 用意したインストールパッケージを{{install_path}}\\browser\\extensions\\unsigned-sample-addon@clear-code.com.xpiの位置に置く。 
2. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。 
3. Admin-2-2が選択されている場合、アドオンを有効化しFirefoxを再起動する。 
    - 確認項目
        1. Firefoxのウィンドウ下部に白背景・青色文字で「hello, world!」というメッセージが表示されている。(Admin-4-1) 
           または、されない。(Admin-4-2) 

### 後始末

1. {{install_path}}\\browser\\extensions\\unsigned-sample-addon@clear-code.com.xpiを削除する。 

## 起動方法の制御

### 確認する項目

- Application-1-1/3 
- Application-2-1/3 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。 
2. その状態のまま、{{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxの追加起動を試みる。
    - 確認項目
        1. Firefoxの新しいウィンドウが開かれる。(Application-1-1)\
            または、「Firefoxは起動していますが応答しません。」というメッセージが出てFirefoxの新しいウィンドウが開かれない。(Application-1-3) 
3. Firefoxを終了する。 
4. {{start_menu_shortcut_path}}をダブルクリックしてFirefoxを起動する。   
5. その状態のまま、{{start_menu_shortcut_path}}をダブルクリックしてFirefoxの多重起動を試みる。   
    - 確認項目
        1. Firefoxの新しいウィンドウが開かれる。(Application-2-1)\
            または、「Firefoxは起動していますが応答しません。」というメッセージが出てFirefoxの新しいウィンドウが開かれない。(Application-2-3) 

## ウィンドウ名の制御

- メインウィンドウのタイトルは{{window_title}}とする。 

### 確認する項目

- Application-4-\* 
- Application-5-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. タスクバー上に表示された項目にポインタを載せ、ジャンプリストを表示させる。
    - 確認項目
        1. 項目のタイトルが「{{window_title}}」で終わっている。
            （※確認できないときはスキップ）(Application-4-\*) 
        2. タスクバー上の項目、もしくはジャンプリストの項目に指定のアイコンが表示されている。(Application-5-\*) 
3. 3で項目のタイトルを確認できない場合、Ctrl-Shift-ESCを押下し、タスクマネージャを起動して、「アプリケーション」タブを選択する。
    - 確認項目
        1. 項目のタイトルが「{{window_title}}」で終わっている。 (Application-4-\*) 
        2. 項目に指定のアイコンが表示されている。(Application-5-\*) 

<!--======================================================================-->

# セキュリティに関わるカスタマイズ

## 証明書の自動インポート

### 確認する項目

- Security-1-1 
- Security-2-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. 「ツール」→「オプション」→「詳細」→「証明書」→「証明書を表示」ボタンから証明書マネージャを開く。 
    - 確認項目
        1. インポートするよう設定した証明書がすべて指定通りにインポートされている。
             (Security-1-1) 
3. インポートされた証明書をすべて削除する。  
4. Firefoxを再起動する。 
5. 「ツール」→「オプション」→「詳細」→「証明書」→「証明書を表示」ボタンから証明書マネージャを開く。 
    - 確認項目
        1. インポートするよう設定した証明書がすべて指定通りにインポートされている。
            (Security-2-1)\
            または、再インポートされていない。 (Security-2-2) 

## アドオンの利用制限

### 確認する項目

- Security-3-2/3/4/5 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. globalChrome.css 
3. Admin-4-1が選択されている場合はテストケースのunsigned-sample-addon@clear-code.com.xpiを、そうでなければ署名済みアドオンのインストールパッケージを用意する。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. Security-3-2もしくはSecurity-3-5が選択されている場合、アドオンのインストールを許可する対象のサイトを開き、ページのコンテキストメニューから「ページの情報を表示」を選択して、「ページの情報」ダイアログを開く。 
        1. 「サイト別設定」タブで「アドオンのインストール」において「許可」にチェックが入っている。(Security-3-2/5) 
        1. 「アドオンのインストール」を「ブロック」に変更してFirefoxを再起動し、再び同じページの「ページの情報」の「サイト別設定」タブを開いた時、「アドオンのインストール」において「許可」にチェックが入っている。(Security-3-2) 
           もしくは、「ブロック」にチェックが入っている。(Security-3-5) 
2. Firefoxのウィンドウにアドオンのインストールパッケージをドラッグ&ドロップする。 
    - 確認項目 
        1. 「ソフトウェアのインストールはシステム管理者により無効化されています。」と表示され、アドオンがインストールされない。(Security-3-3/4) 
3. Security-3-4が選択されている場合、アドオンマネージャを開く。 
    - 確認項目 
        1. 「アドオン入手」が表示されない。(Security-3-4) 
        2. 歯車アイコンが表示されている場合、そのポップアップメニュー内に「ファイルからアドオンをインストール」が含まれない。(Security-3-4) 
        3. 「拡張機能」タブが選択された状態で、アドオンマネージャ上にアドオンのインストールパッケージをドラッグ&ドロップして、アドオンがインストールされない。(Security-3-4) 
        4. 「アドオンを検索」欄に「Tab」と入力してEnterすると、「利用可能なアドオン」の検索結果が何も表示されない。(Security-3-4) 
4. Security-3-3が選択されている場合、以下の各方法でアドオンマネージャへのアクセスを試みる。 
    - 確認項目
        1. パネルメニューに「アドオン」の項目が存在しない。
            (Security-3-3) 
        2. パネルメニュー内の「カスタマイズ」をクリックした後の「追加のツールと機能」の項目一覧に「アドオン」の項目が存在しない。
            (Security-3-3) 
        3. Alt-Tを押下して開いた「ツール」メニュー内に「アドオン」の項目が存在しない。
            (Security-3-3) 
        4. ロケーションバーに「about:addons」と入力し、Alt-Enterして、タブが開かれない（開かれてもすぐ閉じられる）。
            (Security-3-3) 
        5. ロケーションバーに「about:addons」と入力し、Enterして、何も起こらない（ページが読み込まれない）。
             (Security-3-3) 
        6. ロケーションバーに「about:about」と入力しEnterして「about:」一覧を表示する。 
        7. 「about:addons」
            のリンクを中クリックまたはCtrl-clickし、空白のページがタブで開かれるか、タブが開かれないか、タブが開かれてすぐに閉じられる。(Security-3-3) 
        8. 「about:addons」
            のリンクを左クリックし、何も起こらないか、空白のページが読み込まれるか、タブが閉じられる。(Security-3-3) 
5. 「 https://addons.mozilla.org 」を開き、ページのコンテキストメニューから「ページの情報を表示」を選択して、「ページの情報」ダイアログを開く。 
    - 確認項目 
        1. 「サイト別設定」タブで「アドオンのインストール」において「標準設定を使用する」にチェックが入っている。(Security-3-3) 
6. 「 https://marketplace.firefox.com 」を開き、ページのコンテキストメニューから「ページの情報を表示」を選択して、「ページの情報」ダイアログを開く。 
    - 確認項目 
        1. 「サイト別設定」タブで「アドオンのインストール」において「標準設定を使用する」にチェックが入っている。(Security-3-3) 

### 後始末

1. 以下のアドオンを有効化する。 
    - globalChrome.css 

## 広告などのポップアップのブロック

### 確認する項目

1. Security-4-\* 

### 準備：

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    - カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証：

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. テストケースの「popupblock.html」を開く。 
    - 確認項目 
        1. ポップアップブロックの通知が表示される。(Security-4-1/2/4/5) 
           または、ポップアップブロックの通知が表示されずに、タブまたはウィンドウが開かれる。(Security-4-3) 
3. ポップアップの許可対象のサイトを開き、ページのコンテキストメニューから「ページの情報を表示」を選択して、「ページの情報」ダイアログを開く。 
   - 確認項目 
        1. 「サイト別設定」タブで「ポップアップウィンドウを開く」において「許可」にチェックが入っている。(Security-4-2/5) 
        2. 「ポップアップウィンドウを開く」を「ブロック」に変更してFirefoxを再起動し、再び同じページの「ページの情報」の「サイト別設定」タブを開いた時、「ポップアップウィンドウを開く」において「許可」にチェックが入っている。(Security-4-2) 
           もしくは、「ブロック」にチェックが入っている。(Security-4-5) 

## 攻撃サイトに対する警告

### 確認する項目

- Security-5-\* 
- Security-6-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. Firefoxのロケーションバーに「 https://itisatrap.org/firefox/its-an-attack.html 」と入力し、Enterを押下する。
    - 確認項目 
        1. 攻撃サイトとしてブロックされる。(Security-5-1)\
           または、ブロックされない。(Security-5-2) 
1. Firefoxのロケーションバーに「 http://itisatrap.org/firefox/unwanted.html 」と入力し、Enterを押下する。
    - 確認項目 
        1. 望ましくないソフトウェアの提供サイトとしてブロックされる。(Security-5-1)\
           または、ブロックされない。(Security-5-2) 
1. Firefoxのロケーションバーに「 http://itisatrap.org/firefox/its-a-trap.html 」と入力し、Enterを押下する。
    - 確認項目 
        1. 詐欺サイトとしてブロックされる。(Security-6-1)\
           または、ブロックされない。(Security-6-2) 
4. 「ツール」→「オプション」→「セキュリティ」タブを開く。 
    - 確認項目
        1. 詐欺コンテンツのブロックに関する設定項目が表示されていない。(Security-5-2)(Security-6-2) 

## about:ページの利用制限

### 確認する項目

- Security-8-2 
- Security-9-2 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    - カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. Disable About Somethingを用いて{{disabled_about_pages}}の使用を禁止しておく。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. 以下の各方法でabout:configへのアクセスを試みる。(Security-9-2) 
    1. 確認項目
        1. ロケーションバーに「about:config」と入力し、Alt-Enterして、タブが開かれない（開かれてもすぐ閉じられる）。
            (Security-9-2) 
        2. ロケーションバーに「about:config」と入力し、Enterして、何も起こらない（ページが読み込まれない）。
             (Security-9-2) 
        3. ロケーションバーに「about:about」と入力しEnterして「about:」一覧を表示する。 
        4. 「about:config」のリンクを中クリックまたはCtrl-clickし、空白のページがタブで開かれるか、タブが開かれないか、タブが開かれてすぐに閉じられる。(Security-9-2) 
        5. 「about:config」のリンクを左クリックし、空白のページが読み込まれる。  (Security-9-2) 
3. 以下の各方法で{{disabled_about_pages}}へのアクセスを試みる。(Security-8-2) 
    1. 確認項目
        1. ロケーションバーに「{{disabled_about_pages}}」と入力し、Alt-Enterして、タブが開かれない（開かれてもすぐ閉じられる）。
            (Security-8-2) 
        2. ロケーションバーに「{{disabled_about_pages}}」と入力し、Enterして、何も起こらない（ページが読み込まれない）。
             (Security-8-2) 
        3. ロケーションバーに「about:about」と入力しEnterして「about:」一覧を表示する。 
        4. 「{{disabled_about_pages}}」のリンクを中クリックまたはCtrl-clickし、空白のページがタブで開かれるか、タブが開かれないか、タブが開かれてすぐに閉じられる。(Security-8-2) 
        5. 「{{disabled_about_pages}}」のリンクを左クリックし、何も起こらないか、空白のページが読み込まれるか、タブが閉じられる。(Security-8-2) 

### 後始末：

1. 以下のアドオンを有効化する。 
    1. globalChrome.css 
    2. UI Text Overrider 

## SNS連携機能とソーシャルAPIの利用制限

### 確認する項目

- Security-11-\*

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. パネルメニュー内の「カスタマイズ」をクリックしてツールバーのカスタマイズ画面を開く。 
    - 確認項目 
        1. 「このページを共有」ボタンが存在する。(Security-11-1)\
            または、存在しない。(Security-11-2) 
3. ロケーションバーに「 https://activations.cdn.mozilla.net/ja/ 」と入力し、Enterを押してページを開く。 
4. いずれかのサービスの「今すぐ追加」ボタンをクリックする。 
    - 確認項目 
        1. 何も起こらない。(Security-11-2) 

## JavaScriptの実行制限

### 確認する項目

- Security-12-3 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. テストケースの「popupblock.html」を開く。 
    - 確認項目 
        1. 何も起こらない。ポップアップブロックの通知も表示されない。(Security-12-3) 

## ローカルファイルの読み込みの制限

### 確認する項目

- Security-13-\* 
- Security-14-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. テストケースの「local-file-link.html」を、ローカルファイルの読み込みを許可するサイトに設置してから開き、ページ内のリンクをクリックする。 
    - 確認項目 
        1. 「C:\\file.txt」の位置に置いたファイルの内容が読み込まれる。(Security-13-1)\
           または、何も起こらない。(Security-13-2) 
2. テストケースの「cross-directory.html」について、「../configuration-sheets/constumize-item-list.csv」の位置にファイルがある事を確認した上で、ファイルを開く。 
    - 確認項目 
        1. 「./cross-directory.html」および「../configuration-sheets/constumize-item-list.csv」の結果が「200」と表示される。(Security-14-1)\
           または、「./cross-directory.html」の結果は「200」、「../configuration-sheets/constumize-item-list.csv」の結果はエラーが表示される。(Security-14-2) 

## バックグラウンドで行われる通信の制限

### 確認する項目

- Security-15-2
  - Security-3-3/4
  - Security-5-2
  - Security-10-2 (Firefox 45以前のみ）
  - Security-11-2
  - Security-18-2
  - Security-19-2
  - Security-21-2
  - Security-25-2
  - Privacy-15-2
  - Privacy-18-2
  - Privacy-19-2
  - Privacy-22-2
  - Privacy-24-2
  - Privacy-25-2 (Firefox 45以前のみ）
  - Privacy-31-2
  - Privacy-33-3
  - Startup-8-2
  - Update-1-3
  - Update-2-2
  - Plugin-8-2

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. Firefoxのユーザープロファイル（{{special_profile_path}}）を削除する。 
3. 以下のアドオンを無効化する。 
    1. globalChrome.css 
    2. UI Text Overrider 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. ロケーションバーに「about:blank」と入力し、空のページを開く。 
3. パネルメニューの「開発ツール」→「開発ツールを表示」で開発ツールを表示する。 
4. 開発ツール右上の歯車アイコンをクリックする。 
5. 「ブラウザとアドオンのデバッガを有効」と「リモートデバッガを有効」にチェックを入れる。 
6. パネルメニューの「開発ツール」→「ブラウザツールボックス」でブラウザツールボックスを開く。途中、リモートデバッグの接続許可を求められるので「OK」をクリックする。 
7. ブラウザツールボックスで「ネットワーク」を選択する。 
8. ブラウザツールボックス内の「再読み込み」ボタンをクリックする。 
9. そのまま10分放置する。 
    - 確認項目 
        1. 一切のネットワーク通信が記録されない。(Security-15-2)

### 後始末

1. 以下のアドオンを有効化する。 
    1. globalChrome.css 
    2. UI Text Overrider 

## 外部リソースへのアクセスの制限

### 確認する項目

- Security-15-2 
- Security-18-2 
- Security-19-2 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. globalChrome.css 
    2. UI Text Overrider 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. パネルメニューからツールバーのカスタマイズ画面を開く。 
    - 確認項目 
        1. 「テーマ」内の「その他のテーマを入手」をクリックしても何も起こらない。(Security-15-2)(Security-18-2) 
        2. 「テーマ」内の「おすすめ」に何も項目が表示されない。(Security-15-2) (Security-19-2)
3. パネルメニューの「開発ツール」→「WebIDE」でWebIDEを開く。 
4. メニューの「プロジェクト」→「追加のコンポーネントを管理」を開く。 
    - 確認項目 
        1. 無反応である、もしくはツールアダプタアドオンが準備中になっている。(Security-15-2) 

### 後始末

2. 以下のアドオンを有効化する。 
    1. globalChrome.css 
    2. UI Text Overrider 

## パーミッション設定の制限

### 確認する項目

- Security-20-2 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. ロケーションバーに「 https://addons.mozilla.org/ 」と入力し、ページを開く。 
3. ページの読み込みが完了したら、ロケーションバー上の鍵アイコンの箇所をクリックする。 
    - 確認項目 
        1. パネル上に「サイト別設定」が表示されない。(Security-20-2) 
        2. Firefox 45以前では、パネル右の「\>」をクリックした先の画面で「詳細を表示」ボタンが表示されない。(Security-20-2) 
4. ページ上のコンテキストメニューから「ページの情報を表示」を選択する。 
    - 確認項目 
        1. 「サイト別設定」タブが表示されない。(Security-20-2) 

## フルスクリーン表示の制限

### 確認する項目

- Security-16-\*

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. 「 http://www.w3schools.com/html/html5\_video.asp 」を開く。 
    - 確認項目 
        1. 動画のコントロール内にフルスクリーン表示切り替え用ボタンが表示されている。（Security-16-1)
           または、表示されていない。（Security-16-3）

## アドオンとプラグインのブロックリストの使用の可否

### 確認する項目

- Security-21-\*

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. globalChrome.css 
    2. UI Text Overrider 
    3. Disable Add-ons
3. Silverlightのバージョン一覧 https://www.microsoft.com/getsilverlight/locale/en-us/html/Microsoft%20Silverlight%20Release%20History.htm から、セキュリティ上の脆弱性があるバージョンである「Silverlight 5 Build 5.1.41105.0 Released December 8, 2015」をダウンロードし、インストールしておく。

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. アドオンマネージャを開き、「プラグイン」ペインを選択する。
    - 確認項目 
        1. Silverlightの項目に対し、安全でないバージョンである旨の警告が表示されている。（Security-21-1)
           または、表示されていない。（Security-21-2）

### 後始末

1. 以下のアドオンを有効化する。 
    1. globalChrome.css 
    2. UI Text Overrider 
    3. Disable Add-ons
2. 検証のためにインストールしたSliverlightプラグインをアンインストールする。

## プラグインのサンドボックス内実行

### 確認する項目

- Security-23-\*

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. Disable about:config 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。 
7. ロケーションバーに「about:config」と入力し、詳細設定一覧を開いて、各設定値を確認する。 
    - 確認項目 
        1. 「dom.ipc.plugins.sandbox-level.default」の値が「0」である。(Security-23-1/2)
           または、「1」である。(Security-23-3)
        2. 「dom.ipc.plugins.sandbox-level.flash」の値が「0」である。(Security-23-1)
           または、「1」である。(Security-23-2/3)

### 後始末

1. 以下のアドオンを有効化する。 
    1. Disable about:config 

## プロトコルごとの外部Webアプリケーションへの連携

### 確認する項目

- Security-25-\*

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。 
2. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
3. オプション画面の「プログラム」を開く。
    - 確認項目 
        1. ファイルの種類「irc」「ircs」「mailto」「webcal」のそれぞれについて、選択肢としてWebアプリケーション名が表示される。（Security-25-1）
           または、「毎回確認する」と「他のプログラムを選択する...」の2つだけが表示される。（Security-25-2） 

<!--======================================================================-->

# プライバシー情報に関わるカスタマイズ

## プライバシー情報の利用制限

### 確認する項目

- Privacy-1-1/2/3/4
- Privacy-2-2 
- Privacy-3-2
- Privacy-4-2 
- Privacy-5-2 
- Privacy-6-2/3/4 
- Privacy-7-\* 
- Privacy-8-2 
- Privacy-10-2 
- Privacy-12-\* 
- Privacy-13-\* 
- Privacy-15-2 
- Privacy-16-\* 
- Privacy-17-\* 
- Privacy-18-2 
- Privacy-19-2 
- Privacy-20-\*
- Privacy-21-2 
- Privacy-31-2 
- Privacy-32-\* 
- Privacy-33-2/3 
- Privacy-35-\*
- Privacy-36-\*
- Privacy-37-\*
- Privacy-38-\*

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. Firefoxのユーザープロファイル（{{special_profile_path}}）を削除する。 
2. Firefoxのテンポラリファイルおよびキャッシュファイル（%LocalAppData%\\Mozilla）を削除する。 
2. 以下のアドオンを無効化する。 
    1. Disable about:config 
    2. globalChrome.css 
    3. UI Text Overrider
3. Privacy-32-\*またはPrivacy-37-\*の検証を行う場合は、MCD設定ファイルに以下の設定を追加しておく。
    - `lockPref("logging.nsHttp", 5);`
    - `lockPref("logging.NetworkPredictor", 5);`
    - `lockPref("logging.config.sync", true);`
    - `lockPref("logging.config.add_timestamp", true);`
    - `lockPref("logging.config.LOG_FILE","C:\\Users\\(ログオン中のユーザのアカウント名)\\http.log");`

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. テンポラリファイルおよびキャッシュファイルフォルダ内の「thumbnails」フォルダを開いて、「 https://addons.mozilla.org/ 」サイト内のリンクを何度か遷移する。
    - 確認項目
        1. サムネイル画像が保存される。（Privacy-36-1）
           または、サムネイル画像が保存されない。（Privacy-36-2）
2. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
2. オプション画面の「プライバシー」を開く。
    - 確認項目
        4. 「ブロックリストを変更」ボタンが無効化されている。（Privacy-35-3/4）
2. Firefoxを終了し、MCD用設定ファイル内の以下の行をコメントアウトする。（Privacy-35-3/4）
   * `lockPref("pref.privacy.disable_button.change_blocklist", true);`
2. Firefoxを起動する。
2. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
3. オプション画面の「プライバシー」を開く。
    - 確認項目
        1. 「Do Not Trackの設定を管理」リンクをクリックして開かれたダイアログ内で、「Do Not Trackを常に有効にする」のチェックが入っている。 (Privacy-20-1/2) 
           または、チェックが外れている。 (Privacy-20-3/4) 
        2. 「履歴」で「Firefoxに履歴を記憶させる」が選択されているか、「記憶させる履歴を詳細設定」で「常にプライベートブラウジングモード」のチェックが外れていて選択不可になっている。(Privacy-1-2)\
            または、「Firefoxに履歴を一切記憶させない」が選択されているか「記憶させる履歴を詳細設定」で「常にプライベートブラウジングモード」のチェックが入っていて選択不可になっている。(Privacy-1-3) 
        3. 「履歴」で「Firefoxの終了時に履歴を消去する」のチェックが外れていて選択不可になっている。(Privacy-1-2/3) 
           または、チェックが入っていて選択不可になっている。(Privacy-1-4) 
        3. 「Firefoxの終了時に履歴を消去する」の「設定」で、指定した項目にチェックが入って選択不可になっている。(Privacy-1-4) 
        4. 「ブロックリストを変更」ボタンを押して表示されるブロックリストの選択で、「簡易ブロック」が選択されている。（Privacy-35-1/3）
           または、「広範ブロック」が選択されている。（Privacy-35-2/4）
4. オプション画面の「詳細」→「ネットワーク」を開く。 
    - 確認項目 
        1. 「Webサイトがオフライン作業用のデータの保存を求めてきたときに知らせる」のチェックが外れていて選択不可になっている。(Privacy-6-3) 
        2. 「オフライン作業用のデータの保存を許可しているウェブサイト」のリストに、オフラインデータの保存を確認無しで許可するよう指定したサイトが表示されている。(Privacy-6-2/4) 
5. オプション画面の「詳細」の「データの選択」を開く。 
    - 確認項目 
        1. 「Firefoxヘルスレポートを有効にする」のチェックが外れている。(Privacy-18-2) 
        2. 「追加データを共有する（パフォーマンス情報など）」のチェックが外れている。(Privacy-18-2) 
        2. 「Firefoxに、あなたに代わって未送信のクラッシュレポートを送信するのを許可する」のチェックが外れている。(Privacy-21-2) 
5. Firefoxを終了し、MCD用設定ファイル内の以下の行をコメントアウト状態から復帰させる。（Privacy-35-3/4）
   * `// lockPref("pref.privacy.disable_button.change_blocklist", true);`
5. Firefoxを起動する。
6. テストケースの「password.html」を開く。 
7. ユーザID、パスワードを入力して送信する。 
    - 確認項目 
        1. パスワードの保存を尋ねられない。(Privacy-5-2) 
        2. ファイルを再読み込みしてもパスワードが自動入力されない。(Privacy-5-2) 
        3. ユーザID入力欄をダブルクリックしても入力履歴が表示されない。(Privacy-2-2) 
8. ファイルに名前を付けて保存し、Firefoxを再起動する。(Privacy-3-2) 
    - 確認項目 
        1. 「履歴」→「すべての履歴を表示」で「ダウンロード」の一覧に項目が存在しない。(Privacy-3-2) 
9. ロケーションバーに「password」と入力する。(Privacy-4-2) 
    - 確認項目 
        1. ロケーションバーのオートコンプリートの項目が表示されない。(Privacy-4-2) 
9. テストケースの「storage.html」を開く。 
    - 確認項目 
        1. 「window.localStorage = [object Storage]」と出力される。(Privacy-12-1) 
           または、「window.localStorage = null」と表示される。(Privacy-12-2) 
9. テストケースの「indexed-db.html」を開く。 
    - 確認項目 
        1. 「enabled」と出力される。(Privacy-13-1) 
           または、「disabled」と表示される。(Privacy-13-2) 
9. テストケースの「beacon.html」を開く。 
    - 確認項目 
        1. 「enabled」と出力される。(Privacy-38-1) 
           または、「disabled」と表示される。(Privacy-38-2) 
10. ロケーションバーに「about:config」と入力し、詳細設定一覧を開く。 
11. 各設定値を確認する。 
    - 確認項目 
        1. 「places.history.expiration.max\_pages」の値が「{{history_expiration_max_pages}}」である。(Privacy-8-2) 
        3. 「browser.search.geoip.url」の値が空文字である。(Privacy-15-2) 
        4. 「security.ssl.errorReporting.automatic」の値が「false」である。(Privacy-19-2) 
        5. 「security.ssl.errorReporting.enabled」の値が「false」である。(Privacy-19-2) 
        6. 「security.ssl.errorReporting.url」の値が空文字である。(Privacy-19-2) 
        7. 「browser.selfsupport.url」の値が空文字である。(Privacy-31-2) 
        8. 「privacy.trackingprotection.enabled」の値が「true」である。(Privacy-33-2)\
            または、「false」である。(Privacy-33-3) 
        9. 「privacy.trackingprotection.pbmode.enabled」の値が「true」である。(Privacy-33-2)\
            または、「false」である。(Privacy-33-3) 
12. 以下の設定を行う。既存の値がない場合は新規に作成する。 
    - 「network.dns.notifyResolution」（真偽型）を「true」に設定する。 
    - 「devtools.chrome.enabled」（真偽型）を「true」に設定する。 
13. パネルメニューを開き、パネルメニュー内の「開発ツール」をクリックして、サブメニューの「ブラウザコンソール」をクリックする。
14. 以下のコードをコンソール内で実行する。
    - `Services.obs.addObserver(function(aSubject, aTopic, aData) { console.log(aTopic+': '+aData); }, 'dns-resolution-request', false);`
15. コンソール上の「ネットワーク」が選択された状態にする。すでに選択されていた場合は、一旦未選択状態に戻し、再度選択する。
16. ブラウザウィンドウで「 http://www.clear-code.com/blog/2016/5/10.html 」を開く。 
    - 確認項目 
        1. 「GET http://www.clear-code.com/blog/2016/5/18.html 」というログがコンソールに出力される。(Privacy-7-1)\
            または、出力されない。(Privacy-7-2) 
17. ブラウザウィンドウでテストケースの「prefetching.html」を開く。 
    - 確認項目 
        1. 「dns-resolution-request: dns-prefetch.example.com」というログがブラウザコンソールに出力される。(Privacy-16-1)\
            または、出力されない。(Privacy-16-2) 
18. ブラウザコンソールを閉じる。 
19. ロケーションバーに「about:」と入力し、Alt-Enterでタブとして開いてから、タブを閉じる。 
21. 新しいブラウザウィンドウを開いてロケーションバーに「about:」と入力し、ページの読み込みが完了したらウィンドウを閉じる。 これを2回繰り返す。
24. 「履歴」メニューを開く。 
    - 確認項目 
        1. 「最近閉じたタブ」が表示されない。(Privacy-10-2) 
        2. 「最近閉じたウィンドウ」にウィンドウの項目が1つだけ表示される。(Privacy-10-2) 
24. Firefoxを再起動する。
24. 「履歴」メニューを開く。 
    - 確認項目 
        1. 「最近閉じたウィンドウ」が表示されない。(Privacy-10-2) 
25. ツールバー上の検索窓にフォーカスし「a」と入力する。 
    - 確認項目 
        1. 「a」の補完候補が表示される。(Privacy-17-1)\
            または、表示されない。(Privacy-17-2)
26. ツールバー上のロケーションバーにフォーカスし「新しい検索語句」等、履歴やブックマーク等からの候補が表示され得ないテキストを入力する。 
    - 確認項目 
        1. 補完候補が表示される。(Privacy-17-1)\
            または、表示されない。(Privacy-17-2)  
27. ツールバー上の検索窓の虫眼鏡のアイコンをクリックし、ポップアップ表示されたパネルの最下部の「検索設定を変更」をクリックする。 
28. 開かれた設定画面の「既定の検索エンジン」欄を見る。 
    - 確認項目 
        1. 「検索候補を使用する」にチェックが入っていて選択不可になっている。(Privacy-17-1)\
            または、チェックが外れていて選択不可になっている。(Privacy-17-2) 
        2. 「ロケーションバーに検索候補を表示する」にチェックが入っていて選択不可になっている。(Privacy-17-1)\
            または、チェックが外れていて選択不可になっている。(Privacy-17-2) 
29. Firefoxを終了し、以下のアドオンを有効化する。 
    - globalChrome.css 
30. Firefoxを起動し、ツールバー上の検索窓の虫眼鏡のアイコンをクリックし、ポップアップ表示されたパネルの最下部の「検索設定を変更」をクリックする。 
31. 開かれた設定画面の「既定の検索エンジン」欄を見る。 
    - 確認項目 
        1. 「検索候補を使用する」が表示されていない。(Privacy-17-2) 
        2. 「ロケーションバーに検索候補を表示する」が表示されていない。(Privacy-17-2) 
32. 「プライバシー」ペインを選択する。 
    - 確認項目 
        1. 「常にプライベートブラウジングモード」が表示されていない。(Privacy-1-2) 
        2. 「プライベートウィンドウでサイトによるトラッキングをブロックする」が表示されていない。(Privacy-33-3) 
        3. 「検索エンジンの検索候補の設定を変更」が表示されていない。(Privacy-17-2) 
33. Firefoxを終了する。 
34. Firefoxのユーザープロファイルフォルダを開く。
    - 確認項目 
        1. sessionstore.jsが存在しない。（Privacy-10-2）
34. (ユーザのホームのフルパス)\\http.log の位置に出力されているログファイルを開く。 
    - 確認項目 
        1. ログ中に現れる「nsHttpConnectionMgr::OnMsgSpeculativeConnect」と「Transport not created due to existing connection count」の登場回数のうち、前者の方が多い。（Privacy-32-1）\
            または、両者の登場回数が等しい。（Privacy-32-2） 
        2. ログ中の「Predictor::Predict」という行に続く「called on parent process」という行の後に、「not enabled」という行が表れていない。（Privacy-37-1）
            または、表れている。（Privacy-37-2）

### 後始末

1. about:configで以下の設定をリセットする。 
    1. 「network.dns.notifyResolution」（真偽型） 
    2. 「devtools.chrome.enabled」（真偽型） 
2. 以下のアドオンを有効化する。 
    1. Disable about:config 
    2. globalChrome.css 
    3. UI Text Overrider 
3. ログ収集用にMCD用設定ファイルに追加した設定を削除する。

## 履歴の保存日数の制御

- 当日を含めず5日前までの履歴を保存するものとする。 

### 確認する項目

- Privacy-9-1 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. Disable Addons 
    2. Disable about:config 
3. 十分な日数分の履歴項目を以下の手順で用意する。 
    1. システムの日付と時刻について、インターネット経由での調整を無効にする。例えばWindowsであれば、タスクバーの時計を右クリックして「日付と時刻の調整」を選択し、「日付と時刻」ダイアログの「インターネット時刻」タブで「設定の変更」ボタンをクリックし、「インターネット時刻サーバーと同期する」のチェックを外す。（※要：管理者権限） 
    2. システムの日付を5＋2日以上前の日付に変更する。
    3. Firefox上で何らかのWebページを開き、リンクを辿ってページを遷移する。 
    4. この操作を、日付を1日ずつ進めながら繰り返す。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. パネルメニューを開き、「アドオン」をクリックする。
3. アドオンマネージャ内の「拡張機能」をクリックする。 
    1. 確認項目
        1. 拡張機能の一覧に「Flexible Expire History by Days」が表示されており、有効になっている。(Privacy-9-1) 
4. {{expire_history_by_days_version}}の設定画面を開く。 
    1. 確認項目 
        1. 「Expire visits older than these days」の値が「5」である。(Privacy-9-1) 
        2. 「Frequency of expiration」で「On the first idle time per a day」が選択されている。(Privacy-9-1) 
5. Firefoxのロケーションバーに「about:config」と入力し、ページを開く。 
6.  「検索」欄に「idle.lastDailyNotification」と入力し、Enterを押下する。  
7. 項目が見つかった場合、項目を右クリックしてメニューから「リセット」を選択する。 
8. Firefoxを終了する。 
9. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
10. メニューバーの「履歴」から「すべての履歴」を選択し、「履歴とブックマークの管理」ウィンドウを開く（すべての履歴項目を表示した状態にする）。 
11. 「履歴」配下の「7日以内」、「（前月）月」、または指定の履歴保存期間のしきい値となる日付が含まれる期間を選択する。 
12. 履歴一覧のカラム列を右クリックし、「最近表示した日時」にチェックを入れる。 
    1. 確認項目 
        1. 当日までの日付の履歴項目が並んでいる。 
13. マウスとキーボードから手を離し、4分以上、何も操作せずに放置する。 
    1. 確認項目 
        1. 前日を含めて過去5日間の履歴が残っており、それよりも古い履歴項目が残っていない。(Privacy-9-1) 

### 後始末

1. システムの日付と時刻について、インターネット経由での調整を有効に戻す。
2. 以下のアドオンを有効化する。 
    1. Disable Addons 
    2. Disable about:config 

## 位置情報の利用制限

### 確認する項目

- Privacy-14-\*

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. Disable about:config 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. ロケーションバーに「 https://developer.mozilla.org/ja/docs/WebAPI/Using\_geolocation 」と入力し、ページを開く。 
3. 「Geolocationのライブサンプル」欄の「Show my location」ボタンをクリックする。 
    - 確認項目 
        1. 「このサイトに位置情報の共有を許可しますか？」と尋ねられる。(Privacy-14-1/2/4) 
           または、何も表示されないか、「Geolocation is not supported by your browser」というエラーメッセージが表示される。(Privacy-14-3)
4. 確認無しでの位置情報の取得を許可するサイトのページを開き、「ページの情報」を開いて「サイト別設定」タブを選択する。
    - 確認項目 
        1. 「位置情報の送信」で、「標準設定を使用する」のチェックが外れており、「許可」が選択されている。(Privacy-14-2/4)
5. 「位置情報の送信」で、「ブロック」を選択してFirefoxを再起動する。
6. 確認無しでの位置情報の取得を許可するよう設定していたサイトのページを開き、「ページの情報」を開いて「サイト別設定」タブを選択する。
    - 確認項目 
        1. 「位置情報の送信」で、「標準設定を使用する」のチェックが外れており、「許可」が選択されている。(Privacy-14-2)
           または、「ブロック」が選択されている。(Privacy-14-4)

### 後始末

1. 以下のアドオンを有効化する。 
    1. Disable about:config 

## Firefox Syncの利用制限

### 確認する項目

- Privacy-22-2 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
    - 確認項目 
        1. 「Sync」の項目が存在しない。(Privacy-22-2) 
3. 「ツール」メニューを開く。 
    - 確認項目 
        1. 「Syncにログイン」が存在しない。(Privacy-22-2) 
4. パネルメニュー内の「カスタマイズ」をクリックしてツールバーのカスタマイズ画面を開く。 
    - 確認項目 
        1. 「Sync」が存在しない。(Privacy-22-2) 
        2. 「Syncにサインイン」が存在しない。(Privacy-22-2) 
5. 以下の各方法でabout:accountsへのアクセスを試みる。 
    - 確認項目
        1. ロケーションバーに「about:accounts」と入力し、Alt-Enterして、タブが開かれない（開かれてもすぐ閉じられる）。
            (Privacy-22-2) 
        2. ロケーションバーに「about:accounts」と入力し、Enterして、何も起こらない（ページが読み込まれない）か、タブが閉じられる。
            (Privacy-22-2) 
        3. ロケーションバーに「about:about」と入力しEnterして「about:」一覧を表示する。 
        4. 「about:accounts」のリンクを中クリックまたはCtrl-clickし、空白のページがタブで開かれるか、タブが開かれないか、タブが開かれてすぐに閉じられる。(Privacy-22-2) 
        5. 「about:accounts」のリンクを左クリックし、空白のページが読み込まれるか、タブが閉じられる。(Privacy-22-2) 

## Firefox Accountsの利用制限

### 確認する項目

- Privacy-24-2 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. Disable Sync 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. ロケーションバーに「about:accounts」と入力し、ページを開く。 
3. 「始める」をクリックする。 
    - 確認項目
        1. 「Bad configuration」または「設定が正しくありません」というエラーメッセージが表示され、アカウント登録の画面に遷移しない。
            (Privacy-24-2) 

### 後始末

1. 以下のアドオンを有効化する。 
    1. Disable Sync 

## プライバシーに関わる機能の利用制限

### 確認する項目

- Privacy-26-2 
- Privacy-27-2 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. パネルメニュー内の「カスタマイズ」をクリックしてツールバーのカスタマイズ画面を開く。 
    - 確認項目 
        1. 「忘れる」が存在しない。(Privacy-26-2) 
        2. 「Pocket」が存在しない。(Privacy-27-2) 
3. Webページ中の任意のリンクを右クリックしてコンテキストメニューを開く。
    - 確認項目 
        1. 「リンクをPocketに保存」が存在しない。(Privacy-27-2)

## アイドル状態での履歴・ブックマーク用データベースの自動最適化

### 確認する項目

- Privacy-29-2 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. Disable about:config 
    2. globalChrome.css 
    3. UI Text Overrider 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. Firefoxのロケーションバーに「about:config」と入力し、ページを開く。 
3. リスト領域を右クリックしてメニューから「新規作成」→整数値を選択し、設定名「idle.lastDailyNotification」、値「0」で設定項目を登録する。 
4. リスト領域を右クリックしてメニューから「新規作成」→整数値を選択し、設定名「 places.database.lastMaintenance 」、値「0」で設定項目を登録する。
5. Firefoxを終了する。 
6. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
7. パネルメニューを開き、パネルメニュー内の「開発ツール」をクリックして、サブメニューの「ブラウザコンソール」をクリックする。
8. キーボード、マウスから手を離し、4分以上待つ。 
9. ブラウザコンソールの内容を確認する。 
    - 確認項目
        1. 以下のメッセージがすべて出力される。(Privacy-29-2) 
            1. 「PlacesDBUtils.maintenanceOnIdle() is called and redirected to checkAndFixDatabase().」 
            2. 「PlacesDBUtils.checkAndFixDatabase() successfully finished.」 
            3. 「Array [ ... ]」 
        2. 「Array [ ... ]」と表示されたメッセージの中に、「\> Vacuum」という内容が含まれている。(Privacy-29-2) 

### 後始末

1. 以下のアドオンを有効化する。 
    1. Disable about:config 
    2. globalChrome.css 
    3. UI Text Overrider 

## ディスクキャッシュのサイズ制限

- 制限する最大サイズは{{max_cache_size}}MBとする。 

### 確認する項目

- Privacy-30-\*

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 設定値が1MB未満の場合、値が1MB以上になるよう調整する。

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
3. オプション画面の「詳細」→「ネットワーク」を開く。
    1. 確認項目
        1. 「キャッシュサイズを変更する」にチェックが入っておらず、選択不可になっている。(Privacy-30-1) 
           または、チェックが入っていて、選択不可になっている。(Privacy-30-2) 
        2. 「ページキャッシュとして{{max_cache_size}}MBまで使用する」と表示されている。(Privacy-30-2) 

## Cookie、IndexedDB、Web Storage、およびService Worker用Cacheの保存ポリシー

### 確認する項目

- Privacy-11-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    2. globalChrome.css 
    3. UI Text Overrider 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
3. オプション画面の「プライバシー」を開き、「記憶させる履歴を詳細設定する」を選択する。 
   - 確認項目 
       1. 「サイトから送られてきたCookieを保存する」にチェックが入っている。（Privacy-11-1/2/3/5）
          または、チェックが入っていない。（Privacy-11-4）
       2. 「サードパーティCookieの保存」で「常に許可」が選択されている。（Privacy-11-1/2/3/5）
          または、「常に拒否」が選択されている。（Privacy-11-4）
       3. 「Cookieを保存する期間」で「サイトが指定した期限まで」が選択されている。（Privacy-11-1/2/3/5）
          または、「Firefoxを終了するまで」が選択されている。（Privacy-11-3）
4. Cookie保存の許可対象のサイトを開き、ページのコンテキストメニューから「ページの情報を表示」を選択して、「ページの情報」ダイアログを開く。 
   - 確認項目 
        1. 「サイト別設定」タブで「Cookieデータの保存」において「許可」にチェックが入っている。（Privacy-11-2/5）
        2. 「ポップアップウィンドウを開く」を「ブロック」に変更してFirefoxを再起動し、再び同じページの「ページの情報」の「サイト別設定」タブを開いた時、「Cookieデータの保存」において「許可」にチェックが入っている。（Privacy-11-2）
           もしくは、「ブロック」にチェックが入っている。（Privacy-11-5）

### 後始末

1. 以下のアドオンを有効化する。 
    2. globalChrome.css 
    3. UI Text Overrider 

## フォームへのユーザー入力値のセッション情報への保存の可否

### 確認する項目

- Privacy-34-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. Firefoxのユーザープロファイル（{{special_profile_path}}）を削除する。 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. テストケースの「password.html」を開く。 
3. ユーザID欄に「ユーザ入力値」と入力し、20秒待つ。
4. ユーザープロファイル内の「sessionstore-backups」フォルダ内の「recovery.js」を開く。
   - 確認項目 
       1. ファイル内に「ユーザ入力値」という文字列が含まれている。（Privacy-34-1）
          または、含まれていない。（Privacy-34-2）

<!--======================================================================-->

# Webブラウズ機能に関するカスタマイズ

## 検索エンジンの制限

### 確認する項目

- Websearch-1-\* 
- Websearch-2-2 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. ロケーションバーに「 https://addons.mozilla.org/ 」と入力し、ページを開く。 
3. Web検索バーのアイコンをクリックする。 
    - 確認項目 
        1. Web検索バーのアイコンに「+」のバッジが表示される。(Websearch-1-1)\
            または、バッジが表示されない。(Websearch-1-2) 
        2. パネル上に「”Firefoxアドオン”を追加」という項目が表示される。(Websearch-1-1)\
            または、表示されない。(Websearch-1-2) 
        3. パネル上に、無効にした検索エンジンが表れていない。(Websearch-2-2) 
4. パネル下部の「検索設定を変更」をクリックする。(Websearch-2-2) 
    - 確認項目 
    -   1. 「既定の検索エンジン」のドロップダウンリストに、無効にした検索エンジンが表れていない。(Websearch-2-2) 
        2. 「ワンクリック検索エンジン」のリストに、無効にした検索エンジンが表れていない。(Websearch-2-2) 

## ロケーションバーの表示の制御

### 確認する項目

- Location-1-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. ロケーションバーに「 http://www.clear-code.com/ 」のように「 http:// 」で始まるURLを入力し、ページを開く。 
    - 確認項目 
        1. ロケーションバーのURL表記に「http://」が含まれている。(Location-1-2)\
            または、含まれていない。(Location-1-1) 

## ダウンロードに関する機能の制御

### 確認する項目

- Download-1-\* 
- Download-2-\* 
- Download-3-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. Firefoxのユーザープロファイル（{{special_profile_path}}）を削除する。 
3. 既定のダウンロード先「{{download_dir}}」を用意しておく。用意できない場合は、Download-2−1の参照先を「C:\\」などの実在するパスに変更し、以下の説明も読み替える。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. パネルメニュー内の「カスタマイズ」をクリックしてツールバーのカスタマイズ画面を開く。 
    - 確認項目 
        1. 「ダウンロード」が存在する。(Download-1-1)\
            または、存在しない。(Download-1-2) 
3. ロケーションバーに「 http://www.clear-code.com/ 」と入力し、ページを開く。 
4. Webページ中の任意のリンクを右クリックし、「名前を付けてリンク先を保存」を選択する。 
    - 確認項目 
        1. ダウンロード先として{{download_dir}}が選択された状態でファイル選択ダイアログが開かれる。(Download-2-1/2)\
            または、ホームディレクトリ内の「ダウンロード」が選択された状態でファイル選択ダイアログが開かれる。(Download-2-3) 
5. 「subfolder」という名前でフォルダを作成し、そのフォルダを選択してダウンロードを開始する。 
    - 確認項目 
        1. ダウンロードの進行状況を示すポップアップが表示される。(Download-1-1)\
            または、表示されない。(Download-1-2) 
6. ロケーションバーに「 http://www.mozilla.org/ 」と入力し、ページを開く。 
7. Webページ中の任意のリンクを右クリックし、「名前を付けてリンク先を保存」を選択する。 
    - 確認項目 
        1. ダウンロード先として{{download_dir}}内の「subfolder」が選択された状態でファイル選択ダイアログが開かれる。(Download-3-1)\
            または、{{download_dir}}が選択された状態でファイル選択ダイアログが開かれる。(Download-3-2) 
8. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
9. オプション画面の「一般」を開く。
    - 確認項目
        1. 「ダウンロード」は「次のフォルダに保存する」が選択されている。(Download-3-\*) 
        2. ダウンロード先として{{download_dir}}内の「subfolder」が表示されている。(Download-3-1)\
            または、{{download_dir}}が表示されている。(Download-3-2) 

## タブの操作に関する機能の制御

### 確認する項目

- Tab-1-\* 
- Tab-2-\* 
- Tab-3-\* 
- Tab-5-\* 
- Tab-7-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. テストケース「links.html」を用意する。 
3. 以下のアドオンを無効化する。 
    1. Disable about:config 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. 新しいウィンドウを開く。 
3. 新しいウィンドウ内で新しいタブを2つ以上開く。 
4. ウィンドウを閉じる操作を行う。 
    - 確認項目 
        1. 複数のタブを閉じてよいかどうか確認される。(Tab-1-1)\
            または、確認されない。(Tab-1-2/3) 
5. タブを1つ選択し、右クリックして「他のタブをすべて閉じる」を選択する。 
    - 確認項目 
        1. 複数のタブを閉じてよいかどうか確認される。(Tab-2-1)\
            または、確認されない。(Tab-2-2/3) 
6. テストケースの「links.html」を開く。リンクからタブを開き、15以上のタブが開かれた状態にする。 
7. タブの上で右クリックし、メニューから「すべてのタブをブックマーク」を選択する。 
8. フォルダ名を任意に指定し、ブックマークフォルダとして保存する。 
9. メニューバーの「ブックマーク」から前の操作で作成されたブックマークフォルダを選択し、最下部の「タブですべて開く」を選択する。 
    - 確認項目 
        1. 一度に複数のタブを開いてよいかどうか確認される。(Tab-3-1)\
            または、確認されない。(Tab-3-2/3) 
10. タブバー上の「+」ボタンをクリックして新しいタブを開く。またはパネルメニューを開き、パネルメニュー内の「新しいウィンドウ」をクリックする。 
    - 確認項目 
        1. 右上に歯車アイコンのある空白ページが表示される。(Tab-5-1)
           または、右上に歯車アイコンのない空白ページが表示される。(Tab-5-2)(Tab-7-2)
           または、タイルが表示される。(Tab-7-1/3/4/5) 
        2. タイルの中に未訪問のページが含まれる。(Tab-7-4)
           または、既訪問のページのみが表示される。(Tab-7-3/5) 
11. 新しいタブ内の歯車ボタンをクリックする。 
    - 確認項目 
        1. 「おすすめサイトも表示」が表示される。(Tab-7-1)
           または、表示されない。(Tab-7-5) 
12. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
13. オプション画面の「一般」を開く。
    - 確認項目
        1. 「タブグループ」配下に「同時に複数のタブを閉じるときは確認する」のチェックボックスがOFFの状態で表示されている。(Tab-1-3)
        2. 「タブグループ」配下に「同時に複数のタブを開いて Firefox
            の動作が遅くなるときは確認する」のチェックボックスがOFFの状態で表示されている。(Tab-3-3) 
14. ロケーションバーに「about:config」と入力し、詳細設定一覧を開いて、各設定値を確認する。 
    - 確認項目 
        1. 「browser.tabs.warnOnCloseOtherTabs」の値がユーザー設定値の「false」である。(Tab-2-3) 

### 後始末

1. 以下のアドオンを有効化する。 
    1. Disable about:config 

## 内蔵PDFビューアの使用

### 確認する項目

- Ui-1-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. globalChrome.css 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
3. オプション画面の「プログラム」を開く。
    - 確認項目 
        1. ファイルの種類「PDF文書（PDF）」（「Adobe Acrobat Document」、「PDFファイル」となっている場合もあるため注意）の取り扱い方法が「Firefoxでプレビュー表示」となっている。(Ui-1-1)
           または、選択肢に「Firefoxでプレビュー表示」が存在しない。(Ui-1-2) 

### 後始末

1. 以下のアドオンを有効化する。 

    1. globalChrome.css 

## タブの音声出力インジケータの使用

### 確認する項目

- Ui-3-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. ロケーションバーに「 https://www.youtube.com 」と入力し、ページを開く。 
3. いずれか1つの動画を開く。
    - 確認項目 
        1. タブ内にスピーカーのアイコンが表示される。(Ui-3-1)\
            または、表示されない。(Ui-3-2) 
        2. タブを「ピン留め」した状態で、タブのアイコンにスピーカーのバッジが表示される。(Ui-3-1)\
            または、表示されない。(Ui-3-2) 

## 認証プロンプトの重複表示の抑止

### 確認する項目

- Ui-4-1 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 外部の埋め込みリソースを2つ以上埋め込んだWebページ（例： http://www.clear-code.com/blog/ ）をホームページに設定する。ホームページを変更できない場合はスキップする。 
3. ユーザー名とパスワードによる認証が必要なHTTP Proxyを用意する。既存のProxyが無い場合は、以下に示す設定例に従い用意する。 
    1. 検証器が到達可能なネットワーク上に、Ubuntu 14.04LTSがセットアップされたホストを用意する。仮に、IPアドレスは{{proxy_host}}であるとする。 
    2. 以下のコマンド列を順に実行し、Apacheをインストールする。 
        1. sudo apt-get install apache2 apache2-utils 
        2. sudo a2enmod proxy\_http 
        3. sudo a2enmod proxy\_connect 
    3. 以下のコマンド列を実行し、認証用のユーザー名（ここでは仮に「{{proxy_auth_user}}」とする）とパスワードを設定する。 
        1. sudo htpasswd -c /etc/apache2/.htpasswd {{proxy_auth_user}} 
    4. /etc/apache2/conf-enabled/forward\_proxy.confの位置に以下の内容でファイルを作成する。 
       
            ProxyRequests On
            ProxyVia On
            
            <Proxy *>
              AuthType Basic
              AuthName "Password Required"
              AuthUserFile /etc/apache2/.htpasswd
              Require user {{proxy_auth_user}}         </Proxy>
       
    5. 以下のコマンド列を実行し、Apacheを再起動する。 
        1. sudo service apache2 restart 
4. Network-2-2の設定を使用し、認証が必要なHTTP Proxyを使用するよう設定する。上記の例に従い用意したProxyの場合、設定は以下のようになる。 
    
        lockPref("network.proxy.type", 1);
        lockPref("network.proxy.http", "{{proxy_host}}");
        lockPref("network.proxy.http\_port", 80);
        lockPref("network.proxy.share\_proxy\_settings", true);

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. Firefox起動時に前回終了時のタブを復元するよう設定し、faviconを持つWebページのタブを2つ以上開く。 
3. Firefoxを再起動する。
    - 検証項目 
        1. HTTP Proxyの認証プロンプトが表示される。(Ui-4-1) 
        2. 1つの認証プロンプトで認証した後2つ目以降の認証プロンプトの入力を求められない。(Ui-4-1) 

### 後始末

1. Network-2-2の設定を元に戻す。 
2. 用意したHTTP Proxyを停止する。 

## その他のWebアプリ向けAPIの使用制限

### 確認する項目

- Script-2-\* 
- Script-3-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. Disable about:config 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. ロケーションバーに「 https://labs.othersight.jp/webpushtest/ 」と入力し、ページを開く。 
    - 確認項目 
        1. ページ内に「Service Worker not available」と表示されている。(Script-2-3) 
3. ロケーションバーに「about:config」と入力し、詳細設定一覧を開いて、各設定値を確認する。 
    - 確認項目 
        1. 「dom.push.enabled」の値が「true」である。(Script-2-1/2)\
            または、「false」である。(Script-2-3) 
        2. 「dom.serviceWorkers.enabled」の値が「true」である。(Script-2-1/2)\
            または、「false」である。(Script-2-3) 
        3. 「dom.gamepad.enabled」の値が「true」である。(Script-3-1)\
            または、「false」である。(Script-3-2) 
4. 確認なしでpush通知を許可する対象のサイトを開き、ページのコンテキストメニューから「ページの情報を表示」を選択して、「ページの情報」ダイアログを開く。 
        1. 「サイト別設定」タブで「通知を受信する」において「許可」にチェックが入っている。(Script-2-2/4) 
5. 「通知を受信する」で、「ブロック」を選択してFirefoxを再起動する。
6. 確認なしでpush通知を許可するよう設定していたサイトのページを開き、「ページの情報」を開いて「サイト別設定」タブを選択する。
    - 確認項目 
        1. 「通知を受信する」で、「標準設定を使用する」のチェックが外れており、「許可」が選択されている。(Script-2-2)
           または、「ブロック」が選択されている。(Script-2-4)

### 後始末

1. 以下のアドオンを有効化する。 

    1. Disable about:config 

## ハードウェアアクセラレーションの使用

### 確認する項目

- Stability-1-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. globalChrome.css 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
3. オプション画面の「詳細」→「一般」を開く。
    - 確認項目 
        1. 「ハードウェアアクセラレーション機能を使用する」にチェックが入っている。(Stability-1-1)\
            または、チェックが入っていない。(Stability-1-2) 

### 後始末

1. 以下のアドオンを有効化する。 
    1. globalChrome.css 

## 新規タブの先読みによる高速化の可否

### 確認する項目

- Tab-9-\*

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    2. globalChrome.css
    3. UI Text Overrider
    1. Disable about:config 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. about:configを開き、以下の設定を行う。既存の値がない場合は新規に作成する。 
   - 「devtools.chrome.enabled」（真偽型）を「true」に設定する。 
3. パネルメニューを開き、パネルメニュー内の「開発ツール」をクリックして、サブメニューの「ブラウザコンソール」をクリックする。
4. 以下のコードをコンソール内で実行する。
   - `gBrowser._isPreloadingEnabled()`
   - 確認項目 
       1. 「true」と表示される。（Tab-9-1）
          または、「false」と表示される。（Tab-9-2）

### 後始末

1. about:configで以下の設定をリセットする。 
    2. 「devtools.chrome.enabled」（真偽型） 
2. 以下のアドオンを有効化する。 
    1. Disable about:config 
    2. globalChrome.css 
    3. UI Text Overrider 

## 表示フォントの設定

### 確認する項目

- Appearance-1-2

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. Disable about:config 
    2. globalChrome.css
    3. UI Text Overrider

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. about:configを開き、以下の設定を行う。
   - 「font.name.serif.ja」（文字列型）を「missing」に設定する。 
   - 「font.name.sans-serif.ja」（文字列型）を「missing」に設定する。 
   - 「font.name.monospace.ja」（文字列型）を「missing」に設定する。 
3. テストケースの「font.html」を開く。
4. 「Serif / セリフ体（明朝）」の箇所を右クリックし、「要素を調査」を選択して、インスペクタ右端の「フォント」をクリックする。
   - 確認項目 
       1. font.name-list.serif.jaに設定したフォントの名前が表示される。（Appearance-1-2）
5. 「Sans-Serif / サンセリフ体（ゴシック）」の箇所を右クリックし、「要素を調査」を選択して、インスペクタ右端の「フォント」をクリックする。
   - 確認項目 
       1. font.name-list.sans-serif.jaに設定したフォントの名前が表示される。（Appearance-1-2）
6. 「Monospace / 等幅」の箇所を右クリックし、「要素を調査」を選択して、インスペクタ右端の「フォント」をクリックする。
   - 確認項目 
       1. font.name-list.monospace.jaに設定したフォントの名前が表示される。（Appearance-1-2）

### 後始末

1. about:configで以下の設定をリセットする。 
    1. 「font.name.serif.ja」（文字列型） 
    2. 「font.name.sans-serif.ja」（文字列型） 
    3. 「font.name.monospace.ja」（文字列型） 
2. 以下のアドオンを有効化する。 
    1. Disable about:config 
    2. globalChrome.css
    3. UI Text Overrider

## ツールバーの項目

### 確認する項目

- Appearance-2-2

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. globalChrome.css
    2. UI Text Overrider

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
   - 確認項目 
       1. ツールバーに表示されている項目が、指定の通りとなっている。（Appearance-2-2）
       2. パネルメニューに表示されている項目が、指定の通りとなっている。（Appearance-2-2）
2. ツールバーカスタマイズで、ツールバーおよびパネルメニューの内容を変更する。
3. Firefoxを再起動する。
   - 確認項目 
       1. ツールバーに表示されている項目が、指定の通りとなっている。（Appearance-2-2）
       2. パネルメニューに表示されている項目が、指定の通りとなっている。（Appearance-2-2）

### 後始末

1. 以下のアドオンを有効化する。 
    1. globalChrome.css
    2. UI Text Overrider

## Webブラウズ操作のその他のカスタマイズ

### 確認する項目

- Ui-2-\*
- Ui-5-\*
- Ui-6-\*
- Script-1-\*
- Script-4-\*
- Script-5-\*
- Performance-1-2
- Performance-2-2

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. Disable about:config 
    2. globalChrome.css
    3. UI Text Overrider

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. コンテンツ領域にフォーカスした状態でF7キーを押す。
   - 確認項目 
       1. キャレットブラウズの開始の可否を尋ねられる。（Ui-2-1）
          または、尋ねられない。（Ui-2-2）
3. ロケーションバーに「 http://www.clear-code.com/blog/ 」と入力し、ページを開く。 
   - 確認項目 
       1. ロケーションバー内に本の形のアイコンが表示される。（Ui-5-1）
          または、表示されない。（Ui-5-2）
4. 記事の末尾のコメント投稿用textareaに「abc」と入力し、ページ内の他の箇所をクリックしてフォーカスを外す。
   - 確認項目 
       1. 「abc」の下に赤い波線が表示される。（Ui-6-1）
          または、表示されない。（Ui-6-2）
5. パネルメニュー内の「開発ツール」をクリックし、サブメニューの「ウェブコンソール」をクリックする。
6. コンソール下部の入力欄に「`alert('OK');alert('OK');alert('OK');`」と入力し、実行する。
    - 確認項目 
        1. 2つ目以降のダイアログに、以後のダイアログを表示しないようにするかどうかを尋ねるチェックボックスが表示される。（Script-1-1）
           または、表示されない。（Script-1-2）
7. コンソール下部の入力欄に「`window.addEventListener('copy', (event) => console.log(event.type)); window.addEventListener('contextmenu', (event) => event.preventDefault());`」と入力し、実行する。
8. コンテンツ内の文字を選択して、キーボードショートカット「Ctrl-C」でコピーする。
    - 確認項目 
        1. コンソール上に「`copy`」という文字が出力される。（Script-4-1）
           または、出力されない。（Script-4-2）
9. コンテンツ領域の上で右クリックする。
    - 確認項目 
        1. コンテキストメニューが開かれない。（Script-5-1）
           または、開かれる。（Script-5-2）
10. Firefoxを終了し、以下のアドオンを有効化する。 
    - globalChrome.css 
11. ロケーションバーに「about:config」と入力し、詳細設定一覧を開いて、各設定値を確認する。 
     - 確認項目 
         1. 「browser.cache.memory.capacity」の値が指定値の通りである。(Performance-1-2) 
         2. 「content.notify.interval」の値が指定値の通りである。(Performance-2-2) 

### 後始末

1. 以下のアドオンを有効化する。 
    1. Disable about:config 
    2. globalChrome.css
    3. UI Text Overrider

<!--======================================================================-->

# ネットワーク処理に関するカスタマイズ

## プロキシの設定

### 確認する項目

- Network-2-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. globalChrome.css 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
3. オプション画面の「詳細」→「ネットワーク」→「接続」→「接続設定」を開く。
    - 確認項目
        1. 「プロキシを使用しない」が選択されている。(Network-2-1)\
            または、「手動でプロキシを設定する」が選択されている。(Network-2-2)\
            または、「自動プロキシ設定スクリプトURL」が選択されている。(Network-2-3)\
            または、「このネットワークのプロキシ設定を自動検出する」が選択されている。(Network-2-4)\
            または、「システムのプロキシ設定を利用する」が選択されている。(Network-2-5) 
        2. 各プロキシが指定通りに設定されている。(Network-2-2) 
        3. 「自動プロキシ設定スクリプトURL」の欄に、予め指定しておいたURLが入力されている。(Network-2-3) 

### 後始末

1. 以下のアドオンを有効化する。 
    1. globalChrome.css 

## その他のネットワーク関連設定

### 確認する項目

- Network-1-1 
- Network-4-1 
- Network-5-2 
- Network-6-\* 
- Network-7-\* 
- Network-8-\*
- Network-9-\*
- Network-10-\*
- Network-11-2
- Network-12-\*

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. Disable about:config 
3. テストケースの「sample.jar」を任意のサーバーに設置し、Content-Type「application/java-archive」を伴って返却されるように設定しておく。
   ファイルの設置先は「{{jar_file_sample_url_base}}/sample.jar」とする。

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. ロケーションバーに「about:config」と入力し、詳細設定一覧を開いて、各設定値を確認する。 
    - 確認項目 
        1. 「general.useragent.extra.microsoftdotnet」が項目として存在しない、もしくは、値が未定義である。(Network-1-1) 
        2. 「network.automatic-ntlm-auth.trusted-uris」の値が「{{ntlm_single_signon_hosts}}」である。(Network-4-1) 
        3. 「network.http.max-connections」の値が6である。(Network-5-2) 
        4. 「network.http.max-persistent-connections-per-server」の値が2である。(Network-5-2) 
        5. 「network.http.max-persistent-connections-per-proxy」の値が2である。(Network-5-2) 
        6. 「network.http.spdy.enabled」の値が「true」である。(Network-6-1)\
            または、「false」である。(Network-6-2) 
        7. 「security.tls.insecure\_fallback\_hosts」の値が未設定または空文字である。(Network-7-1) 
            または、「{{ntlm_single_signon_hosts}}」である。(Network-7-2) 
        8. 「network.dns.disableIPv6」の値が「false」である。(Network-8-1) 
            または、「true」である。(Network-8-2) 
        9. 「network.http.pipelining」の値が「true」である。(Network-9-1) 
            または、「false」である。(Network-9-2) 
        10. 「network.http.proxy.pipelining」の値が「true」である。(Network-9-1) 
            または、「false」である。(Network-9-2) 
        11. 「netwnetwork.dns.blockDotOnion」の値が「false」である。(Network-10-1) 
            または、「true」である。(Network-10-2) 
3. ロケーションバーに「about:support」と入力し、トラブルシューティング情報の一覧を表示する。
    - 確認項目
        1. 「User Agent」の値が「{{user_agent_name}}」である。(Network-11-2) 
4. ロケーションバーに「jar:{{jar_file_sample_url_base}}/sample.jar!/sample.txt」と入力し、開く。
    - 確認項目
        1. 「success」と表示される。（Network-12-1）
           または、読み込みがブロックされた旨のエラーページが表示される。（Network-12-2）

### 後始末

1. 以下のアドオンを有効化する。 
    1. Disable about:config 

<!--======================================================================-->

# 自動更新のカスタマイズ

## Firefoxおよびアドオンの自動更新の制限

### 確認する項目

- Update-1-3 
- Update-2-2 
- Update-3-2
- Update-5-2

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. Disable about:config 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2.  「ヘルプ」→「Firefoxについて」を開く。   
    - 確認項目
        1. 「ソフトウェアの更新」が表示されない。(Update-1-3) 
3. ロケーションバーに「about:config」と入力し、詳細設定一覧を開いて、各設定値を確認する。 
    - 確認項目 
        1. 「app.update.enabled」の値が「false」である。(Update-1-3) 
        2. 「app.update.mode」の値が「0」である。(Update-1-3) 
        3. 「extensions.update.enabled」の値が「false」である。(Update-2-2) 
        4. 「browser.search.update」の値が「false」である。(Update-3-2) 
        5. 「lightweightThemes.update.enabled」の値が「false」である。(Update-5-2) 

### 後始末

1. 以下のアドオンを有効化する。 
    1. Disable about:config 

<!--======================================================================-->

# プラグイン、外部アプリケーション、アドオンのカスタマイズ

## プラグインの制御

### 確認する項目

- Plugin-10-\*

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. NPAPIプラグインを何種類かインストールしておく。
3. 以下のアドオンを無効化する。 
    1. Disable Addons 
4. 各プラグインの制御が可能であるかどうか自体の検証のため、{{mcd_local_file}}に以下の内容を追記する。
   - lockPref("plugin.load_flash_only", false);

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. アドオンマネージャを開き、「プラグイン」を選択する。 
    - 確認項目 
        1. 個別の制御を行っていないNPAPIプラグインが既定の状態で無効化されている。（Plugin-10-1）
           または、有効化されている。（Plugin-10-2）
           または、「実行時に確認する」が選択されている。(Plugin-10-3) 

### 後始末

1. 以下のアドオンを有効化する。 
    1. Disable Addons 
2. {{mcd_local_file}}に加えた変更を元に戻す。

## プラグインの個別制御

### 確認する項目

- Security-24-\*
- Plugin-1-\* 
- Plugin-2-\* 
- Plugin-3-\* 
- Plugin-4-\* 
- Plugin-5-\* 
- Plugin-6-\* 
- Plugin-7-\* 
- Plugin-8-\* 
- Plugin-9-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 「 {{java_download_url}} 」からJavaプラグインのインストーラをダウンロードし、インストールしておく。(Plugin-1-\*) 
3. 「 {{flash_download_url}} 」からAdobe Flash プラグインのインストーラをダウンロードし、インストールしておく。(Plugin-2-\*) 
4. 「 {{acrobat__download_url}} 」からAdobe Acrobat Reader プラグインのインストーラをダウンロードし、インストールしておく。(Plugin-3-\*) 
5. 「 {{shockwave__download_url}} 」からAdobe Shockwave プラグインのインストーラをダウンロードし、インストールしておく。(Plugin-4-\*) 
6. 「[SilverlightDownloadUrl]({{silverlight_download_url}})」からSilverlight プラグインのインストーラをダウンロードし、インストールしておく。(Plugin-5-\*) 
7. 「 {{wmp__download_url}} 」からWindows Media Playerプラグインをダウンロードし、インストールしておく。(Plugin-6-\*) 
//
8. Cisco WebExプラグインを入手し、インストールしておく。（※メタインストーラにnpatgpc.dllを含めているときはスキップ）(Plugin-7-\*) 
9. Icead Teaプラグインをシステムにインストールしておく。
9. 以下のアドオンを無効化する。 
    1. Disable Addons 
10. 各プラグインの制御が可能であるかどうか自体の検証のため、各設定ファイルに以下の内容を追記する。
    - {{mcd_local_file}}:

        ~~~
        lockPref("plugin.load_flash_only", false);

        lockPref("plugin.state.java", 2);
        lockPref("plugin.state.npdeployjava", 2);
        lockPref("plugin.state.flash", 2);
        lockPref("plugin.state.nppdf", 2);
        lockPref("plugin.state.np32dsw", 2);
        lockPref("plugin.state.npctrl", 2);
        lockPref("plugin.state.np-mswmp", 2);
        lockPref("plugin.state.npatgpc", 2);
        lockPref("plugin.state.libnpjp", 2);

        lockPref("extensions.autopermission.sites.example.com", [
          "plugin:java=3",
          "plugin-vulnerable:java=3",
          "plugin:npdeployjava=3",
          "plugin-vulnerable:npdeployjava=3",
          "plugin:flash=3",
          "plugin-vulnerable:flash=3",
          "plugin:nppdf=3",
          "plugin-vulnerable:nppdf=3",
          "plugin:np32dsw=3",
          "plugin-vulnerable:np32dsw=3",
          "plugin:npctrl=3",
          "plugin-vulnerable:npctrl=3",
          "plugin:np-mswmp=3",
          "plugin-vulnerable:np-mswmp=3",
          "plugin:npatgpc=3",
          "plugin-vulnerable:npatgpc=3",
          "plugin:libnpjp=3",
          "plugin-vulnerable:libnpjp=3"
        ].join(','));
        clearPref("extensions.autopermission.sites.example.com.lastValue");
        ~~~

    - default.permissions:

        ~~~
        host	plugin:java	3	http://example.net
        host	plugin-vulnerable:java	3	http://example.net
        host	plugin:npdeployjava	3	http://example.net
        host	plugin-vulnerable:npdeployjava	3	http://example.net
        host	plugin:flash	3	http://example.net
        host	plugin-vulnerable:flash	3	http://example.net
        host	plugin:nppdf	3	http://example.net
        host	plugin-vulnerable:nppdf	3	http://example.net
        host	plugin:np32dsw	3	http://example.net
        host	plugin-vulnerable:np32dsw	3	http://example.net
        host	plugin:npctrl	3	http://example.net
        host	plugin-vulnerable:npctrl	3	http://example.net
        host	plugin:np-mswmp	3	http://example.net
        host	plugin-vulnerable:np-mswmp	3	http://example.net
        host	plugin:npatgpc	3	http://example.net
        host	plugin-vulnerable:npatgpc	3	http://example.net
        host	plugin:libnpjp	3	http://example.net
        host	plugin-vulnerable:libnpjp	3	http://example.net
        ~~~


### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. アドオンマネージャを開き、「プラグイン」を選択する。 
    - 確認項目 
        1. Javaプラグインの項目が表示されており、「無効化する」が選択されている。(Plugin-1-1)\
            または、「常に有効化する」が選択されている。(Plugin-1-2)\
            または、「実行時に確認する」が選択されている。(Plugin-1-3) 
        2. Adobe Flashプラグインの項目が表示されており、「無効化する」が選択されている。(Plugin-2-1)\
            または、「常に有効化する」が選択されている。(Plugin-2-2)\
            または、「実行時に確認する」が選択されている。(Plugin-2-3) 
        3. Adobe Readerプラグインの項目が表示されており、「無効化する」が選択されている。(Plugin-3-1)\
            または、「常に有効化する」が選択されている。(Plugin-3-2)\
            または、「実行時に確認する」が選択されている。(Plugin-3-3) 
        4. Adobe Shockwaveプラグインの項目が表示されており、「無効化する」が選択されている。(Plugin-4-1)\
            または、「常に有効化する」が選択されている。(Plugin-4-2)\
            または、「実行時に確認する」が選択されている。(Plugin-4-3) 
        5. Silverlightプラグインの項目が表示されており、「無効化する」が選択されている。(Plugin-5-1)\
            または、「常に有効化する」が選択されている。(Plugin-5-2)\
            または、「実行時に確認する」が選択されている。(Plugin-5-3) 
        6. Windows Media Playerプラグインの項目が表示されており、「無効化する」が選択されている。(Plugin-6-1)\
            または、「常に有効化する」が選択されている。(Plugin-6-2)\
            または、「実行時に確認する」が選択されている。(Plugin-6-3) 
        7. Cisco WebExプラグインの項目（ActiveTouch General Plugin Container）が表示されており、「無効化する」が選択されている。(Plugin-7-1)\
            または、「常に有効化する」が選択されている。(Plugin-7-2)\
            または、「実行時に確認する」が選択されている。(Plugin-7-3) 
        8. Icead Teaプラグインの項目が表示されており、「無効化する」が選択されている。(Plugin-9-1)\
            または、「常に有効化する」が選択されている。(Plugin-9-2)\
            または、「実行時に確認する」が選択されている。(Plugin-9-3) 
        8. OpenH264のプラグインが表示される。(Plugin-8-1)\
            または、表示されない。(Plugin-8-2) 
        9. 「Primetime Content Decryption
            Module」が表示される。(Plugin-8-1)\
            または、表示されない。(Plugin-8-2) 
3. Flashプラグインの「設定」ボタンをクリックする。
    - 確認項目 
        1. 「Adobe Flashの保護モードを有効化」にチェックが入っている。（Security-24-1）
           または、チェックが入っていない。（Security-24-2）
3. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
    - 確認項目 
        1. 「コンテンツ」配下に「DRMコンテンツ」グループがある。(Plugin-8-1)\
            または、無い。(Plugin-8-2) 
4. 各プラグインのサイト別制御が可能であるかどうか自体の検証のため、「 http://example.com 」を開き、ページのコンテキストメニューから「ページの情報を表示」を選択して、「ページの情報」ダイアログを開き、「サイト別設定」タブを選択する。 
        1. 各プラグインの設定が「毎回確認する」になっている。
4. 各プラグインのサイト別制御が可能であるかどうか自体の検証のため、「 http://example.net 」を開き、ページのコンテキストメニューから「ページの情報を表示」を選択して、「ページの情報」ダイアログを開き、「サイト別設定」タブを選択する。 
        1. 各プラグインの設定が「毎回確認する」になっている。

### 後始末

1. 以下のアドオンを有効化する。 
    1. Disable Addons
2. 各プラグインの制御が可能であるかどうか自体の検証のために追加した設定を削除する。

## ファイルをダウンロードして外部アプリケーションで開く際の挙動の制御

### 確認する項目

- External-1-\* 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. エクスプローラを起動して、アドレスバーに「%temp%」と入力し、システムのテンポラリフォルダを開く。 
3. ファイルを更新日時順で並べ替えて、新しいファイルが出現したら分かるようにしておく。 
4. この検証手順書自体のファイルをWebサーバにアップロードするか、「odt sample」のようなキーワードでWebを検索するなどして、外部アプリケーションで開く必要があるファイルのダウンロード用リンクを用意しておく。 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. 外部アプリケーションで開く必要があるファイルへのリンクをクリックする。 
3. 「次のファイルを開こうとしています」のダイアログが表示されたら、起動する外部アプリケーションを選択して「OK」をクリックする。 
4. テンポラリフォルダの内容を確認する。 
    - 確認項目 
        1. ダウンロードしたファイルがテンポラリフォルダに保存されている。(External-1-1/2) 
        2. テンポラリファイルのプロパティにおいて、「読み取り専用」にチェックが入っている。(External-1-1) 
           または、チェックが入っていない。(External-1-2) 
4. 外部アプリケーションを終了しFirefoxも終了して、テンポラリフォルダの内容を確認する。 
    - 確認項目 
        1. ダウンロードしたファイルがテンポラリフォルダから消えている。(External-1-1) 
           または、テンポラリフォルダに残っている。(External-1-2) 

## IE Viewの制御

### 確認する項目

- Addon-IEView-1-2
- Addon-IEView-2-1
- Addon-IEView-3-2

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. globalChrome.css
    2. UI Text Overrider

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. 自動的にIEを起動するよう設定されたページへのリンクがあるページを開き、そのリンクをクリックする。
    - 確認項目 
        1. IEが起動する。（Addon-IEView-1-2）
        2. 指定したパスのIEが起動しており、指定したオプションも反映されている。（Addon-IEView-2-1）
3. 自動的にIEを起動するよう設定されたページ以外のページを開く。
4. パネルメニュー内の「開発ツール」をクリックし、サブメニューの「インスペクター」をクリックする。
5. 「HTMLを検索」欄に「#src_xsale」と入力し、Enterキーを押す。
    - 確認項目 
        1. 「見つかりませんでした。」と表示される。（Addon-IEView-3-2）

### 後始末

1. 以下のアドオンを有効化する。 
    1. globalChrome.css
    2. UI Text Overrider


<!--======================================================================-->

# キーボードショートカット、メニュー項目のカスタマイズ

## タブとウィンドウの操作

### 確認する項目

- MenuShortcut-1 
- MenuShortcut-2 
- MenuShortcut-3 
- MenuShortcut-4 
- MenuShortcut-5 
- MenuShortcut-10 
- MenuShortcut-62 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. ロケーションバーに「about:」と入力し、Alt-Enterでタブとして開く。 
3. 開かれたタブを閉じる。 
4. ロケーションバーに「about:」と入力し、Alt-Enterでタブとして開く。 
5. 開かれたタブをドラッグしてウィンドウ外にドロップし、ウィンドウとして開く。 
6. 開かれたウィンドウを閉じる。 
    - 確認項目 
        1. 「Ctrl-Shift-T」を押して、閉じたタブが復元されない。(MenuShortcut-1) 
        2. 「Ctrl-Shift-N」を押して、閉じたウィンドウが復元されない。(MenuShortcut-2) 
        3. 「Ctrl-Shift-P」を押して、新しいプライベートウィンドウが開かれない。(MenuShortcut-3) 
        4. 「Ctrl-T」を押して、新しいタブが開かれない。(MenuShortcut-62) 
7. 「ファイル」メニューを開く。 
    - 確認項目 
        1. 「新しいプライベートウィンドウを開く」が存在しない。(MenuShortcut-3) 
        2. 「ページのURLをメールで送信」が存在しない。(MenuShortcut-4) 
        3. 「オフライン作業」が存在しない。(MenuShortcut-5) 
        4. 「新しいタブ」が存在しない。(MenuShortcut-62) 
8. 「履歴」メニューを開く。 
    - 確認項目 
        1. 「最近閉じたタブ」が存在しない。(MenuShortcut-1) 
        2. 「最近閉じたウィンドウ」が存在しない。(MenuShortcut-2) 
8. 「ツール」メニューを開く。 
    - 確認項目 
        1. 「ウェブ開発」が存在しない。(MenuShortcut-10) 
        2. 「ページ情報」の前にセパレータが存在しない。(MenuShortcut-10) 
9. タブの上で右クリックする。 
    - 確認項目 
        1. 「閉じたタブを開き直す」が存在しない。(MenuShortcut-1) 
10. タブバーの「+」ボタン上で右クリックする。 
    - 確認項目 
        1. 「閉じたタブを開き直す」が存在しない。(MenuShortcut-1) 
11. パネルメニューを開く。 
    - 確認項目 
        1. 「新しいプライベートウィンドウ」が存在しない。(MenuShortcut-3) 
12. パネルメニュー内の「履歴」をクリックする。
    - 確認項目 
        1. 「最近閉じたタブ」セクションが存在しない。(MenuShortcut-1) 
        2. 「最近閉じたウィンドウ」セクションが存在しない。(MenuShortcut-2) 
13. パネルメニュー内の「開発ツール」をクリックする。
    - 確認項目 
        1. 「オフライン作業」セクションが存在しない。(MenuShortcut-5) 
14. パネルメニュー内の「カスタマイズ」をクリックしてツールバーのカスタマイズ画面を開く。 
    - 確認項目 
        1. 「ページのURLをメールで送信」が存在しない。(MenuShortcut-4) 
        2. 「開発ツール」が存在しない。(MenuShortcut-10) 

## ツール

### 確認する項目

- MenuShortcut-7 
- MenuShortcut-11 
- MenuShortcut-12 
- MenuShortcut-13 
- MenuShortcut-14 
- MenuShortcut-15 
- MenuShortcut-16 
- MenuShortcut-17 
- MenuShortcut-18 
- MenuShortcut-20 
- MenuShortcut-21 
- MenuShortcut-22 
- MenuShortcut-23 
- MenuShortcut-24 
- MenuShortcut-25 
- MenuShortcut-26 
- MenuShortcut-28 
- MenuShortcut-29 
- MenuShortcut-64

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
    - 確認項目 
        1. 「Ctrl-J」を押して、ダウンロード済みファイル一覧が開かれない。(MenuShortcut-7) 
        2. 「Ctrl-Shift-I」を押して、開発ツールが開かれない。(MenuShortcut-11) 
        3. 「F12」を押して、開発ツールが開かれない。(MenuShortcut-11) 
        4. 「Ctrl-Shift-C」を押して、インスペクタが開かれない。(MenuShortcut-12) 
        5. 「Ctrl-Shift-K」を押して、Webコンソールが開かれない。(MenuShortcut-13) 
        6. 「Ctrl-Shift-S」を押して、デバッガが開かれない。(MenuShortcut-14) 
        7. 「Shift-F7」を押して、スタイルエディタが開かれない。(MenuShortcut-15) 
        8. 「Shift-F5」を押して、プロファイラが開かれない。(MenuShortcut-16) 
        9. 「Ctrl-Shift-Q」を押して、ネットワークモニターが開かれない。(MenuShortcut-17) 
        10. 「Shitf-F2」を押して、開発ツールバーが開かれない。(MenuShortcut-18) 
        11. 「Shift-F8」を押して、WebIDEが開かれない。(MenuShortcut-20) 
        12. 「Ctrl-Shift-Alt-I」を押して、ブラウザツールボックスが開かれない。(MenuShortcut-21) 
        13. 「Ctrl-Shift-J」を押して、ブラウザコンソールが開かれない。(MenuShortcut-22) 
        14. 「Ctrl-Shift-M」を押して、レスポンシブデザインビューが開かれない。(MenuShortcut-23) 
        15. 「Shift-F4」を押してスクラッチパッド、が開かれない。(MenuShortcut-25) 
        16. 「Ctrl-U」を押して、ページのソースが開かれない。(MenuShortcut-26) 
2. 「ツール」メニューを開く。 
    - 確認項目 
        1. 「ダウンロード」が存在しない。(MenuShortcut-7) 
2. 「ツール」メニュー内の「ウェブ開発」を開く。 
    - 確認項目 
        1. 「開発ツールを表示」が存在しない。(MenuShortcut-11) 
        2. 「インスペクタ」が存在しない。(MenuShortcut-12) 
        3. 「Webコンソール」が存在しない。(MenuShortcut-13) 
        4. 「デバッガ」が存在しない。(MenuShortcut-14) 
        5. 「スタイルエディタ」が存在しない。(MenuShortcut-15) 
        6. 「パフォーマンス」が存在しない。(MenuShortcut-16) 
        7. 「ネットワーク」が存在しない。(MenuShortcut-17) 
        8. 「開発ツールバー」が存在しない。(MenuShortcut-18) 
        9. 「WebIDE」が存在しない。(MenuShortcut-20) 
        10. 「ブラウザツールボックス」が存在しない。(MenuShortcut-21) 
        11. 「ブラウザコンソール」が存在しない。(MenuShortcut-22) 
        12. 「レスポンシブデザインビュー」が存在しない。(MenuShortcut-23) 
        13. 「スポイト」が存在しない。(MenuShortcut-24) 
        14. 「スクラッチパッド」が存在しない。(MenuShortcut-25) 
        15. 「ページのソース」が存在しない。(MenuShortcut-26) 
        16. 「接続...」が存在しない。(MenuShortcut-28) 
        17. 「その他のツールを入手」が存在しない。(MenuShortcut-29) 
        18. 「Service Worker」が存在しない（MenuShortcut-64）
3. パネルメニューを開き、パネルメニュー内の「開発ツール」をクリックする。
    - 確認項目 
        1. 「開発ツールを表示」が存在しない。(MenuShortcut-11) 
        2. 「インスペクタ」が存在しない。(MenuShortcut-12) 
        3. 「Webコンソール」が存在しない。(MenuShortcut-13) 
        4. 「デバッガ」が存在しない。(MenuShortcut-14) 
        5. 「スタイルエディタ」が存在しない。(MenuShortcut-15) 
        6. 「パフォーマンス」が存在しない。(MenuShortcut-16) 
        7. 「ネットワーク」が存在しない。(MenuShortcut-17) 
        8. 「開発ツールバー」が存在しない。(MenuShortcut-18) 
        9. 「WebIDE」が存在しない。(MenuShortcut-20) 
        10. 「ブラウザツールボックス」が存在しない。(MenuShortcut-21) 
        11. 「ブラウザコンソール」が存在しない。(MenuShortcut-22) 
        12. 「レスポンシブデザインビュー」が存在しない。(MenuShortcut-23) 
        13. 「スポイト」が存在しない。(MenuShortcut-24) 
        14. 「スクラッチパッド」が存在しない。(MenuShortcut-25) 
        15. 「ページのソース」が存在しない。(MenuShortcut-26) 
        16. 「接続...」が存在しない。(MenuShortcut-28) 
        17. 「その他のツールを入手」が存在しない。(MenuShortcut-29) 
        18. 「Service Worker」が存在しない（MenuShortcut-64）
4. パネルメニュー内の「カスタマイズ」をクリックしてツールバーのカスタマイズ画面を開く。 
    - 確認項目 
        1. 「ダウンロード」が存在しない。(MenuShortcut-7) 

## ヘルプ

### 確認する項目

- MenuShortcut-30 
- MenuShortcut-31 
- MenuShortcut-32 
- MenuShortcut-33 
- MenuShortcut-35 
- MenuShortcut-36 
- MenuShortcut-37 
- MenuShortcut-38 
- MenuShortcut-39 
- MenuShortcut-40 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. 「ヘルプ」メニューを開く。 
    - 確認項目 
        1. 「Firefoxヘルプ」が存在しない。(MenuShortcut-30) 
        2. 「Firefoxツアー」が存在しない。(MenuShortcut-31) 
        3. 「キーボードショートカット」が存在しない。(MenuShortcut-32) 
        4. 「Firefoxヘルスレポート」が存在しない。(MenuShortcut-33) 
        5. 「トラブルシューティング情報」が存在しない。(MenuShortcut-35) 
        6. 「フィードバックを送信」が存在しない。(MenuShortcut-36) 
        7. 「アドオンを無効にして再起動」が存在しない。(MenuShortcut-37) 
        8. 「詐欺サイトを報告」が存在しない。(MenuShortcut-38) 
        9. 「誤警告を報告」が存在しない。(MenuShortcut-39) 
        10. 「Firefoxについて」の前にセパレータが存在しない。(MenuShortcut-40) 
3. パネルメニューを開き、パネルメニュー内の「？」をクリックする。
    - 確認項目 
        1. 「Firefoxヘルプ」が存在しない。(MenuShortcut-30) 
        2. 「Firefoxツアー」が存在しない。(MenuShortcut-31) 
        3. 「キーボードショートカット」が存在しない。(MenuShortcut-32) 
        4. 「Firefoxヘルスレポート」が存在しない。(MenuShortcut-33) 
        5. 「トラブルシューティング情報」が存在しない。(MenuShortcut-35) 
        6. 「フィードバックを送信」が存在しない。(MenuShortcut-36) 
        7. 「アドオンを無効にして再起動」が存在しない。(MenuShortcut-37) 
        8. 「詐欺サイトを報告」が存在しない。(MenuShortcut-38) 
        9. 「誤警告を報告」が存在しない。(MenuShortcut-39) 
        10. 「Firefoxについて」の前にセパレータが存在しない。(MenuShortcut-40) 

## 書字方向の切り替えの制御

### 確認する項目

- MenuShortcut-41 
- MenuShortcut-42 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. Disable about:config 

### 検証

1. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. ロケーションバーに「about:config」と入力し、詳細設定一覧を開いて、「bidi.browser.ui」の値を「true」に設定する。 
3. Firefoxを終了する。 
4. {{desktop_shortcut_path}} がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。  
5. 「 https://addons.mozilla.org/ 」など、テキスト入力欄があるWebページを開く。 
6. テキスト入力欄をクリックしてフォーカスした状態にする。 
    - 確認項目 
        1. 「Ctrl-Shift-X」を押して、テキスト入力欄の書字方向が切り替わらない(MenuShortcut-41) 
6. テキスト入力欄の中で右クリックしてコンテキストメニューを開く。 
    - 確認項目 
        1. 「テキストの記述方向を切り替える」が存在しない。(MenuShortcut-41) 
        2. 「スペルチェックを行う」の下にセパレータが存在しない。(MenuShortcut-41)
6. ページ内の何もない所で右クリックしてコンテキストメニューを開く。 
    - 確認項目 
        1. 「ページの記述方向を切り替える」が存在しない。(MenuShortcut-42) 
        2. 「ページの情報を表示」の下にセパレータが存在しない。(MenuShortcut-42) 
7. 「編集」メニューを開く。 
    - 確認項目 
        1. 「テキストの記述方向を切り替える」が存在しない。(MenuShortcut-41) 
8. 「表示」メニューを開く。 
    - 確認項目 
        1. 「ページの記述方向を切り替える」が存在しない。(MenuShortcut-42) 

### 後始末

1. 以下のアドオンを有効化する。 
    1. Disable about:config 

## 履歴とブックマーク

### 確認する項目

- MenuShortcut-43 
- MenuShortcut-44 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. 「履歴」メニューを開く。 
    - 確認項目 
        1. メニュー内に、セパレータが単独で2連続表示されている箇所がない。(MenuShortcut-43) 
3. 「ブックマーク」メニューを開く。 
    - 確認項目 
        1. 「ブックマークツールバー」が存在しない。(MenuShortcut-44) 
        2. メニュー内に、セパレータが単独で2連続表示されている箇所がない。(MenuShortcut-44) 
2. ツールバー上のブックマークボタンをクリックし、ブックマーク一覧を開く。 
    - 確認項目 
        1. 「ブックマークツールバー」が存在しない。(MenuShortcut-44) 
        2. メニュー内に、セパレータが単独で2連続表示されている箇所がない。(MenuShortcut-44) 
4. ツールバー上のブックマークボタンの上で右クリックし、「メニューに移動」を選択する。 
5. パネルメニューを開き、パネルメニュー内の「ブックマーク」をクリックする。
    - 確認項目 
        1. 「ブックマークツールバー」が存在しない。(MenuShortcut-44) 
        2. メニュー内に、セパレータが単独で2連続表示されている箇所がない。(MenuShortcut-44) 

## コンテンツ領域のコンテキストメニュー

### 確認する項目

- MenuShortcut-46 
- MenuShortcut-47 
- MenuShortcut-48 
- MenuShortcut-49 
- MenuShortcut-50 
- MenuShortcut-51 
- MenuShortcut-52 
- MenuShortcut-54 
- MenuShortcut-55 
- MenuShortcut-57 
- MenuShortcut-63 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. 「 https://addons.mozilla.org 」を開き、何もない所で右クリックする。 
    - 確認項目 
        1. 「このページを共有」が存在しない。(MenuShortcut-52) 
        2. 「要素を調査」が存在しない。(MenuShortcut-57) 
3. ページ内の文字列を選択して右クリックする。 
    - 確認項目 
        1. 「選択範囲を共有」が存在しない。(MenuShortcut-54) 
4. ページ内のリンクの上で右クリックする。 
    - 確認項目 
        1. 「このリンクを共有」が存在しない。(MenuShortcut-46) 
        2. 「新しいタブで開く」が存在しない。(MenuShortcut-63) 
5. ページ内に埋め込まれた画像の上で右クリックする。 
    - 確認項目 
        1. 「画像のURLをメールで送信」が存在しない。(MenuShortcut-47) 
        2. 「この画像を共有」が存在しない。(MenuShortcut-48) 
        3. 「デスクトップの背景に設定」が存在しない。(MenuShortcut-55) 
6. 「 http://www.w3schools.com/html/html5\_video.asp 」を開き、ページ内に埋め込まれた動画の上で右クリックする。 
    - 確認項目 
        1. 「動画のURLをメールで送信」が存在しない。(MenuShortcut-49) 
        2. 「この動画を共有」が存在しない。(MenuShortcut-50) 
2. 「 http://www.w3schools.com/html/tryit.asp?filename=tryhtml5\_audio\_all 」を開き、ページ内に埋め込まれたオーディオコントロールの上で右クリックする。 
    - 確認項目 
        1. 「オーディオのURLをメールで送信」が存在しない。(MenuShortcut-51) 

## ポップアップブロック

### 確認する項目

- MenuShortcut-58 
- MenuShortcut-59 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のカスタマイズを無効化する。 
    1. Security-4-2/3/4 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. テストケースの「popupblock.html」を開く。 
    - 確認項目 
        1. 「1個のポップアップがブロックされました」と表示される。(MenuShortcut-58/59) 
3. 「設定」ボタンをクリックする。 
    - 確認項目 
        1. 「このサイトによるポップアップを許可する」が存在しない。(MenuShortcut-58) 
        2. 「ポップアップブロック設定を変更」が存在しない。(MenuShortcut-59) 

### 後始末

1. 以下のカスタマイズを有効化する。 
    1. Security-4-2/3/4 

<!--======================================================================-->

# その他のUIの非表示化

## 設定UIの非表示化

### 確認する項目

- Hide-1 
- Hide-2 
- Hide-3 
- Hide-6 
- Hide-7 
- Hide-9 
- Hide-10 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
    - 確認項目
        1. タブバー上に「+」ボタン（新しいタブを開くボタン）が表示されない。(Hide-6) 
2. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
    - 確認項目
        1. 「セキュリティ」が表示されない。(Hide-1) 
        2. 「Sync」が表示されない。（Hide-2） 
        3. 「？」ボタン（ヘルプボタン）が表示されない。(Hide-3) 
3. 「一般」を選択する。
    - 確認項目
        1. 「タブグループ」以下に「新しいウィンドウではなく新しいタブで開く」が表示されない。(Hide-7) 
        2. 「ダウンロード」グループが表示されない。(Hide-9) 
4. 「表示」メニューを開き、「ズーム」→「拡大」をクリックしてページを拡大表示する。 
    - 確認項目 
        1. ロケーションバーの右端に拡大・縮小表示倍率ボタンが表示されない。（Hide-10）

## パーミッション設定UIの非表示化

### 確認する項目

- Hide-4 

### 準備

1. 前項に引き続き検証するか、または以下の状態を整えておく。 
    1. カスタマイズ済みFirefoxのインストールが完了した状態にする。 
2. 以下のアドオンを無効化する。 
    1. Disable Addons 
3. 以下のカスタマイズを無効化する。 
    1. Security-4-3（ポップアップブロックを有効化する）：{{mcd_local_file}}/autoconfig.jscから項目を削除 
    2. Privacy-6-3（オフラインキャッシュの設定UIを有効化する）：globalChrome.cssと{{mcd_local_file}}/autoconfig.jscから項目を削除 
    3. Hide-1（「セキュリティ」ペインを有効化する）：globalChrome.cssから項目を削除 

### 検証

1. {{desktop_shortcut_path}}がある場合はそれを、なければfirefox.exeをダブルクリックしてFirefoxを起動する。
2. パネルメニューを開き、パネルメニュー内の「オプション」をクリックする。
3. 「コンテンツ」ペインを選択し、「ポップアップ」の「許可サイト」ボタンをクリックする。 
    - 確認項目 
        1. 「サイトのアドレス」の入力欄が表示されない。(Hide-4) 
        2. 「サイトを削除」ボタンが表示されない。(Hide-4) 
        3. 「すべてのサイトを削除」ボタンが表示されない。(Hide-4) 
4. 「セキュリティ」ペインを選択し、「一般」の「許可サイト」ボタンをクリックする。 
    - 確認項目 
        1. 「サイトのアドレス」の入力欄が表示されない。(Hide-4) 
        2. 「サイトを削除」ボタンが表示されない。(Hide-4) 
        3. 「すべてのサイトを削除」ボタンが表示されない。(Hide-4) 
5. 「詳細」ペイン→「ネットワーク」タブを選択し、「例外サイト」ボタンをクリックする。 
    - 確認項目 
        1. 「サイトのアドレス」の入力欄が表示されない。(Hide-4) 
        2. 「サイトを削除」ボタンが表示されない。(Hide-4) 
        3. 「すべてのサイトを削除」ボタンが表示されない。(Hide-4) 

### 後始末

1. 以下のアドオンを有効化する。 
    1. Disable Addons 
2. 以下のカスタマイズを有効化する。 
    1. Security-4-3 
    2. Privacy-6-3 
    3. Hide-1 


