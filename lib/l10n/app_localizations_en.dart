// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'KikoFlu';

  @override
  String get navHome => 'Home';

  @override
  String get navSearch => 'Search';

  @override
  String get navMy => 'My';

  @override
  String get navSettings => 'Settings';

  @override
  String get offlineModeMessage =>
      'Offline mode: Network connection failed, only downloaded content is accessible';

  @override
  String get retry => 'Retry';

  @override
  String get searchTypeKeyword => 'Keyword';

  @override
  String get searchTypeTag => 'Tag';

  @override
  String get searchTypeVa => 'Voice Actor';

  @override
  String get searchTypeCircle => 'Circle';

  @override
  String get searchTypeRjNumber => 'RJ Number';

  @override
  String get searchHintKeyword => 'Enter work name or keyword...';

  @override
  String get searchHintTag => 'Enter tag name...';

  @override
  String get searchHintVa => 'Enter voice actor name...';

  @override
  String get searchHintCircle => 'Enter circle name...';

  @override
  String get searchHintRjNumber => 'Enter number...';

  @override
  String get ageRatingAll => 'All';

  @override
  String get ageRatingGeneral => 'All Ages';

  @override
  String get ageRatingR15 => 'R-15';

  @override
  String get ageRatingAdult => 'Adult';

  @override
  String get salesRangeAll => 'All';

  @override
  String get sortRelease => 'Release Date';

  @override
  String get sortCreateDate => 'Catalog Date';

  @override
  String get sortRating => 'Rating';

  @override
  String get sortReviewCount => 'Reviews';

  @override
  String get sortRandom => 'Random';

  @override
  String get sortDlCount => 'Sales';

  @override
  String get sortPrice => 'Price';

  @override
  String get sortNsfw => 'All Ages';

  @override
  String get sortUpdatedAt => 'Marked Date';

  @override
  String get sortAsc => 'Ascending';

  @override
  String get sortDesc => 'Descending';

  @override
  String get sortOptions => 'Sort Options';

  @override
  String get sortField => 'Sort Field';

  @override
  String get sortDirection => 'Sort Direction';

  @override
  String get displayModeAll => 'All';

  @override
  String get displayModePopular => 'Popular';

  @override
  String get displayModeRecommended => 'Recommended';

  @override
  String get subtitlePriorityHighest => 'Priority';

  @override
  String get subtitlePriorityLowest => 'Deferred';

  @override
  String get translationSourceGoogle => 'Google Translate';

  @override
  String get translationSourceYoudao => 'Youdao Translate';

  @override
  String get translationSourceMicrosoft => 'Microsoft Translate';

  @override
  String get translationSourceLlm => 'LLM Translate';

  @override
  String get progressMarked => 'Marked';

  @override
  String get progressListening => 'Listening';

  @override
  String get progressListened => 'Listened';

  @override
  String get progressReplay => 'Replay';

  @override
  String get progressPostponed => 'Postponed';

  @override
  String get loginTitle => 'Login';

  @override
  String get register => 'Register';

  @override
  String get addAccount => 'Add Account';

  @override
  String get registerAccount => 'Register Account';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get serverAddress => 'Server Address';

  @override
  String get login => 'Login';

  @override
  String get loginSuccess => 'Login successful';

  @override
  String get loginFailed => 'Login failed';

  @override
  String get registerFailed => 'Registration failed';

  @override
  String get usernameMinLength => 'Username must be at least 5 characters';

  @override
  String get passwordMinLength => 'Password must be at least 5 characters';

  @override
  String accountAdded(String username) {
    return 'Account \"$username\" has been added';
  }

  @override
  String get testConnection => 'Test Connection';

  @override
  String get testing => 'Testing...';

  @override
  String get enterServerAddressToTest =>
      'Please enter server address to test connection';

  @override
  String latencyMs(String ms) {
    return '${ms}ms';
  }

  @override
  String get connectionFailed => 'Connection failed';

  @override
  String get guestModeTitle => 'Guest Mode Confirmation';

  @override
  String get guestModeMessage =>
      'Guest mode has limited functionality:\n\n• Cannot mark or rate works\n• Cannot create playlists\n• Cannot sync progress\n\nGuest mode uses a demo account to connect to the server, which may be unstable.';

  @override
  String get continueGuestMode => 'Continue with Guest Mode';

  @override
  String get guestAccountAdded => 'Guest account has been added';

  @override
  String get guestLoginFailed => 'Guest login failed';

  @override
  String get guestMode => 'Guest Mode';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get close => 'Close';

  @override
  String get delete => 'Delete';

  @override
  String get save => 'Save';

  @override
  String get edit => 'Edit';

  @override
  String get add => 'Add';

  @override
  String get create => 'Create';

  @override
  String get ok => 'OK';

  @override
  String get search => 'Search';

  @override
  String get filter => 'Filter';

  @override
  String get advancedFilter => 'Advanced Filter';

  @override
  String get enterSearchContent => 'Please enter search content';

  @override
  String get searchTag => 'Search tags...';

  @override
  String get minRating => 'Min Rating';

  @override
  String minRatingStars(String stars) {
    return '$stars stars';
  }

  @override
  String get searchHistory => 'Search History';

  @override
  String get clearSearchHistory => 'Clear Search History';

  @override
  String get clearSearchHistoryConfirm =>
      'Are you sure you want to clear all search history?';

  @override
  String get clear => 'Clear';

  @override
  String get searchHistoryCleared => 'Search history cleared';

  @override
  String get noSearchHistory => 'No search history';

  @override
  String get excludeMode => 'Exclude';

  @override
  String get includeMode => 'Include';

  @override
  String get noResults => 'No results';

  @override
  String get loadFailed => 'Load failed';

  @override
  String loadFailedWithError(String error) {
    return 'Load failed: $error';
  }

  @override
  String get loading => 'Loading...';

  @override
  String get calculating => 'Calculating...';

  @override
  String get getFailed => 'Failed to retrieve';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get accountManagement => 'Account Management';

  @override
  String get accountManagementSubtitle =>
      'Multi-account management, switch accounts';

  @override
  String get privacyMode => 'Privacy Mode';

  @override
  String get privacyModeEnabled => 'Enabled - Playback info is hidden';

  @override
  String get privacyModeDisabled => 'Disabled';

  @override
  String get permissionManagement => 'Permission Management';

  @override
  String get permissionManagementSubtitle =>
      'Notification permissions, background running permissions';

  @override
  String get desktopFloatingLyric => 'Desktop Floating Lyrics';

  @override
  String get floatingLyricEnabled => 'Enabled - Lyrics will display on desktop';

  @override
  String get floatingLyricDisabled => 'Disabled';

  @override
  String get styleSettings => 'Style Settings';

  @override
  String get styleSettingsSubtitle =>
      'Customize font, color, transparency, etc.';

  @override
  String get downloadPath => 'Download Path';

  @override
  String get downloadPathSubtitle => 'Customize download file save location';

  @override
  String get cacheManagement => 'Cache Management';

  @override
  String currentCache(String size) {
    return 'Current cache: $size';
  }

  @override
  String get themeSettings => 'Theme Settings';

  @override
  String get themeSettingsSubtitle => 'Dark mode, theme color, etc.';

  @override
  String get uiSettings => 'UI Settings';

  @override
  String get uiSettingsSubtitle => 'Player, detail page, cards, etc.';

  @override
  String get preferenceSettings => 'Preference Settings';

  @override
  String get preferenceSettingsSubtitle =>
      'Translation source, blocking, audio preferences, etc.';

  @override
  String get aboutTitle => 'About';

  @override
  String get unknownVersion => 'Unknown';

  @override
  String get licenseLoadFailed => 'Failed to load LICENSE file';

  @override
  String get licenseEmpty => 'LICENSE content is empty';

  @override
  String get failedToLoadAbout => 'Failed to load about info';

  @override
  String get newVersionFound => 'New Version Found';

  @override
  String newVersionAvailable(String version, String current) {
    return '$version available (current: $current)';
  }

  @override
  String get versionInfo => 'Version Info';

  @override
  String currentVersion(String version) {
    return 'Current version: $version';
  }

  @override
  String get checkUpdate => 'Check for Updates';

  @override
  String get author => 'Author';

  @override
  String get projectRepo => 'Project Repository';

  @override
  String get openSourceLicense => 'Open Source License';

  @override
  String get cannotOpenLink => 'Cannot open link';

  @override
  String openLinkFailed(String error) {
    return 'Failed to open link: $error';
  }

  @override
  String foundNewVersion(String version) {
    return 'Found new version $version';
  }

  @override
  String get view => 'View';

  @override
  String get alreadyLatestVersion => 'Already the latest version';

  @override
  String get checkUpdateFailed =>
      'Update check failed, please check network connection';

  @override
  String get onlineMarks => 'Online Marks';

  @override
  String get historyRecord => 'History';

  @override
  String get playlists => 'Playlists';

  @override
  String get downloaded => 'Downloaded';

  @override
  String get downloadTasks => 'Download Tasks';

  @override
  String get subtitleLibrary => 'Subtitle Library';

  @override
  String get all => 'All';

  @override
  String get marked => 'Marked';

  @override
  String get listening => 'Listening';

  @override
  String get listened => 'Listened';

  @override
  String get replayMark => 'Replay';

  @override
  String get postponed => 'Postponed';

  @override
  String get switchToSmallGrid => 'Switch to small grid view';

  @override
  String get switchToList => 'Switch to list view';

  @override
  String get switchToLargeGrid => 'Switch to large grid view';

  @override
  String get sort => 'Sort';

  @override
  String get noPlayHistory => 'No play history';

  @override
  String get clearHistory => 'Clear History';

  @override
  String get clearHistoryTitle => 'Clear History';

  @override
  String get clearHistoryConfirm =>
      'Are you sure you want to clear all play history? This action cannot be undone.';

  @override
  String get popularNoSort => 'Popular mode does not support sorting';

  @override
  String get recommendedNoSort => 'Recommended mode does not support sorting';

  @override
  String get showAllWorks => 'Show all works';

  @override
  String get showOnlySubtitled => 'Show only subtitled works';

  @override
  String selectedCount(int count) {
    return '$count selected';
  }

  @override
  String get selectAll => 'Select All';

  @override
  String get deselectAll => 'Deselect All';

  @override
  String get select => 'Select';

  @override
  String get noDownloadTasks => 'No download tasks';

  @override
  String nFiles(int count) {
    return '$count files';
  }

  @override
  String errorWithMessage(String error) {
    return 'Error: $error';
  }

  @override
  String get pause => 'Pause';

  @override
  String get resume => 'Resume';

  @override
  String get deletionConfirmTitle => 'Confirm Delete';

  @override
  String deletionConfirmMessage(int count) {
    return 'Are you sure you want to delete $count selected download tasks? Downloaded files will also be removed.';
  }

  @override
  String deletedNFiles(int count) {
    return 'Deleted $count files';
  }

  @override
  String get downloadStatusPending => 'Pending';

  @override
  String get downloadStatusDownloading => 'Downloading';

  @override
  String get downloadStatusCompleted => 'Completed';

  @override
  String get downloadStatusFailed => 'Failed';

  @override
  String get downloadStatusPaused => 'Paused';

  @override
  String translationFailed(String error) {
    return 'Translation failed: $error';
  }

  @override
  String copiedToClipboard(String label, String text) {
    return 'Copied $label: $text';
  }

  @override
  String get loadingFileList => 'Loading file list...';

  @override
  String loadFileListFailed(String error) {
    return 'Failed to load file list: $error';
  }

  @override
  String get playlistTitle => 'Playlist';

  @override
  String get noAudioPlaying => 'No audio playing';

  @override
  String get playbackSpeed => 'Playback Speed';

  @override
  String get backward10s => 'Backward 10s';

  @override
  String get forward10s => 'Forward 10s';

  @override
  String get sleepTimer => 'Sleep Timer';

  @override
  String get repeatMode => 'Repeat Mode';

  @override
  String get repeatOff => 'Off';

  @override
  String get repeatOne => 'Single';

  @override
  String get repeatAll => 'All';

  @override
  String get addMark => 'Add Mark';

  @override
  String get viewDetail => 'View Detail';

  @override
  String get volume => 'Volume';

  @override
  String get sleepTimerTitle => 'Sleep Timer';

  @override
  String get aboutToStop => 'About to stop';

  @override
  String get remainingTime => 'Remaining time';

  @override
  String get finishCurrentTrack => 'Stop after current track finishes';

  @override
  String addMinutes(int min) {
    return '+$min min';
  }

  @override
  String get cancelTimer => 'Cancel Timer';

  @override
  String get duration => 'Duration';

  @override
  String get specifyTime => 'Specify Time';

  @override
  String get selectTimerDuration => 'Select timer duration';

  @override
  String get selectStopTime => 'Select the time to stop playback';

  @override
  String get markWork => 'Mark Work';

  @override
  String get addToPlaylist => 'Add to Playlist';

  @override
  String get remove => 'Remove';

  @override
  String get createPlaylist => 'Create Playlist';

  @override
  String get addPlaylist => 'Add Playlist';

  @override
  String get playlistName => 'Playlist Name';

  @override
  String get enterPlaylistName => 'Enter name';

  @override
  String get privacySetting => 'Privacy Setting';

  @override
  String get playlistDescription => 'Description (optional)';

  @override
  String get addDescription => 'Add a description';

  @override
  String get enterPlaylistNameWarning => 'Please enter a playlist name';

  @override
  String get enterPlaylistLink => 'Please enter a playlist link';

  @override
  String get switchAccountTitle => 'Switch Account';

  @override
  String switchAccountConfirm(String username) {
    return 'Are you sure you want to switch to account \"$username\"?';
  }

  @override
  String switchedToAccount(String username) {
    return 'Switched to account: $username';
  }

  @override
  String get switchFailed => 'Switch failed, please check account info';

  @override
  String switchFailedWithError(String error) {
    return 'Switch failed: $error';
  }

  @override
  String get noAccounts => 'No accounts';

  @override
  String get tapToAddAccount =>
      'Tap the button in the bottom right to add an account';

  @override
  String get currentAccount => 'Current Account';

  @override
  String get switchAction => 'Switch';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String deleteAccountConfirm(String username) {
    return 'Are you sure you want to delete account \"$username\"? This action cannot be undone.';
  }

  @override
  String get accountDeleted => 'Account deleted';

  @override
  String deletionFailedWithError(String error) {
    return 'Deletion failed: $error';
  }

  @override
  String get subtitleLibraryPriority => 'Subtitle Library Priority';

  @override
  String get selectSubtitlePriority =>
      'Select subtitle library priority for auto-loading:';

  @override
  String get subtitlePriorityHighestDesc =>
      'Search subtitle library first, then online/downloads';

  @override
  String get subtitlePriorityLowestDesc =>
      'Search online/downloads first, then subtitle library';

  @override
  String get defaultSortSettings => 'Default Sort Settings';

  @override
  String get defaultSortUpdated => 'Default sort updated';

  @override
  String get translationSourceSettings => 'Translation Source Settings';

  @override
  String get selectTranslationProvider =>
      'Select translation service provider:';

  @override
  String get needsConfiguration => 'Needs configuration';

  @override
  String get llmTranslation => 'LLM Translation';

  @override
  String get goToConfigure => 'Configure';

  @override
  String get subtitlePrioritySettingSubtitle => 'Subtitle library priority';

  @override
  String get defaultSortSettingTitle => 'Default sort for home page';

  @override
  String get translationSource => 'Translation Source';

  @override
  String get llmSettings => 'LLM Settings';

  @override
  String get llmSettingsSubtitle => 'Configure API URL, Key, and model';

  @override
  String get audioFormatPreference => 'Audio Format Preference';

  @override
  String get audioFormatSubtitle => 'Set audio format priority order';

  @override
  String get blockingSettings => 'Blocking Settings';

  @override
  String get blockingSettingsSubtitle =>
      'Manage blocked tags, voice actors, and circles';

  @override
  String get audioPassthrough => 'Audio Passthrough (Beta)';

  @override
  String get audioPassthroughDescWindows =>
      'Enable WASAPI exclusive mode for lossless output (restart required)';

  @override
  String get audioPassthroughDescMac =>
      'Enable CoreAudio exclusive mode for lossless output';

  @override
  String get audioPassthroughDisableDesc => 'Disable audio passthrough mode';

  @override
  String get warning => 'Warning';

  @override
  String get audioPassthroughWarning =>
      'This feature is not fully tested and may cause unexpected audio output. Are you sure you want to enable it?';

  @override
  String get exclusiveModeEnabled =>
      'Exclusive mode enabled (restart required)';

  @override
  String get audioPassthroughEnabled => 'Audio passthrough mode enabled';

  @override
  String get audioPassthroughDisabled => 'Audio passthrough mode disabled';

  @override
  String get tagVoteSupport => 'Support';

  @override
  String get tagVoteOppose => 'Oppose';

  @override
  String get tagVoted => 'Voted';

  @override
  String get votedSupport => 'Voted support';

  @override
  String get votedOppose => 'Voted oppose';

  @override
  String get voteCancelled => 'Vote cancelled';

  @override
  String voteFailed(String error) {
    return 'Vote failed: $error';
  }

  @override
  String get blockThisTag => 'Block this tag';

  @override
  String get copyTag => 'Copy Tag';

  @override
  String get addTag => 'Add Tag';

  @override
  String loadTagsFailed(String error) {
    return 'Failed to load tags: $error';
  }

  @override
  String get selectAtLeastOneTag => 'Please select at least one tag';

  @override
  String get tagSubmitSuccess =>
      'Tags submitted, waiting for server to process';

  @override
  String get bindEmailFirst => 'Please bind your email at www.asmr.one first';

  @override
  String selectedNTags(int count) {
    return 'Selected $count tags:';
  }

  @override
  String get noMatchingTags => 'No matching tags found';

  @override
  String get loadFailedRetry => 'Load failed, tap to retry';

  @override
  String get refresh => 'Refresh';

  @override
  String get playlistPrivacyPrivate => 'Private';

  @override
  String get playlistPrivacyUnlisted => 'Unlisted';

  @override
  String get playlistPrivacyPublic => 'Public';

  @override
  String get systemPlaylistMarked => 'My Marked';

  @override
  String get systemPlaylistLiked => 'My Liked';

  @override
  String totalNWorks(int count) {
    return '$count works';
  }

  @override
  String pageNOfTotal(int page, int total) {
    return 'Page $page/$total';
  }

  @override
  String get translateTitle => 'Translate';

  @override
  String get translateDescription => 'Translate Description';

  @override
  String get translating => 'Translating...';

  @override
  String translationFallbackNotice(String source) {
    return 'Translation failed, auto-switched to $source';
  }

  @override
  String get tagLabel => 'Tags';

  @override
  String get vaLabel => 'Voice Actors';

  @override
  String get circleLabel => 'Circle';

  @override
  String get releaseDate => 'Release Date';

  @override
  String get ratingLabel => 'Rating';

  @override
  String get salesLabel => 'Sales';

  @override
  String get priceLabel => 'Price';

  @override
  String get durationLabel => 'Duration';

  @override
  String get ageRatingLabel => 'Age Rating';

  @override
  String get hasSubtitle => 'Has Subtitle';

  @override
  String get noSubtitle => 'No Subtitle';

  @override
  String get description => 'Description';

  @override
  String get fileList => 'File List';

  @override
  String get series => 'Series';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLanguageSubtitle => 'Switch display language';

  @override
  String get languageSystem => 'Follow System';

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
  String get themeModeDark => 'Dark Mode';

  @override
  String get themeModeLight => 'Light Mode';

  @override
  String get themeModeSystem => 'Follow System';

  @override
  String get colorSchemeOceanBlue => 'Ocean Blue';

  @override
  String get colorSchemeForestGreen => 'Forest Green';

  @override
  String get colorSchemeSunsetOrange => 'Sunset Orange';

  @override
  String get colorSchemeLavenderPurple => 'Lavender Purple';

  @override
  String get colorSchemeSakuraPink => 'Sakura Pink';

  @override
  String get colorSchemeDynamic => 'Dynamic Color';

  @override
  String get noData => 'No data';

  @override
  String get unknownError => 'Unknown error';

  @override
  String get networkError => 'Network error';

  @override
  String get timeout => 'Request timeout';

  @override
  String get playAll => 'Play All';

  @override
  String get download => 'Download';

  @override
  String get downloadAll => 'Download All';

  @override
  String get downloading => 'Downloading';

  @override
  String get downloadComplete => 'Download complete';

  @override
  String get downloadFailed => 'Download failed';

  @override
  String get startDownload => 'Starting download';

  @override
  String get confirmDeleteDownload =>
      'Are you sure you want to delete this download? The downloaded file will also be removed.';

  @override
  String get deletedSuccessfully => 'Deleted successfully';

  @override
  String get scanSubtitleLibrary => 'Scan Subtitle Library';

  @override
  String get scanning => 'Scanning...';

  @override
  String get scanComplete => 'Scan complete';

  @override
  String get noSubtitleFiles => 'No subtitle files found';

  @override
  String subtitleFilesFound(int count) {
    return 'Found $count subtitle files';
  }

  @override
  String get selectDirectory => 'Select Directory';

  @override
  String get privacyModeSettings => 'Privacy Mode Settings';

  @override
  String get blurCover => 'Blur Cover';

  @override
  String get maskTitle => 'Mask Title';

  @override
  String get customTitle => 'Custom Title';

  @override
  String get privacyModeDesc =>
      'Hide playback information in system notifications and media controls';

  @override
  String get audioFormatSettingsTitle => 'Audio Format Settings';

  @override
  String get preferredFormat => 'Preferred Format';

  @override
  String get cacheSizeLimit => 'Cache Size Limit';

  @override
  String get llmApiUrl => 'API URL';

  @override
  String get llmApiKey => 'API Key';

  @override
  String get llmModel => 'Model';

  @override
  String get llmPrompt => 'System Prompt';

  @override
  String get llmConcurrency => 'Concurrency';

  @override
  String get llmTestTranslation => 'Test Translation';

  @override
  String get llmTestSuccess => 'Test successful';

  @override
  String get llmTestFailed => 'Test failed';

  @override
  String get subtitleTimingAdjustment => 'Subtitle Timing';

  @override
  String get playerLyricStyle => 'Player Lyrics Style';

  @override
  String get floatingLyricStyle => 'Floating Lyrics Style';

  @override
  String get fontSize => 'Font Size';

  @override
  String get fontColor => 'Font Color';

  @override
  String get backgroundColor => 'Background Color';

  @override
  String get transparency => 'Transparency';

  @override
  String get windowSize => 'Window Size';

  @override
  String get playerButtonSettings => 'Player Button Settings';

  @override
  String get showButton => 'Show Button';

  @override
  String get buttonOrder => 'Button Order';

  @override
  String get workCardDisplaySettings => 'Work Card Display';

  @override
  String get showTags => 'Show Tags';

  @override
  String get showVa => 'Show Voice Actors';

  @override
  String get showRating => 'Show Rating';

  @override
  String get showPrice => 'Show Price';

  @override
  String get cardSize => 'Card Size';

  @override
  String get compact => 'Compact';

  @override
  String get medium => 'Medium';

  @override
  String get full => 'Full';

  @override
  String get workDetailDisplaySettings => 'Work Detail Display';

  @override
  String get infoSectionVisibility => 'Info Section Visibility';

  @override
  String get imageSize => 'Image Size';

  @override
  String get showMetadata => 'Show Metadata';

  @override
  String get myTabsDisplaySettings => 'My Page Tab Settings';

  @override
  String get showTab => 'Show Tab';

  @override
  String get tabOrder => 'Tab Order';

  @override
  String get blockedItems => 'Blocked Items';

  @override
  String get blockedTags => 'Blocked Tags';

  @override
  String get blockedVas => 'Blocked Voice Actors';

  @override
  String get blockedCircles => 'Blocked Circles';

  @override
  String get unblock => 'Unblock';

  @override
  String get noBlockedItems => 'No blocked items';

  @override
  String get clearCache => 'Clear Cache';

  @override
  String get clearCacheConfirm => 'Are you sure you want to clear all cache?';

  @override
  String get cacheCleared => 'Cache cleared';

  @override
  String get imagePreview => 'Image Preview';

  @override
  String get saveImage => 'Save Image';

  @override
  String get imageSaved => 'Image saved';

  @override
  String get saveImageFailed => 'Failed to save image';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirm => 'Are you sure you want to logout?';

  @override
  String get openInBrowser => 'Open in Browser';

  @override
  String get copyLink => 'Copy Link';

  @override
  String get linkCopied => 'Link copied';

  @override
  String get ratingDistribution => 'Rating Distribution';

  @override
  String reviewsCount(int count) {
    return '$count reviews';
  }

  @override
  String ratingsCount(int count) {
    return '$count ratings';
  }

  @override
  String get myReviews => 'My Reviews';

  @override
  String get noReviews => 'No reviews';

  @override
  String get writeReview => 'Write Review';

  @override
  String get editReview => 'Edit Review';

  @override
  String get deleteReview => 'Delete Review';

  @override
  String get deleteReviewConfirm =>
      'Are you sure you want to delete this review?';

  @override
  String get reviewDeleted => 'Review deleted';

  @override
  String get reviewContent => 'Review content';

  @override
  String get enterReviewContent => 'Enter review content...';

  @override
  String get submitReview => 'Submit';

  @override
  String get reviewSubmitted => 'Review submitted';

  @override
  String reviewFailed(String error) {
    return 'Review failed: $error';
  }

  @override
  String get notificationPermission => 'Notification Permission';

  @override
  String get mediaPermission => 'Media Library Permission';

  @override
  String get storagePermission => 'Storage Permission';

  @override
  String get granted => 'Granted';

  @override
  String get denied => 'Denied';

  @override
  String get requestPermission => 'Request';

  @override
  String get localDownloads => 'Local Downloads';

  @override
  String get offlinePlayback => 'Offline Playback';

  @override
  String get noDownloadedWorks => 'No downloaded works';

  @override
  String get updateAvailable => 'Update Available';

  @override
  String get ignoreThisVersion => 'Ignore this version';

  @override
  String get remindLater => 'Remind Later';

  @override
  String get updateNow => 'Update Now';

  @override
  String get fetchFailed => 'Fetch failed';

  @override
  String operationFailedWithError(String error) {
    return 'Operation failed: $error';
  }

  @override
  String get aboutSubtitle => 'Check updates, licenses, etc.';

  @override
  String get currentCacheSize => 'Current Cache Size';

  @override
  String cacheLimitLabelMB(int size) {
    return 'Limit: ${size}MB';
  }

  @override
  String get cacheUsagePercent => 'Usage';

  @override
  String get autoCleanTitle => 'Auto Clean Info';

  @override
  String get autoCleanDescription =>
      '• Cache is auto-cleaned when exceeding the limit\n• Deletes until cache drops to 80% of limit\n• Uses Least Recently Used (LRU) strategy';

  @override
  String get autoCleanDescriptionShort =>
      '• Cache is auto-cleaned when exceeding the limit\n• Deletes until cache drops to 80% of limit';

  @override
  String get confirmClear => 'Confirm Clear';

  @override
  String get confirmClearCacheMessage =>
      'Are you sure you want to clear all cache? This action cannot be undone.';

  @override
  String clearCacheFailedWithError(String error) {
    return 'Clear cache failed: $error';
  }

  @override
  String get hasNewVersion => 'New version';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get colorTheme => 'Color Theme';

  @override
  String get themePreview => 'Theme Preview';

  @override
  String get themeModeSystemDesc =>
      'Automatically adapt to system dark/light mode';

  @override
  String get themeModeLightDesc => 'Always use light theme';

  @override
  String get themeModeDarkDesc => 'Always use dark theme';

  @override
  String get colorSchemeOceanBlueDesc => 'Blue, blue, blue!';

  @override
  String get colorSchemeSakuraPinkDesc => '( ゜- ゜)つロ Cheers~';

  @override
  String get colorSchemeSunsetOrangeDesc => 'Themes are a must ✍🏻✍🏻✍🏻';

  @override
  String get colorSchemeLavenderPurpleDesc => 'Bro, bro...';

  @override
  String get colorSchemeForestGreenDesc => 'Green, green, green';

  @override
  String get colorSchemeDynamicDesc =>
      'Use wallpaper colors from system (Android 12+)';

  @override
  String get primaryContainer => 'Primary Container';

  @override
  String get secondaryContainer => 'Secondary Container';

  @override
  String get tertiaryContainer => 'Tertiary Container';

  @override
  String get surfaceColor => 'Surface';

  @override
  String get playerButtonSettingsSubtitle =>
      'Customize player control button order';

  @override
  String get playerLyricStyleSubtitle =>
      'Customize subtitle style for mini and fullscreen player';

  @override
  String get workDetailDisplaySubtitle =>
      'Control info items on work detail page';

  @override
  String get workCardDisplaySubtitle => 'Control info items on work cards';

  @override
  String get myTabsDisplaySubtitle => 'Control tab display in My page';

  @override
  String get pageSizeSettings => 'Items Per Page';

  @override
  String pageSizeCurrent(int size) {
    return 'Current: $size items/page';
  }

  @override
  String currentSettingLabel(String value) {
    return 'Current: $value';
  }

  @override
  String setToValue(String value) {
    return 'Set to: $value';
  }

  @override
  String get llmConfigRequiredMessage =>
      'LLM translation requires an API Key. Please configure it in settings first.';

  @override
  String get autoSwitchedToLlm => 'Auto-switched to: LLM Translation';

  @override
  String get translationDescGoogle =>
      'Requires network access to Google services';

  @override
  String get translationDescYoudao => 'Works with default network';

  @override
  String get translationDescMicrosoft => 'Works with default network';

  @override
  String get translationDescLlm =>
      'OpenAI-compatible API, requires manual API Key configuration';

  @override
  String get audioPassthroughDescAndroid =>
      'Allow raw bitstream output (AC3/DTS) to external decoder. May take exclusive audio control.';

  @override
  String get permissionExplanation => 'Permission Explanation';

  @override
  String get backgroundRunningPermission => 'Background Running Permission';

  @override
  String get notificationPermissionDesc =>
      'Used for showing media playback notification, allowing control from lock screen and notification bar.';

  @override
  String get backgroundRunningPermissionDesc =>
      'Exempts app from battery optimization to ensure audio continues playing in background.';

  @override
  String get notificationGrantedStatus =>
      'Granted - Can show playback notification and controls';

  @override
  String get notificationDeniedStatus =>
      'Not granted - Tap to request permission';

  @override
  String get backgroundGrantedStatus =>
      'Granted - App can run continuously in background';

  @override
  String get backgroundDeniedStatus =>
      'Not granted - Tap to request permission';

  @override
  String get notificationPermissionGranted => 'Notification permission granted';

  @override
  String get notificationPermissionDenied => 'Notification permission denied';

  @override
  String requestNotificationFailed(String error) {
    return 'Failed to request notification permission: $error';
  }

  @override
  String get backgroundPermissionGranted =>
      'Background running permission granted';

  @override
  String get backgroundPermissionDenied =>
      'Background running permission denied';

  @override
  String requestBackgroundFailed(String error) {
    return 'Failed to request background permission: $error';
  }

  @override
  String permissionRequired(String permission) {
    return '$permission Required';
  }

  @override
  String permissionPermanentlyDenied(String permission) {
    return '$permission has been permanently denied. Please enable it manually in system settings.';
  }

  @override
  String get openSettings => 'Open Settings';

  @override
  String get permissionsAndroidOnly =>
      'Permission management is only available on Android';

  @override
  String get permissionsNotNeeded =>
      'Other platforms do not require manual permission management';

  @override
  String get refreshPermissionStatus => 'Refresh permission status';

  @override
  String deleteFileConfirm(String fileName) {
    return 'Are you sure you want to delete \"$fileName\"?';
  }

  @override
  String deleteSelectedFilesConfirm(int count) {
    return 'Are you sure you want to delete $count selected files?';
  }

  @override
  String get deleted => 'Deleted';

  @override
  String cannotOpenFolder(String path) {
    return 'Cannot open folder: $path';
  }

  @override
  String openFolderFailed(String error) {
    return 'Failed to open folder: $error';
  }

  @override
  String get reloadingFromDisk => 'Reloading from disk...';

  @override
  String get refreshComplete => 'Refresh complete';

  @override
  String refreshFailed(String error) {
    return 'Refresh failed: $error';
  }

  @override
  String deleteSelectedWorksConfirm(int count) {
    return 'Are you sure you want to delete $count selected works?';
  }

  @override
  String partialDeleteFailed(String error) {
    return 'Partial deletion failed: $error';
  }

  @override
  String deletedNOfTotal(int success, int total) {
    return 'Deleted $success/$total tasks';
  }

  @override
  String deleteFailedWithError(String error) {
    return 'Deletion failed: $error';
  }

  @override
  String get noWorkMetadataForOffline =>
      'This download has no saved work details and cannot be viewed offline';

  @override
  String openWorkDetailFailed(String error) {
    return 'Failed to open work detail: $error';
  }

  @override
  String get noLocalDownloads => 'No local downloads';

  @override
  String get exitSelection => 'Exit selection';

  @override
  String get reload => 'Reload';

  @override
  String get openFolder => 'Open Folder';

  @override
  String get playlistLink => 'Playlist Link';

  @override
  String get playlistLinkHint =>
      'Paste playlist link, e.g.:\nhttps://www.asmr.one/playlist?id=...';

  @override
  String get unrecognizedPlaylistLink => 'Unrecognized playlist link or ID';

  @override
  String get addingPlaylist => 'Adding playlist...';

  @override
  String get playlistAddedSuccess => 'Playlist added successfully';

  @override
  String get addFailed => 'Add failed';

  @override
  String get playlistNotFound => 'Playlist does not exist or has been deleted';

  @override
  String get noPermissionToAccessPlaylist =>
      'No permission to access this playlist';

  @override
  String get networkConnectionFailed =>
      'Network connection failed, please check network';

  @override
  String addFailedWithError(String error) {
    return 'Add failed: $error';
  }

  @override
  String get creatingPlaylist => 'Creating playlist...';

  @override
  String playlistCreatedSuccess(String name) {
    return 'Playlist \"$name\" created successfully';
  }

  @override
  String createFailedWithError(String error) {
    return 'Creation failed: $error';
  }

  @override
  String get noPlaylists => 'No playlists';

  @override
  String get noPlaylistsDescription =>
      'You haven\'t created or favorited any playlists yet';

  @override
  String get myPlaylists => 'My Playlists';

  @override
  String totalNItems(int count) {
    return '$count total';
  }

  @override
  String get systemPlaylistCannotDelete => 'System playlists cannot be deleted';

  @override
  String get deletePlaylist => 'Delete Playlist';

  @override
  String get unfavoritePlaylist => 'Unfavorite Playlist';

  @override
  String get deletePlaylistConfirm =>
      'Deletion is irreversible. Users who favorited this playlist will lose access. Are you sure?';

  @override
  String unfavoritePlaylistConfirm(String name) {
    return 'Are you sure you want to unfavorite \"$name\"?';
  }

  @override
  String get unfavorite => 'Unfavorite';

  @override
  String get deleting => 'Deleting...';

  @override
  String get deleteSuccess => 'Deleted successfully';

  @override
  String get onlyOwnerCanEdit => 'Only the playlist owner can edit';

  @override
  String get editPlaylist => 'Edit Playlist';

  @override
  String get playlistNameRequired => 'Playlist name cannot be empty';

  @override
  String get privacyDescPrivate => 'Only you can view';

  @override
  String get privacyDescUnlisted => 'Only people with the link can view';

  @override
  String get privacyDescPublic => 'Anyone can view';

  @override
  String get addWorks => 'Add Works';

  @override
  String get addWorksInputHint =>
      'Enter text containing work IDs, RJ numbers will be auto-detected';

  @override
  String get workId => 'Work ID';

  @override
  String get workIdHint => 'e.g.: RJ123456\nrj233333';

  @override
  String detectedNWorkIds(int count) {
    return 'Detected $count work IDs';
  }

  @override
  String addNWorks(int count) {
    return 'Add $count';
  }

  @override
  String get noValidWorkIds => 'No valid work IDs found (starting with RJ)';

  @override
  String addingNWorks(int count) {
    return 'Adding $count works...';
  }

  @override
  String addedNWorksSuccess(int count) {
    return 'Successfully added $count works';
  }

  @override
  String get removeWork => 'Remove Work';

  @override
  String removeWorkConfirm(String title) {
    return 'Are you sure you want to remove \"$title\" from the playlist?';
  }

  @override
  String get removeSuccess => 'Removed successfully';

  @override
  String removeFailedWithError(String error) {
    return 'Remove failed: $error';
  }

  @override
  String get saving => 'Saving...';

  @override
  String get saveSuccess => 'Saved successfully';

  @override
  String saveFailedWithError(String error) {
    return 'Save failed: $error';
  }

  @override
  String get noWorks => 'No works';

  @override
  String get playlistNoWorksDescription =>
      'No works have been added to this playlist yet';

  @override
  String get lastUpdated => 'Last updated';

  @override
  String get createdTime => 'Created';

  @override
  String nWorksCount(int count) {
    return '$count works';
  }

  @override
  String nPlaysCount(int count) {
    return '$count plays';
  }

  @override
  String get removeFromPlaylist => 'Remove from playlist';

  @override
  String get checkNetworkOrRetry =>
      'Please check your network connection or try again later';

  @override
  String get reachedEnd => 'You\'ve reached the end~';

  @override
  String excludedNWorks(int count) {
    return 'Excluded $count works';
  }

  @override
  String pageExcludedNWorks(int count) {
    return 'This page excluded $count works';
  }
}
