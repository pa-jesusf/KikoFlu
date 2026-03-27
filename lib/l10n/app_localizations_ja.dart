// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class SJa extends S {
  SJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'KikoFlu';

  @override
  String get navHome => 'ホーム';

  @override
  String get navSearch => '検索';

  @override
  String get navMy => 'マイ';

  @override
  String get navSettings => '設定';

  @override
  String get offlineModeMessage =>
      'オフラインモード：ネットワーク接続に失敗しました。ダウンロード済みコンテンツのみアクセスできます';

  @override
  String get retry => '再試行';

  @override
  String get searchTypeKeyword => 'キーワード';

  @override
  String get searchTypeTag => 'タグ';

  @override
  String get searchTypeVa => '声優';

  @override
  String get searchTypeCircle => 'サークル';

  @override
  String get searchTypeRjNumber => 'RJ番号';

  @override
  String get searchHintKeyword => '作品名やキーワードを入力...';

  @override
  String get searchHintTag => 'タグ名を入力...';

  @override
  String get searchHintVa => '声優名を入力...';

  @override
  String get searchHintCircle => 'サークル名を入力...';

  @override
  String get searchHintRjNumber => '番号を入力...';

  @override
  String get ageRatingAll => 'すべて';

  @override
  String get ageRatingGeneral => '全年齢';

  @override
  String get ageRatingR15 => 'R-15';

  @override
  String get ageRatingAdult => '成人向け';

  @override
  String get salesRangeAll => 'すべて';

  @override
  String get sortRelease => '発売日';

  @override
  String get sortCreateDate => '登録日';

  @override
  String get sortRating => '評価';

  @override
  String get sortReviewCount => 'レビュー数';

  @override
  String get sortRandom => 'ランダム';

  @override
  String get sortDlCount => '販売数';

  @override
  String get sortPrice => '価格';

  @override
  String get sortNsfw => '全年齢';

  @override
  String get sortUpdatedAt => 'マーク日時';

  @override
  String get sortAsc => '昇順';

  @override
  String get sortDesc => '降順';

  @override
  String get sortOptions => '並べ替えオプション';

  @override
  String get sortField => '並べ替え項目';

  @override
  String get sortDirection => '並べ替え方向';

  @override
  String get displayModeAll => 'すべて';

  @override
  String get displayModePopular => '人気';

  @override
  String get displayModeRecommended => 'おすすめ';

  @override
  String get subtitlePriorityHighest => '優先';

  @override
  String get subtitlePriorityLowest => '後回し';

  @override
  String get translationSourceGoogle => 'Google 翻訳';

  @override
  String get translationSourceYoudao => 'Youdao 翻訳';

  @override
  String get translationSourceMicrosoft => 'Microsoft 翻訳';

  @override
  String get translationSourceLlm => 'LLM 翻訳';

  @override
  String get progressMarked => '気になる';

  @override
  String get progressListening => '聴取中';

  @override
  String get progressListened => '聴取済み';

  @override
  String get progressReplay => '再聴';

  @override
  String get progressPostponed => '保留';

  @override
  String get loginTitle => 'ログイン';

  @override
  String get register => '登録';

  @override
  String get addAccount => 'アカウント追加';

  @override
  String get registerAccount => 'アカウント登録';

  @override
  String get username => 'ユーザー名';

  @override
  String get password => 'パスワード';

  @override
  String get serverAddress => 'サーバーアドレス';

  @override
  String get login => 'ログイン';

  @override
  String get loginSuccess => 'ログイン成功';

  @override
  String get loginFailed => 'ログイン失敗';

  @override
  String get registerFailed => '登録失敗';

  @override
  String get usernameMinLength => 'ユーザー名は5文字以上必要です';

  @override
  String get passwordMinLength => 'パスワードは5文字以上必要です';

  @override
  String accountAdded(String username) {
    return 'アカウント「$username」が追加されました';
  }

  @override
  String get testConnection => '接続テスト';

  @override
  String get testing => 'テスト中...';

  @override
  String get enterServerAddressToTest => 'サーバーアドレスを入力して接続テストしてください';

  @override
  String latencyMs(String ms) {
    return '${ms}ms';
  }

  @override
  String get connectionFailed => '接続失敗';

  @override
  String get guestModeTitle => 'ゲストモードの確認';

  @override
  String get guestModeMessage =>
      'ゲストモードは機能が制限されています：\n\n• 作品のマークや評価ができません\n• プレイリストの作成ができません\n• 進捗の同期ができません\n\nゲストモードはデモアカウントでサーバーに接続するため、不安定になる場合があります。';

  @override
  String get continueGuestMode => 'ゲストモードで続行';

  @override
  String get guestAccountAdded => 'ゲストアカウントが追加されました';

  @override
  String get guestLoginFailed => 'ゲストログイン失敗';

  @override
  String get guestMode => 'ゲストモード';

  @override
  String get cancel => 'キャンセル';

  @override
  String get confirm => '確定';

  @override
  String get close => '閉じる';

  @override
  String get delete => '削除';

  @override
  String get save => '保存';

  @override
  String get edit => '編集';

  @override
  String get add => '追加';

  @override
  String get create => '作成';

  @override
  String get ok => 'OK';

  @override
  String get search => '検索';

  @override
  String get filter => 'フィルター';

  @override
  String get advancedFilter => '詳細フィルター';

  @override
  String get enterSearchContent => '検索内容を入力してください';

  @override
  String get searchTag => 'タグを検索...';

  @override
  String get minRating => '最低評価';

  @override
  String minRatingStars(String stars) {
    return '$starsつ星';
  }

  @override
  String get searchHistory => '検索履歴';

  @override
  String get clearSearchHistory => '検索履歴をクリア';

  @override
  String get clearSearchHistoryConfirm => 'すべての検索履歴をクリアしますか？';

  @override
  String get clear => 'クリア';

  @override
  String get searchHistoryCleared => '検索履歴をクリアしました';

  @override
  String get noSearchHistory => '検索履歴はありません';

  @override
  String get excludeMode => '除外';

  @override
  String get includeMode => '含む';

  @override
  String get noResults => '結果なし';

  @override
  String get loadFailed => '読み込み失敗';

  @override
  String loadFailedWithError(String error) {
    return '読み込み失敗: $error';
  }

  @override
  String get loading => '読み込み中...';

  @override
  String get calculating => '計算中...';

  @override
  String get getFailed => '取得失敗';

  @override
  String get settingsTitle => '設定';

  @override
  String get accountManagement => 'アカウント管理';

  @override
  String get accountManagementSubtitle => 'マルチアカウント管理、アカウント切り替え';

  @override
  String get privacyMode => 'プライバシーモード';

  @override
  String get privacyModeEnabled => '有効 - 再生情報が非表示';

  @override
  String get privacyModeDisabled => '無効';

  @override
  String get permissionManagement => '権限管理';

  @override
  String get permissionManagementSubtitle => '通知権限、バックグラウンド実行権限';

  @override
  String get desktopFloatingLyric => 'デスクトップフローティング字幕';

  @override
  String get floatingLyricEnabled => '有効 - 字幕がデスクトップに表示されます';

  @override
  String get floatingLyricDisabled => '無効';

  @override
  String get styleSettings => 'スタイル設定';

  @override
  String get styleSettingsSubtitle => 'フォント、色、透明度などをカスタマイズ';

  @override
  String get downloadPath => 'ダウンロードパス';

  @override
  String get downloadPathSubtitle => 'ダウンロードファイルの保存先をカスタマイズ';

  @override
  String get cacheManagement => 'キャッシュ管理';

  @override
  String currentCache(String size) {
    return '現在のキャッシュ: $size';
  }

  @override
  String get themeSettings => 'テーマ設定';

  @override
  String get themeSettingsSubtitle => 'ダークモード、テーマカラーなど';

  @override
  String get uiSettings => 'UI設定';

  @override
  String get uiSettingsSubtitle => 'プレーヤー、詳細ページ、カードなど';

  @override
  String get preferenceSettings => '環境設定';

  @override
  String get preferenceSettingsSubtitle => '翻訳ソース、ブロック、オーディオ設定など';

  @override
  String get aboutTitle => 'について';

  @override
  String get unknownVersion => '不明';

  @override
  String get licenseLoadFailed => 'LICENSEファイルの読み込みに失敗しました';

  @override
  String get licenseEmpty => 'LICENSEの内容が空です';

  @override
  String get failedToLoadAbout => '概要情報の読み込みに失敗しました';

  @override
  String get newVersionFound => '新バージョンが見つかりました';

  @override
  String newVersionAvailable(String version, String current) {
    return '$version が利用可能です（現在: $current）';
  }

  @override
  String get versionInfo => 'バージョン情報';

  @override
  String currentVersion(String version) {
    return '現在のバージョン: $version';
  }

  @override
  String get checkUpdate => 'アップデートを確認';

  @override
  String get author => '作者';

  @override
  String get projectRepo => 'プロジェクトリポジトリ';

  @override
  String get openSourceLicense => 'オープンソースライセンス';

  @override
  String get cannotOpenLink => 'リンクを開けません';

  @override
  String openLinkFailed(String error) {
    return 'リンクを開けませんでした: $error';
  }

  @override
  String foundNewVersion(String version) {
    return '新バージョン $version が見つかりました';
  }

  @override
  String get view => '表示';

  @override
  String get alreadyLatestVersion => '最新バージョンです';

  @override
  String get checkUpdateFailed => 'アップデートの確認に失敗しました。ネットワーク接続を確認してください';

  @override
  String get onlineMarks => 'オンラインマーク';

  @override
  String get historyRecord => '再生履歴';

  @override
  String get playlists => 'プレイリスト';

  @override
  String get downloaded => 'ダウンロード済み';

  @override
  String get downloadTasks => 'ダウンロードタスク';

  @override
  String get subtitleLibrary => '字幕ライブラリ';

  @override
  String get all => 'すべて';

  @override
  String get marked => 'マーク済み';

  @override
  String get listening => '聴取中';

  @override
  String get listened => '聴取済み';

  @override
  String get replayMark => '再聴';

  @override
  String get postponed => '保留';

  @override
  String get switchToSmallGrid => '小グリッド表示に切り替え';

  @override
  String get switchToList => 'リスト表示に切り替え';

  @override
  String get switchToLargeGrid => '大グリッド表示に切り替え';

  @override
  String get sort => '並べ替え';

  @override
  String get noPlayHistory => '再生履歴はありません';

  @override
  String get clearHistory => '履歴をクリア';

  @override
  String get clearHistoryTitle => '履歴をクリア';

  @override
  String get clearHistoryConfirm => 'すべての再生履歴をクリアしますか？この操作は取り消せません。';

  @override
  String get popularNoSort => '人気モードでは並べ替えできません';

  @override
  String get recommendedNoSort => 'おすすめモードでは並べ替えできません';

  @override
  String get showAllWorks => 'すべての作品を表示';

  @override
  String get showOnlySubtitled => '字幕付き作品のみ表示';

  @override
  String selectedCount(int count) {
    return '$count件選択中';
  }

  @override
  String get selectAll => 'すべて選択';

  @override
  String get deselectAll => '選択解除';

  @override
  String get select => '選択';

  @override
  String get noDownloadTasks => 'ダウンロードタスクはありません';

  @override
  String nFiles(int count) {
    return '$countファイル';
  }

  @override
  String errorWithMessage(String error) {
    return 'エラー: $error';
  }

  @override
  String get pause => '一時停止';

  @override
  String get resume => '再開';

  @override
  String get deletionConfirmTitle => '削除の確認';

  @override
  String deletionConfirmMessage(int count) {
    return '選択した$count件のダウンロードタスクを削除しますか？ダウンロード済みファイルも削除されます。';
  }

  @override
  String deletedNFiles(int count) {
    return '$countファイルを削除しました';
  }

  @override
  String get downloadStatusPending => '待機中';

  @override
  String get downloadStatusDownloading => 'ダウンロード中';

  @override
  String get downloadStatusCompleted => '完了';

  @override
  String get downloadStatusFailed => '失敗';

  @override
  String get downloadStatusPaused => '一時停止中';

  @override
  String translationFailed(String error) {
    return '翻訳失敗: $error';
  }

  @override
  String copiedToClipboard(String label, String text) {
    return '$labelをコピーしました：$text';
  }

  @override
  String get loadingFileList => 'ファイルリストを読み込み中...';

  @override
  String loadFileListFailed(String error) {
    return 'ファイルリストの読み込みに失敗: $error';
  }

  @override
  String get playlistTitle => 'プレイリスト';

  @override
  String get noAudioPlaying => '再生中の音声がありません';

  @override
  String get playbackSpeed => '再生速度';

  @override
  String get backward10s => '10秒戻る';

  @override
  String get forward10s => '10秒進む';

  @override
  String get sleepTimer => 'スリープタイマー';

  @override
  String get repeatMode => 'リピートモード';

  @override
  String get repeatOff => 'オフ';

  @override
  String get repeatOne => '1曲リピート';

  @override
  String get repeatAll => '全曲リピート';

  @override
  String get addMark => 'マーク追加';

  @override
  String get viewDetail => '詳細を見る';

  @override
  String get volume => '音量';

  @override
  String get sleepTimerTitle => 'タイマー';

  @override
  String get aboutToStop => 'まもなく停止';

  @override
  String get remainingTime => '残り時間';

  @override
  String get finishCurrentTrack => '現在のトラック終了後に停止';

  @override
  String addMinutes(int min) {
    return '+$min分';
  }

  @override
  String get cancelTimer => 'タイマーをキャンセル';

  @override
  String get duration => '長さ';

  @override
  String get specifyTime => '時刻指定';

  @override
  String get selectTimerDuration => 'タイマーの長さを選択';

  @override
  String get selectStopTime => '再生を停止する時刻を選択';

  @override
  String get markWork => '作品をマーク';

  @override
  String get addToPlaylist => 'プレイリストに追加';

  @override
  String get remove => '削除';

  @override
  String get createPlaylist => 'プレイリストを作成';

  @override
  String get addPlaylist => 'プレイリストを追加';

  @override
  String get playlistName => 'プレイリスト名';

  @override
  String get enterPlaylistName => '名前を入力';

  @override
  String get privacySetting => 'プライバシー設定';

  @override
  String get playlistDescription => '説明（任意）';

  @override
  String get addDescription => '説明を追加';

  @override
  String get enterPlaylistNameWarning => 'プレイリスト名を入力してください';

  @override
  String get enterPlaylistLink => 'プレイリストのリンクを入力してください';

  @override
  String get switchAccountTitle => 'アカウント切り替え';

  @override
  String switchAccountConfirm(String username) {
    return 'アカウント「$username」に切り替えますか？';
  }

  @override
  String switchedToAccount(String username) {
    return 'アカウントを切り替えました: $username';
  }

  @override
  String get switchFailed => '切り替え失敗。アカウント情報を確認してください';

  @override
  String switchFailedWithError(String error) {
    return '切り替え失敗: $error';
  }

  @override
  String get noAccounts => 'アカウントがありません';

  @override
  String get tapToAddAccount => '右下のボタンをタップしてアカウントを追加';

  @override
  String get currentAccount => '現在のアカウント';

  @override
  String get switchAction => '切替';

  @override
  String get deleteAccount => 'アカウント削除';

  @override
  String deleteAccountConfirm(String username) {
    return 'アカウント「$username」を削除しますか？この操作は取り消せません。';
  }

  @override
  String get accountDeleted => 'アカウントを削除しました';

  @override
  String deletionFailedWithError(String error) {
    return '削除失敗: $error';
  }

  @override
  String get subtitleLibraryPriority => '字幕ライブラリの優先度';

  @override
  String get selectSubtitlePriority => '自動読み込みでの字幕ライブラリの優先度を選択：';

  @override
  String get subtitlePriorityHighestDesc => '字幕ライブラリを優先して検索';

  @override
  String get subtitlePriorityLowestDesc => 'オンライン/ダウンロードを優先して検索';

  @override
  String get defaultSortSettings => 'デフォルトの並べ替え設定';

  @override
  String get defaultSortUpdated => 'デフォルトの並べ替えを更新しました';

  @override
  String get translationSourceSettings => '翻訳ソース設定';

  @override
  String get selectTranslationProvider => '翻訳サービスプロバイダーを選択：';

  @override
  String get needsConfiguration => '設定が必要';

  @override
  String get llmTranslation => 'LLM翻訳';

  @override
  String get goToConfigure => '設定へ';

  @override
  String get subtitlePrioritySettingSubtitle => '字幕ライブラリの優先度';

  @override
  String get defaultSortSettingTitle => 'ホームのデフォルト並べ替え';

  @override
  String get translationSource => '翻訳ソース';

  @override
  String get llmSettings => 'LLM設定';

  @override
  String get llmSettingsSubtitle => 'API URL、キー、モデルを設定';

  @override
  String get audioFormatPreference => 'オーディオフォーマット設定';

  @override
  String get audioFormatSubtitle => 'オーディオフォーマットの優先順位を設定';

  @override
  String get blockingSettings => 'ブロック設定';

  @override
  String get blockingSettingsSubtitle => 'ブロック中のタグ、声優、サークルを管理';

  @override
  String get audioPassthrough => 'オーディオパススルー(Beta)';

  @override
  String get audioPassthroughDescWindows => 'WASAPI排他モードを有効にしてロスレス出力（再起動が必要）';

  @override
  String get audioPassthroughDescMac => 'CoreAudio排他モードを有効にしてロスレス出力';

  @override
  String get audioPassthroughDisableDesc => 'オーディオパススルーモードを無効にする';

  @override
  String get warning => '警告';

  @override
  String get audioPassthroughWarning =>
      'この機能は十分にテストされておらず、予期しない音声出力などのリスクがあります。有効にしますか？';

  @override
  String get exclusiveModeEnabled => '排他モードを有効にしました（再起動後に反映）';

  @override
  String get audioPassthroughEnabled => 'オーディオパススルーモードを有効にしました';

  @override
  String get audioPassthroughDisabled => 'オーディオパススルーモードを無効にしました';

  @override
  String get tagVoteSupport => '賛成';

  @override
  String get tagVoteOppose => '反対';

  @override
  String get tagVoted => '投票済み';

  @override
  String get votedSupport => '賛成に投票しました';

  @override
  String get votedOppose => '反対に投票しました';

  @override
  String get voteCancelled => '投票を取り消しました';

  @override
  String voteFailed(String error) {
    return '投票失敗: $error';
  }

  @override
  String get blockThisTag => 'このタグをブロック';

  @override
  String get copyTag => 'タグをコピー';

  @override
  String get addTag => 'タグを追加';

  @override
  String loadTagsFailed(String error) {
    return 'タグの読み込みに失敗: $error';
  }

  @override
  String get selectAtLeastOneTag => '少なくとも1つのタグを選択してください';

  @override
  String get tagSubmitSuccess => 'タグを送信しました。サーバーで処理中です';

  @override
  String get bindEmailFirst => '先にwww.asmr.oneでメールアドレスを登録してください';

  @override
  String selectedNTags(int count) {
    return '$count個のタグを選択中:';
  }

  @override
  String get noMatchingTags => '一致するタグが見つかりません';

  @override
  String get loadFailedRetry => '読み込み失敗。タップして再試行';

  @override
  String get refresh => '更新';

  @override
  String get playlistPrivacyPrivate => '非公開';

  @override
  String get playlistPrivacyUnlisted => '限定公開';

  @override
  String get playlistPrivacyPublic => '公開';

  @override
  String get systemPlaylistMarked => 'マーク済み';

  @override
  String get systemPlaylistLiked => 'お気に入り';

  @override
  String totalNWorks(int count) {
    return '$count作品';
  }

  @override
  String pageNOfTotal(int page, int total) {
    return '$page/$totalページ';
  }

  @override
  String get translateTitle => '翻訳';

  @override
  String get translateDescription => '説明を翻訳';

  @override
  String get translating => '翻訳中...';

  @override
  String translationFallbackNotice(String source) {
    return '翻訳に失敗しました。$sourceに自動切り替えしました';
  }

  @override
  String get tagLabel => 'タグ';

  @override
  String get vaLabel => '声優';

  @override
  String get circleLabel => 'サークル';

  @override
  String get releaseDate => '発売日';

  @override
  String get ratingLabel => '評価';

  @override
  String get salesLabel => '販売数';

  @override
  String get priceLabel => '価格';

  @override
  String get durationLabel => '長さ';

  @override
  String get ageRatingLabel => '年齢区分';

  @override
  String get hasSubtitle => '字幕あり';

  @override
  String get noSubtitle => '字幕なし';

  @override
  String get description => '概要';

  @override
  String get fileList => 'ファイル一覧';

  @override
  String get series => 'シリーズ';

  @override
  String get settingsLanguage => '言語';

  @override
  String get settingsLanguageSubtitle => '表示言語を切り替え';

  @override
  String get languageSystem => 'システムに従う';

  @override
  String get languageZh => '简体中文';

  @override
  String get languageZhTw => '繁體中文';

  @override
  String get languageEn => 'English';

  @override
  String get languageJa => '日本語';

  @override
  String get languageRu => 'Русский';

  @override
  String get themeModeDark => 'ダークモード';

  @override
  String get themeModeLight => 'ライトモード';

  @override
  String get themeModeSystem => 'システムに従う';

  @override
  String get colorSchemeOceanBlue => 'オーシャンブルー';

  @override
  String get colorSchemeForestGreen => 'フォレストグリーン';

  @override
  String get colorSchemeSunsetOrange => 'サンセットオレンジ';

  @override
  String get colorSchemeLavenderPurple => 'ラベンダーパープル';

  @override
  String get colorSchemeSakuraPink => 'サクラピンク';

  @override
  String get colorSchemeDynamic => 'ダイナミックカラー';

  @override
  String get noData => 'データなし';

  @override
  String get unknownError => '不明なエラー';

  @override
  String get networkError => 'ネットワークエラー';

  @override
  String get timeout => 'リクエストタイムアウト';

  @override
  String get playAll => 'すべて再生';

  @override
  String get download => 'ダウンロード';

  @override
  String get downloadAll => 'すべてダウンロード';

  @override
  String get downloading => 'ダウンロード中';

  @override
  String get downloadComplete => 'ダウンロード完了';

  @override
  String get downloadFailed => 'ダウンロード失敗';

  @override
  String get startDownload => 'ダウンロード開始';

  @override
  String get confirmDeleteDownload => 'このダウンロードタスクを削除しますか？ダウンロード済みファイルも削除されます。';

  @override
  String get deletedSuccessfully => '削除しました';

  @override
  String get scanSubtitleLibrary => '字幕ライブラリをスキャン';

  @override
  String get scanning => 'スキャン中...';

  @override
  String get scanComplete => 'スキャン完了';

  @override
  String get noSubtitleFiles => '字幕ファイルが見つかりません';

  @override
  String subtitleFilesFound(int count) {
    return '$count個の字幕ファイルが見つかりました';
  }

  @override
  String get selectDirectory => 'ディレクトリを選択';

  @override
  String get privacyModeSettings => 'プライバシーモード設定';

  @override
  String get blurCover => 'カバーをぼかす';

  @override
  String get maskTitle => 'タイトルを隠す';

  @override
  String get customTitle => 'カスタムタイトル';

  @override
  String get privacyModeDesc => 'システム通知とメディアコントロールで再生情報を非表示にする';

  @override
  String get audioFormatSettingsTitle => 'オーディオフォーマット設定';

  @override
  String get preferredFormat => '優先フォーマット';

  @override
  String get cacheSizeLimit => 'キャッシュサイズ上限';

  @override
  String get llmApiUrl => 'API URL';

  @override
  String get llmApiKey => 'APIキー';

  @override
  String get llmModel => 'モデル';

  @override
  String get llmPrompt => 'システムプロンプト';

  @override
  String get llmConcurrency => '同時実行数';

  @override
  String get llmTestTranslation => '翻訳テスト';

  @override
  String get llmTestSuccess => 'テスト成功';

  @override
  String get llmTestFailed => 'テスト失敗';

  @override
  String get subtitleTimingAdjustment => '字幕タイミング調整';

  @override
  String get playerLyricStyle => 'プレーヤー歌詞スタイル';

  @override
  String get floatingLyricStyle => 'フローティング歌詞スタイル';

  @override
  String get fontSize => 'フォントサイズ';

  @override
  String get fontColor => 'フォントカラー';

  @override
  String get backgroundColor => '背景色';

  @override
  String get transparency => '透明度';

  @override
  String get windowSize => 'ウィンドウサイズ';

  @override
  String get playerButtonSettings => 'プレーヤーボタン設定';

  @override
  String get showButton => 'ボタンを表示';

  @override
  String get buttonOrder => 'ボタンの順序';

  @override
  String get workCardDisplaySettings => '作品カード表示';

  @override
  String get showTags => 'タグを表示';

  @override
  String get showVa => '声優を表示';

  @override
  String get showRating => '評価を表示';

  @override
  String get showPrice => '価格を表示';

  @override
  String get cardSize => 'カードサイズ';

  @override
  String get compact => 'コンパクト';

  @override
  String get medium => 'ミディアム';

  @override
  String get full => 'フル';

  @override
  String get workDetailDisplaySettings => '作品詳細表示';

  @override
  String get infoSectionVisibility => '情報セクションの表示';

  @override
  String get imageSize => '画像サイズ';

  @override
  String get showMetadata => 'メタデータを表示';

  @override
  String get myTabsDisplaySettings => 'マイページタブ設定';

  @override
  String get showTab => 'タブを表示';

  @override
  String get tabOrder => 'タブの順序';

  @override
  String get blockedItems => 'ブロック項目';

  @override
  String get blockedTags => 'ブロック中のタグ';

  @override
  String get blockedVas => 'ブロック中の声優';

  @override
  String get blockedCircles => 'ブロック中のサークル';

  @override
  String get unblock => 'ブロック解除';

  @override
  String get noBlockedItems => 'ブロック項目はありません';

  @override
  String get clearCache => 'キャッシュをクリア';

  @override
  String get clearCacheConfirm => 'すべてのキャッシュをクリアしますか？';

  @override
  String get cacheCleared => 'キャッシュをクリアしました';

  @override
  String get imagePreview => '画像プレビュー';

  @override
  String get saveImage => '画像を保存';

  @override
  String get imageSaved => '画像を保存しました';

  @override
  String get saveImageFailed => '画像の保存に失敗しました';

  @override
  String get logout => 'ログアウト';

  @override
  String get logoutConfirm => 'ログアウトしますか？';

  @override
  String get openInBrowser => 'ブラウザで開く';

  @override
  String get copyLink => 'リンクをコピー';

  @override
  String get linkCopied => 'リンクをコピーしました';

  @override
  String get ratingDistribution => '評価分布';

  @override
  String reviewsCount(int count) {
    return '$count件のレビュー';
  }

  @override
  String ratingsCount(int count) {
    return '$count件の評価';
  }

  @override
  String get myReviews => 'マイレビュー';

  @override
  String get noReviews => 'レビューはありません';

  @override
  String get writeReview => 'レビューを書く';

  @override
  String get editReview => 'レビューを編集';

  @override
  String get deleteReview => 'レビューを削除';

  @override
  String get deleteReviewConfirm => 'このレビューを削除しますか？';

  @override
  String get reviewDeleted => 'レビューを削除しました';

  @override
  String get reviewContent => 'レビュー内容';

  @override
  String get enterReviewContent => 'レビュー内容を入力...';

  @override
  String get submitReview => '送信';

  @override
  String get reviewSubmitted => 'レビューを送信しました';

  @override
  String reviewFailed(String error) {
    return 'レビュー失敗: $error';
  }

  @override
  String get notificationPermission => '通知権限';

  @override
  String get mediaPermission => 'メディアライブラリ権限';

  @override
  String get storagePermission => 'ストレージ権限';

  @override
  String get granted => '許可済み';

  @override
  String get denied => '拒否';

  @override
  String get requestPermission => 'リクエスト';

  @override
  String get localDownloads => 'ローカルダウンロード';

  @override
  String get offlinePlayback => 'オフライン再生';

  @override
  String get noDownloadedWorks => 'ダウンロード済み作品はありません';

  @override
  String get updateAvailable => 'アップデートが利用可能です';

  @override
  String get ignoreThisVersion => 'このバージョンを無視';

  @override
  String get remindLater => '後で通知';

  @override
  String get updateNow => '今すぐアップデート';

  @override
  String get fetchFailed => '取得に失敗';

  @override
  String operationFailedWithError(String error) {
    return '操作に失敗: $error';
  }

  @override
  String get aboutSubtitle => '更新確認、ライセンスなど';

  @override
  String get currentCacheSize => '現在のキャッシュサイズ';

  @override
  String cacheLimitLabelMB(int size) {
    return '上限: ${size}MB';
  }

  @override
  String get cacheUsagePercent => '使用率';

  @override
  String get autoCleanTitle => '自動クリーニングについて';

  @override
  String get autoCleanDescription =>
      '• キャッシュが上限を超えると自動的にクリーニングされます\n• 上限の80%まで削除します\n• LRU（最も使われていないもの）方式で削除';

  @override
  String get autoCleanDescriptionShort =>
      '• キャッシュが上限を超えると自動的にクリーニングされます\n• 上限の80%まで削除します';

  @override
  String get confirmClear => 'クリアを確認';

  @override
  String get confirmClearCacheMessage => 'すべてのキャッシュをクリアしますか？この操作は取り消せません。';

  @override
  String clearCacheFailedWithError(String error) {
    return 'キャッシュのクリアに失敗: $error';
  }

  @override
  String get hasNewVersion => '新しいバージョン';

  @override
  String get themeMode => 'テーマモード';

  @override
  String get colorTheme => 'カラーテーマ';

  @override
  String get themePreview => 'テーマプレビュー';

  @override
  String get themeModeSystemDesc => 'システムのダーク/ライトモードに自動対応';

  @override
  String get themeModeLightDesc => '常にライトテーマを使用';

  @override
  String get themeModeDarkDesc => '常にダークテーマを使用';

  @override
  String get colorSchemeOceanBlueDesc => 'ブルー、ブルー、ブルー！';

  @override
  String get colorSchemeSakuraPinkDesc => '( ゜- ゜)つロ 乾杯~';

  @override
  String get colorSchemeSunsetOrangeDesc => 'テーマ変更は必須✍🏻✍🏻✍🏻';

  @override
  String get colorSchemeLavenderPurpleDesc => 'ブラザー、ブラザー...';

  @override
  String get colorSchemeForestGreenDesc => 'グリーン、グリーン、グリーン';

  @override
  String get colorSchemeDynamicDesc => 'システム壁紙の色を使用 (Android 12+)';

  @override
  String get primaryContainer => 'プライマリコンテナ';

  @override
  String get secondaryContainer => 'セカンダリコンテナ';

  @override
  String get tertiaryContainer => 'ターシャリコンテナ';

  @override
  String get surfaceColor => 'サーフェス';

  @override
  String get playerButtonSettingsSubtitle => 'プレーヤーコントロールボタンの順序をカスタマイズ';

  @override
  String get playerLyricStyleSubtitle => 'ミニプレーヤーとフルスクリーンプレーヤーの字幕スタイルをカスタマイズ';

  @override
  String get workDetailDisplaySubtitle => '作品詳細ページの表示項目を制御';

  @override
  String get workCardDisplaySubtitle => '作品カードの表示項目を制御';

  @override
  String get myTabsDisplaySubtitle => 'マイページのタブ表示を制御';

  @override
  String get pageSizeSettings => 'ページあたりの表示数';

  @override
  String pageSizeCurrent(int size) {
    return '現在の設定: $size 件/ページ';
  }

  @override
  String currentSettingLabel(String value) {
    return '現在: $value';
  }

  @override
  String setToValue(String value) {
    return '設定: $value';
  }

  @override
  String get llmConfigRequiredMessage =>
      'LLM翻訳にはAPI Keyの設定が必要です。先に設定画面で設定してください。';

  @override
  String get autoSwitchedToLlm => '自動切替: LLM翻訳';

  @override
  String get translationDescGoogle => 'Googleサービスへのネットワークアクセスが必要';

  @override
  String get translationDescYoudao => 'デフォルトネットワークで動作';

  @override
  String get translationDescMicrosoft => 'デフォルトネットワークで動作';

  @override
  String get translationDescLlm => 'OpenAI互換API、手動でAPI Keyの設定が必要';

  @override
  String get audioPassthroughDescAndroid =>
      '外部デコーダーへの生ビットストリーム出力 (AC3/DTS) を許可。オーディオデバイスを占有する場合があります。';

  @override
  String get permissionExplanation => '権限の説明';

  @override
  String get backgroundRunningPermission => 'バックグラウンド実行権限';

  @override
  String get notificationPermissionDesc =>
      'メディア再生通知バーの表示に使用し、ロック画面や通知バーから再生を制御できます。';

  @override
  String get backgroundRunningPermissionDesc =>
      'バッテリー最適化の制限を解除し、バックグラウンドでのオーディオ再生を維持します。';

  @override
  String get notificationGrantedStatus => '許可済み - 再生通知とコントローラーを表示可能';

  @override
  String get notificationDeniedStatus => '未許可 - タップして権限を申請';

  @override
  String get backgroundGrantedStatus => '許可済み - バックグラウンドで継続実行可能';

  @override
  String get backgroundDeniedStatus => '未許可 - タップして権限を申請';

  @override
  String get notificationPermissionGranted => '通知権限が許可されました';

  @override
  String get notificationPermissionDenied => '通知権限が拒否されました';

  @override
  String requestNotificationFailed(String error) {
    return '通知権限の申請に失敗: $error';
  }

  @override
  String get backgroundPermissionGranted => 'バックグラウンド実行権限が許可されました';

  @override
  String get backgroundPermissionDenied => 'バックグラウンド実行権限が拒否されました';

  @override
  String requestBackgroundFailed(String error) {
    return 'バックグラウンド権限の申請に失敗: $error';
  }

  @override
  String permissionRequired(String permission) {
    return '$permissionが必要です';
  }

  @override
  String permissionPermanentlyDenied(String permission) {
    return '$permissionが永久に拒否されています。システム設定で手動で有効にしてください。';
  }

  @override
  String get openSettings => '設定を開く';

  @override
  String get permissionsAndroidOnly => '権限管理はAndroidでのみ利用可能です';

  @override
  String get permissionsNotNeeded => '他のプラットフォームでは手動での権限管理は不要です';

  @override
  String get refreshPermissionStatus => '権限状態を更新';

  @override
  String deleteFileConfirm(String fileName) {
    return '「$fileName」を削除しますか？';
  }

  @override
  String deleteSelectedFilesConfirm(int count) {
    return '選択した $count 個のファイルを削除しますか？';
  }

  @override
  String get deleted => '削除済み';

  @override
  String cannotOpenFolder(String path) {
    return 'フォルダを開けません: $path';
  }

  @override
  String openFolderFailed(String error) {
    return 'フォルダを開けませんでした: $error';
  }

  @override
  String get reloadingFromDisk => 'ディスクから再読み込み中...';

  @override
  String get refreshComplete => '更新完了';

  @override
  String refreshFailed(String error) {
    return '更新失敗: $error';
  }

  @override
  String deleteSelectedWorksConfirm(int count) {
    return '選択した $count 個の作品を削除しますか？';
  }

  @override
  String partialDeleteFailed(String error) {
    return '一部の削除に失敗: $error';
  }

  @override
  String deletedNOfTotal(int success, int total) {
    return '$success/$total 個のタスクを削除';
  }

  @override
  String deleteFailedWithError(String error) {
    return '削除失敗: $error';
  }

  @override
  String get noWorkMetadataForOffline =>
      'このダウンロードには作品詳細が保存されていないため、オフラインで表示できません';

  @override
  String openWorkDetailFailed(String error) {
    return '作品詳細を開けませんでした: $error';
  }

  @override
  String get noLocalDownloads => 'ローカルダウンロードなし';

  @override
  String get exitSelection => '選択を終了';

  @override
  String get reload => '再読み込み';

  @override
  String get openFolder => 'フォルダを開く';

  @override
  String get playlistLink => 'プレイリストリンク';

  @override
  String get playlistLinkHint =>
      'プレイリストリンクを貼り付け、例:\nhttps://www.asmr.one/playlist?id=...';

  @override
  String get unrecognizedPlaylistLink => '認識できないプレイリストリンクまたはID';

  @override
  String get addingPlaylist => 'プレイリストを追加中...';

  @override
  String get playlistAddedSuccess => 'プレイリストの追加に成功';

  @override
  String get addFailed => '追加失敗';

  @override
  String get playlistNotFound => 'プレイリストが存在しないか、削除されています';

  @override
  String get noPermissionToAccessPlaylist => 'このプレイリストへのアクセス権限がありません';

  @override
  String get networkConnectionFailed => 'ネットワーク接続に失敗しました。接続を確認してください';

  @override
  String addFailedWithError(String error) {
    return '追加失敗: $error';
  }

  @override
  String get creatingPlaylist => 'プレイリストを作成中...';

  @override
  String playlistCreatedSuccess(String name) {
    return 'プレイリスト「$name」を作成しました';
  }

  @override
  String createFailedWithError(String error) {
    return '作成失敗: $error';
  }

  @override
  String get noPlaylists => 'プレイリストなし';

  @override
  String get noPlaylistsDescription => 'プレイリストはまだ作成・お気に入り登録されていません';

  @override
  String get myPlaylists => 'マイプレイリスト';

  @override
  String totalNItems(int count) {
    return '全 $count 件';
  }

  @override
  String get systemPlaylistCannotDelete => 'システムプレイリストは削除できません';

  @override
  String get deletePlaylist => 'プレイリストを削除';

  @override
  String get unfavoritePlaylist => 'お気に入りを解除';

  @override
  String get deletePlaylistConfirm =>
      '削除すると元に戻せません。このプレイリストをお気に入りに登録しているユーザーもアクセスできなくなります。削除しますか？';

  @override
  String unfavoritePlaylistConfirm(String name) {
    return '「$name」のお気に入りを解除しますか？';
  }

  @override
  String get unfavorite => 'お気に入り解除';

  @override
  String get deleting => '削除中...';

  @override
  String get deleteSuccess => '削除成功';

  @override
  String get onlyOwnerCanEdit => 'プレイリストの作成者のみ編集できます';

  @override
  String get editPlaylist => 'プレイリストを編集';

  @override
  String get playlistNameRequired => 'プレイリスト名は必須です';

  @override
  String get privacyDescPrivate => '自分のみ閲覧可能';

  @override
  String get privacyDescUnlisted => 'リンクを知っている人のみ閲覧可能';

  @override
  String get privacyDescPublic => '誰でも閲覧可能';

  @override
  String get addWorks => '作品を追加';

  @override
  String get addWorksInputHint => '作品番号を含むテキストを入力、RJ番号を自動検出';

  @override
  String get workId => '作品番号';

  @override
  String get workIdHint => '例: RJ123456\nrj233333';

  @override
  String detectedNWorkIds(int count) {
    return '$count 個の作品番号を検出';
  }

  @override
  String addNWorks(int count) {
    return '$count 個追加';
  }

  @override
  String get noValidWorkIds => '有効な作品番号が見つかりません（RJで始まるもの）';

  @override
  String addingNWorks(int count) {
    return '$count 個の作品を追加中...';
  }

  @override
  String addedNWorksSuccess(int count) {
    return '$count 個の作品を追加しました';
  }

  @override
  String get removeWork => '作品を削除';

  @override
  String removeWorkConfirm(String title) {
    return 'プレイリストから「$title」を削除しますか？';
  }

  @override
  String get removeSuccess => '削除成功';

  @override
  String removeFailedWithError(String error) {
    return '削除失敗: $error';
  }

  @override
  String get saving => '保存中...';

  @override
  String get saveSuccess => '保存成功';

  @override
  String saveFailedWithError(String error) {
    return '保存失敗: $error';
  }

  @override
  String get noWorks => '作品なし';

  @override
  String get playlistNoWorksDescription => 'このプレイリストにはまだ作品が追加されていません';

  @override
  String get lastUpdated => '最終更新';

  @override
  String get createdTime => '作成日';

  @override
  String nWorksCount(int count) {
    return '$count 作品';
  }

  @override
  String nPlaysCount(int count) {
    return '$count 再生';
  }

  @override
  String get removeFromPlaylist => 'プレイリストから削除';

  @override
  String get checkNetworkOrRetry => 'ネットワーク接続を確認するか、後で再試行してください';

  @override
  String get reachedEnd => '最後まで来ました〜';

  @override
  String excludedNWorks(int count) {
    return '$count 作品を除外';
  }

  @override
  String pageExcludedNWorks(int count) {
    return 'このページで $count 作品を除外';
  }
}
