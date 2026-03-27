import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('ru'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'KikoFlu'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get navSearch;

  /// No description provided for @navMy.
  ///
  /// In en, this message translates to:
  /// **'My'**
  String get navMy;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @offlineModeMessage.
  ///
  /// In en, this message translates to:
  /// **'Offline mode: Network connection failed, only downloaded content is accessible'**
  String get offlineModeMessage;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @searchTypeKeyword.
  ///
  /// In en, this message translates to:
  /// **'Keyword'**
  String get searchTypeKeyword;

  /// No description provided for @searchTypeTag.
  ///
  /// In en, this message translates to:
  /// **'Tag'**
  String get searchTypeTag;

  /// No description provided for @searchTypeVa.
  ///
  /// In en, this message translates to:
  /// **'Voice Actor'**
  String get searchTypeVa;

  /// No description provided for @searchTypeCircle.
  ///
  /// In en, this message translates to:
  /// **'Circle'**
  String get searchTypeCircle;

  /// No description provided for @searchTypeRjNumber.
  ///
  /// In en, this message translates to:
  /// **'RJ Number'**
  String get searchTypeRjNumber;

  /// No description provided for @searchHintKeyword.
  ///
  /// In en, this message translates to:
  /// **'Enter work name or keyword...'**
  String get searchHintKeyword;

  /// No description provided for @searchHintTag.
  ///
  /// In en, this message translates to:
  /// **'Enter tag name...'**
  String get searchHintTag;

  /// No description provided for @searchHintVa.
  ///
  /// In en, this message translates to:
  /// **'Enter voice actor name...'**
  String get searchHintVa;

  /// No description provided for @searchHintCircle.
  ///
  /// In en, this message translates to:
  /// **'Enter circle name...'**
  String get searchHintCircle;

  /// No description provided for @searchHintRjNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter number...'**
  String get searchHintRjNumber;

  /// No description provided for @ageRatingAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get ageRatingAll;

  /// No description provided for @ageRatingGeneral.
  ///
  /// In en, this message translates to:
  /// **'All Ages'**
  String get ageRatingGeneral;

  /// No description provided for @ageRatingR15.
  ///
  /// In en, this message translates to:
  /// **'R-15'**
  String get ageRatingR15;

  /// No description provided for @ageRatingAdult.
  ///
  /// In en, this message translates to:
  /// **'Adult'**
  String get ageRatingAdult;

  /// No description provided for @salesRangeAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get salesRangeAll;

  /// No description provided for @sortRelease.
  ///
  /// In en, this message translates to:
  /// **'Release Date'**
  String get sortRelease;

  /// No description provided for @sortCreateDate.
  ///
  /// In en, this message translates to:
  /// **'Catalog Date'**
  String get sortCreateDate;

  /// No description provided for @sortRating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get sortRating;

  /// No description provided for @sortReviewCount.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get sortReviewCount;

  /// No description provided for @sortRandom.
  ///
  /// In en, this message translates to:
  /// **'Random'**
  String get sortRandom;

  /// No description provided for @sortDlCount.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get sortDlCount;

  /// No description provided for @sortPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get sortPrice;

  /// No description provided for @sortNsfw.
  ///
  /// In en, this message translates to:
  /// **'All Ages'**
  String get sortNsfw;

  /// No description provided for @sortUpdatedAt.
  ///
  /// In en, this message translates to:
  /// **'Marked Date'**
  String get sortUpdatedAt;

  /// No description provided for @sortAsc.
  ///
  /// In en, this message translates to:
  /// **'Ascending'**
  String get sortAsc;

  /// No description provided for @sortDesc.
  ///
  /// In en, this message translates to:
  /// **'Descending'**
  String get sortDesc;

  /// No description provided for @sortOptions.
  ///
  /// In en, this message translates to:
  /// **'Sort Options'**
  String get sortOptions;

  /// No description provided for @sortField.
  ///
  /// In en, this message translates to:
  /// **'Sort Field'**
  String get sortField;

  /// No description provided for @sortDirection.
  ///
  /// In en, this message translates to:
  /// **'Sort Direction'**
  String get sortDirection;

  /// No description provided for @displayModeAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get displayModeAll;

  /// No description provided for @displayModePopular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get displayModePopular;

  /// No description provided for @displayModeRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get displayModeRecommended;

  /// No description provided for @subtitlePriorityHighest.
  ///
  /// In en, this message translates to:
  /// **'Priority'**
  String get subtitlePriorityHighest;

  /// No description provided for @subtitlePriorityLowest.
  ///
  /// In en, this message translates to:
  /// **'Deferred'**
  String get subtitlePriorityLowest;

  /// No description provided for @translationSourceGoogle.
  ///
  /// In en, this message translates to:
  /// **'Google Translate'**
  String get translationSourceGoogle;

  /// No description provided for @translationSourceYoudao.
  ///
  /// In en, this message translates to:
  /// **'Youdao Translate'**
  String get translationSourceYoudao;

  /// No description provided for @translationSourceMicrosoft.
  ///
  /// In en, this message translates to:
  /// **'Microsoft Translate'**
  String get translationSourceMicrosoft;

  /// No description provided for @translationSourceLlm.
  ///
  /// In en, this message translates to:
  /// **'LLM Translate'**
  String get translationSourceLlm;

  /// No description provided for @progressMarked.
  ///
  /// In en, this message translates to:
  /// **'Marked'**
  String get progressMarked;

  /// No description provided for @progressListening.
  ///
  /// In en, this message translates to:
  /// **'Listening'**
  String get progressListening;

  /// No description provided for @progressListened.
  ///
  /// In en, this message translates to:
  /// **'Listened'**
  String get progressListened;

  /// No description provided for @progressReplay.
  ///
  /// In en, this message translates to:
  /// **'Replay'**
  String get progressReplay;

  /// No description provided for @progressPostponed.
  ///
  /// In en, this message translates to:
  /// **'Postponed'**
  String get progressPostponed;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @addAccount.
  ///
  /// In en, this message translates to:
  /// **'Add Account'**
  String get addAccount;

  /// No description provided for @registerAccount.
  ///
  /// In en, this message translates to:
  /// **'Register Account'**
  String get registerAccount;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @serverAddress.
  ///
  /// In en, this message translates to:
  /// **'Server Address'**
  String get serverAddress;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login successful'**
  String get loginSuccess;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// No description provided for @registerFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration failed'**
  String get registerFailed;

  /// No description provided for @usernameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Username must be at least 5 characters'**
  String get usernameMinLength;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 5 characters'**
  String get passwordMinLength;

  /// No description provided for @accountAdded.
  ///
  /// In en, this message translates to:
  /// **'Account \"{username}\" has been added'**
  String accountAdded(String username);

  /// No description provided for @testConnection.
  ///
  /// In en, this message translates to:
  /// **'Test Connection'**
  String get testConnection;

  /// No description provided for @testing.
  ///
  /// In en, this message translates to:
  /// **'Testing...'**
  String get testing;

  /// No description provided for @enterServerAddressToTest.
  ///
  /// In en, this message translates to:
  /// **'Please enter server address to test connection'**
  String get enterServerAddressToTest;

  /// No description provided for @latencyMs.
  ///
  /// In en, this message translates to:
  /// **'{ms}ms'**
  String latencyMs(String ms);

  /// No description provided for @connectionFailed.
  ///
  /// In en, this message translates to:
  /// **'Connection failed'**
  String get connectionFailed;

  /// No description provided for @guestModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Guest Mode Confirmation'**
  String get guestModeTitle;

  /// No description provided for @guestModeMessage.
  ///
  /// In en, this message translates to:
  /// **'Guest mode has limited functionality:\n\n• Cannot mark or rate works\n• Cannot create playlists\n• Cannot sync progress\n\nGuest mode uses a demo account to connect to the server, which may be unstable.'**
  String get guestModeMessage;

  /// No description provided for @continueGuestMode.
  ///
  /// In en, this message translates to:
  /// **'Continue with Guest Mode'**
  String get continueGuestMode;

  /// No description provided for @guestAccountAdded.
  ///
  /// In en, this message translates to:
  /// **'Guest account has been added'**
  String get guestAccountAdded;

  /// No description provided for @guestLoginFailed.
  ///
  /// In en, this message translates to:
  /// **'Guest login failed'**
  String get guestLoginFailed;

  /// No description provided for @guestMode.
  ///
  /// In en, this message translates to:
  /// **'Guest Mode'**
  String get guestMode;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @advancedFilter.
  ///
  /// In en, this message translates to:
  /// **'Advanced Filter'**
  String get advancedFilter;

  /// No description provided for @enterSearchContent.
  ///
  /// In en, this message translates to:
  /// **'Please enter search content'**
  String get enterSearchContent;

  /// No description provided for @searchTag.
  ///
  /// In en, this message translates to:
  /// **'Search tags...'**
  String get searchTag;

  /// No description provided for @minRating.
  ///
  /// In en, this message translates to:
  /// **'Min Rating'**
  String get minRating;

  /// No description provided for @minRatingStars.
  ///
  /// In en, this message translates to:
  /// **'{stars} stars'**
  String minRatingStars(String stars);

  /// No description provided for @searchHistory.
  ///
  /// In en, this message translates to:
  /// **'Search History'**
  String get searchHistory;

  /// No description provided for @clearSearchHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear Search History'**
  String get clearSearchHistory;

  /// No description provided for @clearSearchHistoryConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all search history?'**
  String get clearSearchHistoryConfirm;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @searchHistoryCleared.
  ///
  /// In en, this message translates to:
  /// **'Search history cleared'**
  String get searchHistoryCleared;

  /// No description provided for @noSearchHistory.
  ///
  /// In en, this message translates to:
  /// **'No search history'**
  String get noSearchHistory;

  /// No description provided for @excludeMode.
  ///
  /// In en, this message translates to:
  /// **'Exclude'**
  String get excludeMode;

  /// No description provided for @includeMode.
  ///
  /// In en, this message translates to:
  /// **'Include'**
  String get includeMode;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get noResults;

  /// No description provided for @loadFailed.
  ///
  /// In en, this message translates to:
  /// **'Load failed'**
  String get loadFailed;

  /// No description provided for @loadFailedWithError.
  ///
  /// In en, this message translates to:
  /// **'Load failed: {error}'**
  String loadFailedWithError(String error);

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @calculating.
  ///
  /// In en, this message translates to:
  /// **'Calculating...'**
  String get calculating;

  /// No description provided for @getFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to retrieve'**
  String get getFailed;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @accountManagement.
  ///
  /// In en, this message translates to:
  /// **'Account Management'**
  String get accountManagement;

  /// No description provided for @accountManagementSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Multi-account management, switch accounts'**
  String get accountManagementSubtitle;

  /// No description provided for @privacyMode.
  ///
  /// In en, this message translates to:
  /// **'Privacy Mode'**
  String get privacyMode;

  /// No description provided for @privacyModeEnabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled - Playback info is hidden'**
  String get privacyModeEnabled;

  /// No description provided for @privacyModeDisabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get privacyModeDisabled;

  /// No description provided for @permissionManagement.
  ///
  /// In en, this message translates to:
  /// **'Permission Management'**
  String get permissionManagement;

  /// No description provided for @permissionManagementSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Notification permissions, background running permissions'**
  String get permissionManagementSubtitle;

  /// No description provided for @desktopFloatingLyric.
  ///
  /// In en, this message translates to:
  /// **'Desktop Floating Lyrics'**
  String get desktopFloatingLyric;

  /// No description provided for @floatingLyricEnabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled - Lyrics will display on desktop'**
  String get floatingLyricEnabled;

  /// No description provided for @floatingLyricDisabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get floatingLyricDisabled;

  /// No description provided for @styleSettings.
  ///
  /// In en, this message translates to:
  /// **'Style Settings'**
  String get styleSettings;

  /// No description provided for @styleSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize font, color, transparency, etc.'**
  String get styleSettingsSubtitle;

  /// No description provided for @downloadPath.
  ///
  /// In en, this message translates to:
  /// **'Download Path'**
  String get downloadPath;

  /// No description provided for @downloadPathSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize download file save location'**
  String get downloadPathSubtitle;

  /// No description provided for @cacheManagement.
  ///
  /// In en, this message translates to:
  /// **'Cache Management'**
  String get cacheManagement;

  /// No description provided for @currentCache.
  ///
  /// In en, this message translates to:
  /// **'Current cache: {size}'**
  String currentCache(String size);

  /// No description provided for @themeSettings.
  ///
  /// In en, this message translates to:
  /// **'Theme Settings'**
  String get themeSettings;

  /// No description provided for @themeSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Dark mode, theme color, etc.'**
  String get themeSettingsSubtitle;

  /// No description provided for @uiSettings.
  ///
  /// In en, this message translates to:
  /// **'UI Settings'**
  String get uiSettings;

  /// No description provided for @uiSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Player, detail page, cards, etc.'**
  String get uiSettingsSubtitle;

  /// No description provided for @preferenceSettings.
  ///
  /// In en, this message translates to:
  /// **'Preference Settings'**
  String get preferenceSettings;

  /// No description provided for @preferenceSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Translation source, blocking, audio preferences, etc.'**
  String get preferenceSettingsSubtitle;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTitle;

  /// No description provided for @unknownVersion.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknownVersion;

  /// No description provided for @licenseLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load LICENSE file'**
  String get licenseLoadFailed;

  /// No description provided for @licenseEmpty.
  ///
  /// In en, this message translates to:
  /// **'LICENSE content is empty'**
  String get licenseEmpty;

  /// No description provided for @failedToLoadAbout.
  ///
  /// In en, this message translates to:
  /// **'Failed to load about info'**
  String get failedToLoadAbout;

  /// No description provided for @newVersionFound.
  ///
  /// In en, this message translates to:
  /// **'New Version Found'**
  String get newVersionFound;

  /// No description provided for @newVersionAvailable.
  ///
  /// In en, this message translates to:
  /// **'{version} available (current: {current})'**
  String newVersionAvailable(String version, String current);

  /// No description provided for @versionInfo.
  ///
  /// In en, this message translates to:
  /// **'Version Info'**
  String get versionInfo;

  /// No description provided for @currentVersion.
  ///
  /// In en, this message translates to:
  /// **'Current version: {version}'**
  String currentVersion(String version);

  /// No description provided for @checkUpdate.
  ///
  /// In en, this message translates to:
  /// **'Check for Updates'**
  String get checkUpdate;

  /// No description provided for @author.
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get author;

  /// No description provided for @projectRepo.
  ///
  /// In en, this message translates to:
  /// **'Project Repository'**
  String get projectRepo;

  /// No description provided for @openSourceLicense.
  ///
  /// In en, this message translates to:
  /// **'Open Source License'**
  String get openSourceLicense;

  /// No description provided for @cannotOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Cannot open link'**
  String get cannotOpenLink;

  /// No description provided for @openLinkFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to open link: {error}'**
  String openLinkFailed(String error);

  /// No description provided for @foundNewVersion.
  ///
  /// In en, this message translates to:
  /// **'Found new version {version}'**
  String foundNewVersion(String version);

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @alreadyLatestVersion.
  ///
  /// In en, this message translates to:
  /// **'Already the latest version'**
  String get alreadyLatestVersion;

  /// No description provided for @checkUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Update check failed, please check network connection'**
  String get checkUpdateFailed;

  /// No description provided for @onlineMarks.
  ///
  /// In en, this message translates to:
  /// **'Online Marks'**
  String get onlineMarks;

  /// No description provided for @historyRecord.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyRecord;

  /// No description provided for @playlists.
  ///
  /// In en, this message translates to:
  /// **'Playlists'**
  String get playlists;

  /// No description provided for @downloaded.
  ///
  /// In en, this message translates to:
  /// **'Downloaded'**
  String get downloaded;

  /// No description provided for @downloadTasks.
  ///
  /// In en, this message translates to:
  /// **'Download Tasks'**
  String get downloadTasks;

  /// No description provided for @subtitleLibrary.
  ///
  /// In en, this message translates to:
  /// **'Subtitle Library'**
  String get subtitleLibrary;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @marked.
  ///
  /// In en, this message translates to:
  /// **'Marked'**
  String get marked;

  /// No description provided for @listening.
  ///
  /// In en, this message translates to:
  /// **'Listening'**
  String get listening;

  /// No description provided for @listened.
  ///
  /// In en, this message translates to:
  /// **'Listened'**
  String get listened;

  /// No description provided for @replayMark.
  ///
  /// In en, this message translates to:
  /// **'Replay'**
  String get replayMark;

  /// No description provided for @postponed.
  ///
  /// In en, this message translates to:
  /// **'Postponed'**
  String get postponed;

  /// No description provided for @switchToSmallGrid.
  ///
  /// In en, this message translates to:
  /// **'Switch to small grid view'**
  String get switchToSmallGrid;

  /// No description provided for @switchToList.
  ///
  /// In en, this message translates to:
  /// **'Switch to list view'**
  String get switchToList;

  /// No description provided for @switchToLargeGrid.
  ///
  /// In en, this message translates to:
  /// **'Switch to large grid view'**
  String get switchToLargeGrid;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @noPlayHistory.
  ///
  /// In en, this message translates to:
  /// **'No play history'**
  String get noPlayHistory;

  /// No description provided for @clearHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear History'**
  String get clearHistory;

  /// No description provided for @clearHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear History'**
  String get clearHistoryTitle;

  /// No description provided for @clearHistoryConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all play history? This action cannot be undone.'**
  String get clearHistoryConfirm;

  /// No description provided for @popularNoSort.
  ///
  /// In en, this message translates to:
  /// **'Popular mode does not support sorting'**
  String get popularNoSort;

  /// No description provided for @recommendedNoSort.
  ///
  /// In en, this message translates to:
  /// **'Recommended mode does not support sorting'**
  String get recommendedNoSort;

  /// No description provided for @showAllWorks.
  ///
  /// In en, this message translates to:
  /// **'Show all works'**
  String get showAllWorks;

  /// No description provided for @showOnlySubtitled.
  ///
  /// In en, this message translates to:
  /// **'Show only subtitled works'**
  String get showOnlySubtitled;

  /// No description provided for @selectedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String selectedCount(int count);

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get selectAll;

  /// No description provided for @deselectAll.
  ///
  /// In en, this message translates to:
  /// **'Deselect All'**
  String get deselectAll;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @noDownloadTasks.
  ///
  /// In en, this message translates to:
  /// **'No download tasks'**
  String get noDownloadTasks;

  /// No description provided for @nFiles.
  ///
  /// In en, this message translates to:
  /// **'{count} files'**
  String nFiles(int count);

  /// No description provided for @errorWithMessage.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorWithMessage(String error);

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @deletionConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get deletionConfirmTitle;

  /// No description provided for @deletionConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {count} selected download tasks? Downloaded files will also be removed.'**
  String deletionConfirmMessage(int count);

  /// No description provided for @deletedNFiles.
  ///
  /// In en, this message translates to:
  /// **'Deleted {count} files'**
  String deletedNFiles(int count);

  /// No description provided for @downloadStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get downloadStatusPending;

  /// No description provided for @downloadStatusDownloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading'**
  String get downloadStatusDownloading;

  /// No description provided for @downloadStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get downloadStatusCompleted;

  /// No description provided for @downloadStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get downloadStatusFailed;

  /// No description provided for @downloadStatusPaused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get downloadStatusPaused;

  /// No description provided for @translationFailed.
  ///
  /// In en, this message translates to:
  /// **'Translation failed: {error}'**
  String translationFailed(String error);

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied {label}: {text}'**
  String copiedToClipboard(String label, String text);

  /// No description provided for @loadingFileList.
  ///
  /// In en, this message translates to:
  /// **'Loading file list...'**
  String get loadingFileList;

  /// No description provided for @loadFileListFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load file list: {error}'**
  String loadFileListFailed(String error);

  /// No description provided for @playlistTitle.
  ///
  /// In en, this message translates to:
  /// **'Playlist'**
  String get playlistTitle;

  /// No description provided for @noAudioPlaying.
  ///
  /// In en, this message translates to:
  /// **'No audio playing'**
  String get noAudioPlaying;

  /// No description provided for @playbackSpeed.
  ///
  /// In en, this message translates to:
  /// **'Playback Speed'**
  String get playbackSpeed;

  /// No description provided for @backward10s.
  ///
  /// In en, this message translates to:
  /// **'Backward 10s'**
  String get backward10s;

  /// No description provided for @forward10s.
  ///
  /// In en, this message translates to:
  /// **'Forward 10s'**
  String get forward10s;

  /// No description provided for @sleepTimer.
  ///
  /// In en, this message translates to:
  /// **'Sleep Timer'**
  String get sleepTimer;

  /// No description provided for @repeatMode.
  ///
  /// In en, this message translates to:
  /// **'Repeat Mode'**
  String get repeatMode;

  /// No description provided for @repeatOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get repeatOff;

  /// No description provided for @repeatOne.
  ///
  /// In en, this message translates to:
  /// **'Single'**
  String get repeatOne;

  /// No description provided for @repeatAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get repeatAll;

  /// No description provided for @addMark.
  ///
  /// In en, this message translates to:
  /// **'Add Mark'**
  String get addMark;

  /// No description provided for @viewDetail.
  ///
  /// In en, this message translates to:
  /// **'View Detail'**
  String get viewDetail;

  /// No description provided for @volume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get volume;

  /// No description provided for @sleepTimerTitle.
  ///
  /// In en, this message translates to:
  /// **'Sleep Timer'**
  String get sleepTimerTitle;

  /// No description provided for @aboutToStop.
  ///
  /// In en, this message translates to:
  /// **'About to stop'**
  String get aboutToStop;

  /// No description provided for @remainingTime.
  ///
  /// In en, this message translates to:
  /// **'Remaining time'**
  String get remainingTime;

  /// No description provided for @finishCurrentTrack.
  ///
  /// In en, this message translates to:
  /// **'Stop after current track finishes'**
  String get finishCurrentTrack;

  /// No description provided for @addMinutes.
  ///
  /// In en, this message translates to:
  /// **'+{min} min'**
  String addMinutes(int min);

  /// No description provided for @cancelTimer.
  ///
  /// In en, this message translates to:
  /// **'Cancel Timer'**
  String get cancelTimer;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @specifyTime.
  ///
  /// In en, this message translates to:
  /// **'Specify Time'**
  String get specifyTime;

  /// No description provided for @selectTimerDuration.
  ///
  /// In en, this message translates to:
  /// **'Select timer duration'**
  String get selectTimerDuration;

  /// No description provided for @selectStopTime.
  ///
  /// In en, this message translates to:
  /// **'Select the time to stop playback'**
  String get selectStopTime;

  /// No description provided for @markWork.
  ///
  /// In en, this message translates to:
  /// **'Mark Work'**
  String get markWork;

  /// No description provided for @addToPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Add to Playlist'**
  String get addToPlaylist;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @createPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Create Playlist'**
  String get createPlaylist;

  /// No description provided for @addPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Add Playlist'**
  String get addPlaylist;

  /// No description provided for @playlistName.
  ///
  /// In en, this message translates to:
  /// **'Playlist Name'**
  String get playlistName;

  /// No description provided for @enterPlaylistName.
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get enterPlaylistName;

  /// No description provided for @privacySetting.
  ///
  /// In en, this message translates to:
  /// **'Privacy Setting'**
  String get privacySetting;

  /// No description provided for @playlistDescription.
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get playlistDescription;

  /// No description provided for @addDescription.
  ///
  /// In en, this message translates to:
  /// **'Add a description'**
  String get addDescription;

  /// No description provided for @enterPlaylistNameWarning.
  ///
  /// In en, this message translates to:
  /// **'Please enter a playlist name'**
  String get enterPlaylistNameWarning;

  /// No description provided for @enterPlaylistLink.
  ///
  /// In en, this message translates to:
  /// **'Please enter a playlist link'**
  String get enterPlaylistLink;

  /// No description provided for @switchAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Switch Account'**
  String get switchAccountTitle;

  /// No description provided for @switchAccountConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to switch to account \"{username}\"?'**
  String switchAccountConfirm(String username);

  /// No description provided for @switchedToAccount.
  ///
  /// In en, this message translates to:
  /// **'Switched to account: {username}'**
  String switchedToAccount(String username);

  /// No description provided for @switchFailed.
  ///
  /// In en, this message translates to:
  /// **'Switch failed, please check account info'**
  String get switchFailed;

  /// No description provided for @switchFailedWithError.
  ///
  /// In en, this message translates to:
  /// **'Switch failed: {error}'**
  String switchFailedWithError(String error);

  /// No description provided for @noAccounts.
  ///
  /// In en, this message translates to:
  /// **'No accounts'**
  String get noAccounts;

  /// No description provided for @tapToAddAccount.
  ///
  /// In en, this message translates to:
  /// **'Tap the button in the bottom right to add an account'**
  String get tapToAddAccount;

  /// No description provided for @currentAccount.
  ///
  /// In en, this message translates to:
  /// **'Current Account'**
  String get currentAccount;

  /// No description provided for @switchAction.
  ///
  /// In en, this message translates to:
  /// **'Switch'**
  String get switchAction;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete account \"{username}\"? This action cannot be undone.'**
  String deleteAccountConfirm(String username);

  /// No description provided for @accountDeleted.
  ///
  /// In en, this message translates to:
  /// **'Account deleted'**
  String get accountDeleted;

  /// No description provided for @deletionFailedWithError.
  ///
  /// In en, this message translates to:
  /// **'Deletion failed: {error}'**
  String deletionFailedWithError(String error);

  /// No description provided for @subtitleLibraryPriority.
  ///
  /// In en, this message translates to:
  /// **'Subtitle Library Priority'**
  String get subtitleLibraryPriority;

  /// No description provided for @selectSubtitlePriority.
  ///
  /// In en, this message translates to:
  /// **'Select subtitle library priority for auto-loading:'**
  String get selectSubtitlePriority;

  /// No description provided for @subtitlePriorityHighestDesc.
  ///
  /// In en, this message translates to:
  /// **'Search subtitle library first, then online/downloads'**
  String get subtitlePriorityHighestDesc;

  /// No description provided for @subtitlePriorityLowestDesc.
  ///
  /// In en, this message translates to:
  /// **'Search online/downloads first, then subtitle library'**
  String get subtitlePriorityLowestDesc;

  /// No description provided for @defaultSortSettings.
  ///
  /// In en, this message translates to:
  /// **'Default Sort Settings'**
  String get defaultSortSettings;

  /// No description provided for @defaultSortUpdated.
  ///
  /// In en, this message translates to:
  /// **'Default sort updated'**
  String get defaultSortUpdated;

  /// No description provided for @translationSourceSettings.
  ///
  /// In en, this message translates to:
  /// **'Translation Source Settings'**
  String get translationSourceSettings;

  /// No description provided for @selectTranslationProvider.
  ///
  /// In en, this message translates to:
  /// **'Select translation service provider:'**
  String get selectTranslationProvider;

  /// No description provided for @needsConfiguration.
  ///
  /// In en, this message translates to:
  /// **'Needs configuration'**
  String get needsConfiguration;

  /// No description provided for @llmTranslation.
  ///
  /// In en, this message translates to:
  /// **'LLM Translation'**
  String get llmTranslation;

  /// No description provided for @goToConfigure.
  ///
  /// In en, this message translates to:
  /// **'Configure'**
  String get goToConfigure;

  /// No description provided for @subtitlePrioritySettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Subtitle library priority'**
  String get subtitlePrioritySettingSubtitle;

  /// No description provided for @defaultSortSettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Default sort for home page'**
  String get defaultSortSettingTitle;

  /// No description provided for @translationSource.
  ///
  /// In en, this message translates to:
  /// **'Translation Source'**
  String get translationSource;

  /// No description provided for @llmSettings.
  ///
  /// In en, this message translates to:
  /// **'LLM Settings'**
  String get llmSettings;

  /// No description provided for @llmSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Configure API URL, Key, and model'**
  String get llmSettingsSubtitle;

  /// No description provided for @audioFormatPreference.
  ///
  /// In en, this message translates to:
  /// **'Audio Format Preference'**
  String get audioFormatPreference;

  /// No description provided for @audioFormatSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Set audio format priority order'**
  String get audioFormatSubtitle;

  /// No description provided for @blockingSettings.
  ///
  /// In en, this message translates to:
  /// **'Blocking Settings'**
  String get blockingSettings;

  /// No description provided for @blockingSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage blocked tags, voice actors, and circles'**
  String get blockingSettingsSubtitle;

  /// No description provided for @audioPassthrough.
  ///
  /// In en, this message translates to:
  /// **'Audio Passthrough (Beta)'**
  String get audioPassthrough;

  /// No description provided for @audioPassthroughDescWindows.
  ///
  /// In en, this message translates to:
  /// **'Enable WASAPI exclusive mode for lossless output (restart required)'**
  String get audioPassthroughDescWindows;

  /// No description provided for @audioPassthroughDescMac.
  ///
  /// In en, this message translates to:
  /// **'Enable CoreAudio exclusive mode for lossless output'**
  String get audioPassthroughDescMac;

  /// No description provided for @audioPassthroughDisableDesc.
  ///
  /// In en, this message translates to:
  /// **'Disable audio passthrough mode'**
  String get audioPassthroughDisableDesc;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @audioPassthroughWarning.
  ///
  /// In en, this message translates to:
  /// **'This feature is not fully tested and may cause unexpected audio output. Are you sure you want to enable it?'**
  String get audioPassthroughWarning;

  /// No description provided for @exclusiveModeEnabled.
  ///
  /// In en, this message translates to:
  /// **'Exclusive mode enabled (restart required)'**
  String get exclusiveModeEnabled;

  /// No description provided for @audioPassthroughEnabled.
  ///
  /// In en, this message translates to:
  /// **'Audio passthrough mode enabled'**
  String get audioPassthroughEnabled;

  /// No description provided for @audioPassthroughDisabled.
  ///
  /// In en, this message translates to:
  /// **'Audio passthrough mode disabled'**
  String get audioPassthroughDisabled;

  /// No description provided for @tagVoteSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get tagVoteSupport;

  /// No description provided for @tagVoteOppose.
  ///
  /// In en, this message translates to:
  /// **'Oppose'**
  String get tagVoteOppose;

  /// No description provided for @tagVoted.
  ///
  /// In en, this message translates to:
  /// **'Voted'**
  String get tagVoted;

  /// No description provided for @votedSupport.
  ///
  /// In en, this message translates to:
  /// **'Voted support'**
  String get votedSupport;

  /// No description provided for @votedOppose.
  ///
  /// In en, this message translates to:
  /// **'Voted oppose'**
  String get votedOppose;

  /// No description provided for @voteCancelled.
  ///
  /// In en, this message translates to:
  /// **'Vote cancelled'**
  String get voteCancelled;

  /// No description provided for @voteFailed.
  ///
  /// In en, this message translates to:
  /// **'Vote failed: {error}'**
  String voteFailed(String error);

  /// No description provided for @blockThisTag.
  ///
  /// In en, this message translates to:
  /// **'Block this tag'**
  String get blockThisTag;

  /// No description provided for @copyTag.
  ///
  /// In en, this message translates to:
  /// **'Copy Tag'**
  String get copyTag;

  /// No description provided for @addTag.
  ///
  /// In en, this message translates to:
  /// **'Add Tag'**
  String get addTag;

  /// No description provided for @loadTagsFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load tags: {error}'**
  String loadTagsFailed(String error);

  /// No description provided for @selectAtLeastOneTag.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one tag'**
  String get selectAtLeastOneTag;

  /// No description provided for @tagSubmitSuccess.
  ///
  /// In en, this message translates to:
  /// **'Tags submitted, waiting for server to process'**
  String get tagSubmitSuccess;

  /// No description provided for @bindEmailFirst.
  ///
  /// In en, this message translates to:
  /// **'Please bind your email at www.asmr.one first'**
  String get bindEmailFirst;

  /// No description provided for @selectedNTags.
  ///
  /// In en, this message translates to:
  /// **'Selected {count} tags:'**
  String selectedNTags(int count);

  /// No description provided for @noMatchingTags.
  ///
  /// In en, this message translates to:
  /// **'No matching tags found'**
  String get noMatchingTags;

  /// No description provided for @loadFailedRetry.
  ///
  /// In en, this message translates to:
  /// **'Load failed, tap to retry'**
  String get loadFailedRetry;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @playlistPrivacyPrivate.
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get playlistPrivacyPrivate;

  /// No description provided for @playlistPrivacyUnlisted.
  ///
  /// In en, this message translates to:
  /// **'Unlisted'**
  String get playlistPrivacyUnlisted;

  /// No description provided for @playlistPrivacyPublic.
  ///
  /// In en, this message translates to:
  /// **'Public'**
  String get playlistPrivacyPublic;

  /// No description provided for @systemPlaylistMarked.
  ///
  /// In en, this message translates to:
  /// **'My Marked'**
  String get systemPlaylistMarked;

  /// No description provided for @systemPlaylistLiked.
  ///
  /// In en, this message translates to:
  /// **'My Liked'**
  String get systemPlaylistLiked;

  /// No description provided for @totalNWorks.
  ///
  /// In en, this message translates to:
  /// **'{count} works'**
  String totalNWorks(int count);

  /// No description provided for @pageNOfTotal.
  ///
  /// In en, this message translates to:
  /// **'Page {page}/{total}'**
  String pageNOfTotal(int page, int total);

  /// No description provided for @translateTitle.
  ///
  /// In en, this message translates to:
  /// **'Translate'**
  String get translateTitle;

  /// No description provided for @translateDescription.
  ///
  /// In en, this message translates to:
  /// **'Translate Description'**
  String get translateDescription;

  /// No description provided for @translating.
  ///
  /// In en, this message translates to:
  /// **'Translating...'**
  String get translating;

  /// No description provided for @translationFallbackNotice.
  ///
  /// In en, this message translates to:
  /// **'Translation failed, auto-switched to {source}'**
  String translationFallbackNotice(String source);

  /// No description provided for @tagLabel.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tagLabel;

  /// No description provided for @vaLabel.
  ///
  /// In en, this message translates to:
  /// **'Voice Actors'**
  String get vaLabel;

  /// No description provided for @circleLabel.
  ///
  /// In en, this message translates to:
  /// **'Circle'**
  String get circleLabel;

  /// No description provided for @releaseDate.
  ///
  /// In en, this message translates to:
  /// **'Release Date'**
  String get releaseDate;

  /// No description provided for @ratingLabel.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get ratingLabel;

  /// No description provided for @salesLabel.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get salesLabel;

  /// No description provided for @priceLabel.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get priceLabel;

  /// No description provided for @durationLabel.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get durationLabel;

  /// No description provided for @ageRatingLabel.
  ///
  /// In en, this message translates to:
  /// **'Age Rating'**
  String get ageRatingLabel;

  /// No description provided for @hasSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Has Subtitle'**
  String get hasSubtitle;

  /// No description provided for @noSubtitle.
  ///
  /// In en, this message translates to:
  /// **'No Subtitle'**
  String get noSubtitle;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @fileList.
  ///
  /// In en, this message translates to:
  /// **'File List'**
  String get fileList;

  /// No description provided for @series.
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get series;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Switch display language'**
  String get settingsLanguageSubtitle;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'Follow System'**
  String get languageSystem;

  /// No description provided for @languageZh.
  ///
  /// In en, this message translates to:
  /// **'简体中文'**
  String get languageZh;

  /// No description provided for @languageZhTw.
  ///
  /// In en, this message translates to:
  /// **'繁體中文'**
  String get languageZhTw;

  /// No description provided for @languageEn.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEn;

  /// No description provided for @languageJa.
  ///
  /// In en, this message translates to:
  /// **'日本語'**
  String get languageJa;

  /// No description provided for @languageRu.
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get languageRu;

  /// No description provided for @themeModeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get themeModeDark;

  /// No description provided for @themeModeLight.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get themeModeLight;

  /// No description provided for @themeModeSystem.
  ///
  /// In en, this message translates to:
  /// **'Follow System'**
  String get themeModeSystem;

  /// No description provided for @colorSchemeOceanBlue.
  ///
  /// In en, this message translates to:
  /// **'Ocean Blue'**
  String get colorSchemeOceanBlue;

  /// No description provided for @colorSchemeForestGreen.
  ///
  /// In en, this message translates to:
  /// **'Forest Green'**
  String get colorSchemeForestGreen;

  /// No description provided for @colorSchemeSunsetOrange.
  ///
  /// In en, this message translates to:
  /// **'Sunset Orange'**
  String get colorSchemeSunsetOrange;

  /// No description provided for @colorSchemeLavenderPurple.
  ///
  /// In en, this message translates to:
  /// **'Lavender Purple'**
  String get colorSchemeLavenderPurple;

  /// No description provided for @colorSchemeSakuraPink.
  ///
  /// In en, this message translates to:
  /// **'Sakura Pink'**
  String get colorSchemeSakuraPink;

  /// No description provided for @colorSchemeDynamic.
  ///
  /// In en, this message translates to:
  /// **'Dynamic Color'**
  String get colorSchemeDynamic;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noData;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get unknownError;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network error'**
  String get networkError;

  /// No description provided for @timeout.
  ///
  /// In en, this message translates to:
  /// **'Request timeout'**
  String get timeout;

  /// No description provided for @playAll.
  ///
  /// In en, this message translates to:
  /// **'Play All'**
  String get playAll;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @downloadAll.
  ///
  /// In en, this message translates to:
  /// **'Download All'**
  String get downloadAll;

  /// No description provided for @downloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading'**
  String get downloading;

  /// No description provided for @downloadComplete.
  ///
  /// In en, this message translates to:
  /// **'Download complete'**
  String get downloadComplete;

  /// No description provided for @downloadFailed.
  ///
  /// In en, this message translates to:
  /// **'Download failed'**
  String get downloadFailed;

  /// No description provided for @startDownload.
  ///
  /// In en, this message translates to:
  /// **'Starting download'**
  String get startDownload;

  /// No description provided for @confirmDeleteDownload.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this download? The downloaded file will also be removed.'**
  String get confirmDeleteDownload;

  /// No description provided for @deletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Deleted successfully'**
  String get deletedSuccessfully;

  /// No description provided for @scanSubtitleLibrary.
  ///
  /// In en, this message translates to:
  /// **'Scan Subtitle Library'**
  String get scanSubtitleLibrary;

  /// No description provided for @scanning.
  ///
  /// In en, this message translates to:
  /// **'Scanning...'**
  String get scanning;

  /// No description provided for @scanComplete.
  ///
  /// In en, this message translates to:
  /// **'Scan complete'**
  String get scanComplete;

  /// No description provided for @noSubtitleFiles.
  ///
  /// In en, this message translates to:
  /// **'No subtitle files found'**
  String get noSubtitleFiles;

  /// No description provided for @subtitleFilesFound.
  ///
  /// In en, this message translates to:
  /// **'Found {count} subtitle files'**
  String subtitleFilesFound(int count);

  /// No description provided for @selectDirectory.
  ///
  /// In en, this message translates to:
  /// **'Select Directory'**
  String get selectDirectory;

  /// No description provided for @privacyModeSettings.
  ///
  /// In en, this message translates to:
  /// **'Privacy Mode Settings'**
  String get privacyModeSettings;

  /// No description provided for @blurCover.
  ///
  /// In en, this message translates to:
  /// **'Blur Cover'**
  String get blurCover;

  /// No description provided for @maskTitle.
  ///
  /// In en, this message translates to:
  /// **'Mask Title'**
  String get maskTitle;

  /// No description provided for @customTitle.
  ///
  /// In en, this message translates to:
  /// **'Custom Title'**
  String get customTitle;

  /// No description provided for @privacyModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Hide playback information in system notifications and media controls'**
  String get privacyModeDesc;

  /// No description provided for @audioFormatSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Audio Format Settings'**
  String get audioFormatSettingsTitle;

  /// No description provided for @preferredFormat.
  ///
  /// In en, this message translates to:
  /// **'Preferred Format'**
  String get preferredFormat;

  /// No description provided for @cacheSizeLimit.
  ///
  /// In en, this message translates to:
  /// **'Cache Size Limit'**
  String get cacheSizeLimit;

  /// No description provided for @llmApiUrl.
  ///
  /// In en, this message translates to:
  /// **'API URL'**
  String get llmApiUrl;

  /// No description provided for @llmApiKey.
  ///
  /// In en, this message translates to:
  /// **'API Key'**
  String get llmApiKey;

  /// No description provided for @llmModel.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get llmModel;

  /// No description provided for @llmPrompt.
  ///
  /// In en, this message translates to:
  /// **'System Prompt'**
  String get llmPrompt;

  /// No description provided for @llmConcurrency.
  ///
  /// In en, this message translates to:
  /// **'Concurrency'**
  String get llmConcurrency;

  /// No description provided for @llmTestTranslation.
  ///
  /// In en, this message translates to:
  /// **'Test Translation'**
  String get llmTestTranslation;

  /// No description provided for @llmTestSuccess.
  ///
  /// In en, this message translates to:
  /// **'Test successful'**
  String get llmTestSuccess;

  /// No description provided for @llmTestFailed.
  ///
  /// In en, this message translates to:
  /// **'Test failed'**
  String get llmTestFailed;

  /// No description provided for @subtitleTimingAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Subtitle Timing'**
  String get subtitleTimingAdjustment;

  /// No description provided for @playerLyricStyle.
  ///
  /// In en, this message translates to:
  /// **'Player Lyrics Style'**
  String get playerLyricStyle;

  /// No description provided for @floatingLyricStyle.
  ///
  /// In en, this message translates to:
  /// **'Floating Lyrics Style'**
  String get floatingLyricStyle;

  /// No description provided for @fontSize.
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get fontSize;

  /// No description provided for @fontColor.
  ///
  /// In en, this message translates to:
  /// **'Font Color'**
  String get fontColor;

  /// No description provided for @backgroundColor.
  ///
  /// In en, this message translates to:
  /// **'Background Color'**
  String get backgroundColor;

  /// No description provided for @transparency.
  ///
  /// In en, this message translates to:
  /// **'Transparency'**
  String get transparency;

  /// No description provided for @windowSize.
  ///
  /// In en, this message translates to:
  /// **'Window Size'**
  String get windowSize;

  /// No description provided for @playerButtonSettings.
  ///
  /// In en, this message translates to:
  /// **'Player Button Settings'**
  String get playerButtonSettings;

  /// No description provided for @showButton.
  ///
  /// In en, this message translates to:
  /// **'Show Button'**
  String get showButton;

  /// No description provided for @buttonOrder.
  ///
  /// In en, this message translates to:
  /// **'Button Order'**
  String get buttonOrder;

  /// No description provided for @workCardDisplaySettings.
  ///
  /// In en, this message translates to:
  /// **'Work Card Display'**
  String get workCardDisplaySettings;

  /// No description provided for @showTags.
  ///
  /// In en, this message translates to:
  /// **'Show Tags'**
  String get showTags;

  /// No description provided for @showVa.
  ///
  /// In en, this message translates to:
  /// **'Show Voice Actors'**
  String get showVa;

  /// No description provided for @showRating.
  ///
  /// In en, this message translates to:
  /// **'Show Rating'**
  String get showRating;

  /// No description provided for @showPrice.
  ///
  /// In en, this message translates to:
  /// **'Show Price'**
  String get showPrice;

  /// No description provided for @cardSize.
  ///
  /// In en, this message translates to:
  /// **'Card Size'**
  String get cardSize;

  /// No description provided for @compact.
  ///
  /// In en, this message translates to:
  /// **'Compact'**
  String get compact;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @full.
  ///
  /// In en, this message translates to:
  /// **'Full'**
  String get full;

  /// No description provided for @workDetailDisplaySettings.
  ///
  /// In en, this message translates to:
  /// **'Work Detail Display'**
  String get workDetailDisplaySettings;

  /// No description provided for @infoSectionVisibility.
  ///
  /// In en, this message translates to:
  /// **'Info Section Visibility'**
  String get infoSectionVisibility;

  /// No description provided for @imageSize.
  ///
  /// In en, this message translates to:
  /// **'Image Size'**
  String get imageSize;

  /// No description provided for @showMetadata.
  ///
  /// In en, this message translates to:
  /// **'Show Metadata'**
  String get showMetadata;

  /// No description provided for @myTabsDisplaySettings.
  ///
  /// In en, this message translates to:
  /// **'My Page Tab Settings'**
  String get myTabsDisplaySettings;

  /// No description provided for @showTab.
  ///
  /// In en, this message translates to:
  /// **'Show Tab'**
  String get showTab;

  /// No description provided for @tabOrder.
  ///
  /// In en, this message translates to:
  /// **'Tab Order'**
  String get tabOrder;

  /// No description provided for @blockedItems.
  ///
  /// In en, this message translates to:
  /// **'Blocked Items'**
  String get blockedItems;

  /// No description provided for @blockedTags.
  ///
  /// In en, this message translates to:
  /// **'Blocked Tags'**
  String get blockedTags;

  /// No description provided for @blockedVas.
  ///
  /// In en, this message translates to:
  /// **'Blocked Voice Actors'**
  String get blockedVas;

  /// No description provided for @blockedCircles.
  ///
  /// In en, this message translates to:
  /// **'Blocked Circles'**
  String get blockedCircles;

  /// No description provided for @unblock.
  ///
  /// In en, this message translates to:
  /// **'Unblock'**
  String get unblock;

  /// No description provided for @noBlockedItems.
  ///
  /// In en, this message translates to:
  /// **'No blocked items'**
  String get noBlockedItems;

  /// No description provided for @clearCache.
  ///
  /// In en, this message translates to:
  /// **'Clear Cache'**
  String get clearCache;

  /// No description provided for @clearCacheConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all cache?'**
  String get clearCacheConfirm;

  /// No description provided for @cacheCleared.
  ///
  /// In en, this message translates to:
  /// **'Cache cleared'**
  String get cacheCleared;

  /// No description provided for @imagePreview.
  ///
  /// In en, this message translates to:
  /// **'Image Preview'**
  String get imagePreview;

  /// No description provided for @saveImage.
  ///
  /// In en, this message translates to:
  /// **'Save Image'**
  String get saveImage;

  /// No description provided for @imageSaved.
  ///
  /// In en, this message translates to:
  /// **'Image saved'**
  String get imageSaved;

  /// No description provided for @saveImageFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save image'**
  String get saveImageFailed;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirm;

  /// No description provided for @openInBrowser.
  ///
  /// In en, this message translates to:
  /// **'Open in Browser'**
  String get openInBrowser;

  /// No description provided for @copyLink.
  ///
  /// In en, this message translates to:
  /// **'Copy Link'**
  String get copyLink;

  /// No description provided for @linkCopied.
  ///
  /// In en, this message translates to:
  /// **'Link copied'**
  String get linkCopied;

  /// No description provided for @ratingDistribution.
  ///
  /// In en, this message translates to:
  /// **'Rating Distribution'**
  String get ratingDistribution;

  /// No description provided for @reviewsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} reviews'**
  String reviewsCount(int count);

  /// No description provided for @ratingsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} ratings'**
  String ratingsCount(int count);

  /// No description provided for @myReviews.
  ///
  /// In en, this message translates to:
  /// **'My Reviews'**
  String get myReviews;

  /// No description provided for @noReviews.
  ///
  /// In en, this message translates to:
  /// **'No reviews'**
  String get noReviews;

  /// No description provided for @writeReview.
  ///
  /// In en, this message translates to:
  /// **'Write Review'**
  String get writeReview;

  /// No description provided for @editReview.
  ///
  /// In en, this message translates to:
  /// **'Edit Review'**
  String get editReview;

  /// No description provided for @deleteReview.
  ///
  /// In en, this message translates to:
  /// **'Delete Review'**
  String get deleteReview;

  /// No description provided for @deleteReviewConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this review?'**
  String get deleteReviewConfirm;

  /// No description provided for @reviewDeleted.
  ///
  /// In en, this message translates to:
  /// **'Review deleted'**
  String get reviewDeleted;

  /// No description provided for @reviewContent.
  ///
  /// In en, this message translates to:
  /// **'Review content'**
  String get reviewContent;

  /// No description provided for @enterReviewContent.
  ///
  /// In en, this message translates to:
  /// **'Enter review content...'**
  String get enterReviewContent;

  /// No description provided for @submitReview.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submitReview;

  /// No description provided for @reviewSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Review submitted'**
  String get reviewSubmitted;

  /// No description provided for @reviewFailed.
  ///
  /// In en, this message translates to:
  /// **'Review failed: {error}'**
  String reviewFailed(String error);

  /// No description provided for @notificationPermission.
  ///
  /// In en, this message translates to:
  /// **'Notification Permission'**
  String get notificationPermission;

  /// No description provided for @mediaPermission.
  ///
  /// In en, this message translates to:
  /// **'Media Library Permission'**
  String get mediaPermission;

  /// No description provided for @storagePermission.
  ///
  /// In en, this message translates to:
  /// **'Storage Permission'**
  String get storagePermission;

  /// No description provided for @granted.
  ///
  /// In en, this message translates to:
  /// **'Granted'**
  String get granted;

  /// No description provided for @denied.
  ///
  /// In en, this message translates to:
  /// **'Denied'**
  String get denied;

  /// No description provided for @requestPermission.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get requestPermission;

  /// No description provided for @localDownloads.
  ///
  /// In en, this message translates to:
  /// **'Local Downloads'**
  String get localDownloads;

  /// No description provided for @offlinePlayback.
  ///
  /// In en, this message translates to:
  /// **'Offline Playback'**
  String get offlinePlayback;

  /// No description provided for @noDownloadedWorks.
  ///
  /// In en, this message translates to:
  /// **'No downloaded works'**
  String get noDownloadedWorks;

  /// No description provided for @updateAvailable.
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get updateAvailable;

  /// No description provided for @ignoreThisVersion.
  ///
  /// In en, this message translates to:
  /// **'Ignore this version'**
  String get ignoreThisVersion;

  /// No description provided for @remindLater.
  ///
  /// In en, this message translates to:
  /// **'Remind Later'**
  String get remindLater;

  /// No description provided for @updateNow.
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get updateNow;

  /// No description provided for @fetchFailed.
  ///
  /// In en, this message translates to:
  /// **'Fetch failed'**
  String get fetchFailed;

  /// No description provided for @operationFailedWithError.
  ///
  /// In en, this message translates to:
  /// **'Operation failed: {error}'**
  String operationFailedWithError(String error);

  /// No description provided for @aboutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Check updates, licenses, etc.'**
  String get aboutSubtitle;

  /// No description provided for @currentCacheSize.
  ///
  /// In en, this message translates to:
  /// **'Current Cache Size'**
  String get currentCacheSize;

  /// No description provided for @cacheLimitLabelMB.
  ///
  /// In en, this message translates to:
  /// **'Limit: {size}MB'**
  String cacheLimitLabelMB(int size);

  /// No description provided for @cacheUsagePercent.
  ///
  /// In en, this message translates to:
  /// **'Usage'**
  String get cacheUsagePercent;

  /// No description provided for @autoCleanTitle.
  ///
  /// In en, this message translates to:
  /// **'Auto Clean Info'**
  String get autoCleanTitle;

  /// No description provided for @autoCleanDescription.
  ///
  /// In en, this message translates to:
  /// **'• Cache is auto-cleaned when exceeding the limit\n• Deletes until cache drops to 80% of limit\n• Uses Least Recently Used (LRU) strategy'**
  String get autoCleanDescription;

  /// No description provided for @autoCleanDescriptionShort.
  ///
  /// In en, this message translates to:
  /// **'• Cache is auto-cleaned when exceeding the limit\n• Deletes until cache drops to 80% of limit'**
  String get autoCleanDescriptionShort;

  /// No description provided for @confirmClear.
  ///
  /// In en, this message translates to:
  /// **'Confirm Clear'**
  String get confirmClear;

  /// No description provided for @confirmClearCacheMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all cache? This action cannot be undone.'**
  String get confirmClearCacheMessage;

  /// No description provided for @clearCacheFailedWithError.
  ///
  /// In en, this message translates to:
  /// **'Clear cache failed: {error}'**
  String clearCacheFailedWithError(String error);

  /// No description provided for @hasNewVersion.
  ///
  /// In en, this message translates to:
  /// **'New version'**
  String get hasNewVersion;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeMode;

  /// No description provided for @colorTheme.
  ///
  /// In en, this message translates to:
  /// **'Color Theme'**
  String get colorTheme;

  /// No description provided for @themePreview.
  ///
  /// In en, this message translates to:
  /// **'Theme Preview'**
  String get themePreview;

  /// No description provided for @themeModeSystemDesc.
  ///
  /// In en, this message translates to:
  /// **'Automatically adapt to system dark/light mode'**
  String get themeModeSystemDesc;

  /// No description provided for @themeModeLightDesc.
  ///
  /// In en, this message translates to:
  /// **'Always use light theme'**
  String get themeModeLightDesc;

  /// No description provided for @themeModeDarkDesc.
  ///
  /// In en, this message translates to:
  /// **'Always use dark theme'**
  String get themeModeDarkDesc;

  /// No description provided for @colorSchemeOceanBlueDesc.
  ///
  /// In en, this message translates to:
  /// **'Blue, blue, blue!'**
  String get colorSchemeOceanBlueDesc;

  /// No description provided for @colorSchemeSakuraPinkDesc.
  ///
  /// In en, this message translates to:
  /// **'( ゜- ゜)つロ Cheers~'**
  String get colorSchemeSakuraPinkDesc;

  /// No description provided for @colorSchemeSunsetOrangeDesc.
  ///
  /// In en, this message translates to:
  /// **'Themes are a must ✍🏻✍🏻✍🏻'**
  String get colorSchemeSunsetOrangeDesc;

  /// No description provided for @colorSchemeLavenderPurpleDesc.
  ///
  /// In en, this message translates to:
  /// **'Bro, bro...'**
  String get colorSchemeLavenderPurpleDesc;

  /// No description provided for @colorSchemeForestGreenDesc.
  ///
  /// In en, this message translates to:
  /// **'Green, green, green'**
  String get colorSchemeForestGreenDesc;

  /// No description provided for @colorSchemeDynamicDesc.
  ///
  /// In en, this message translates to:
  /// **'Use wallpaper colors from system (Android 12+)'**
  String get colorSchemeDynamicDesc;

  /// No description provided for @primaryContainer.
  ///
  /// In en, this message translates to:
  /// **'Primary Container'**
  String get primaryContainer;

  /// No description provided for @secondaryContainer.
  ///
  /// In en, this message translates to:
  /// **'Secondary Container'**
  String get secondaryContainer;

  /// No description provided for @tertiaryContainer.
  ///
  /// In en, this message translates to:
  /// **'Tertiary Container'**
  String get tertiaryContainer;

  /// No description provided for @surfaceColor.
  ///
  /// In en, this message translates to:
  /// **'Surface'**
  String get surfaceColor;

  /// No description provided for @playerButtonSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize player control button order'**
  String get playerButtonSettingsSubtitle;

  /// No description provided for @playerLyricStyleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize subtitle style for mini and fullscreen player'**
  String get playerLyricStyleSubtitle;

  /// No description provided for @workDetailDisplaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Control info items on work detail page'**
  String get workDetailDisplaySubtitle;

  /// No description provided for @workCardDisplaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Control info items on work cards'**
  String get workCardDisplaySubtitle;

  /// No description provided for @myTabsDisplaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Control tab display in My page'**
  String get myTabsDisplaySubtitle;

  /// No description provided for @pageSizeSettings.
  ///
  /// In en, this message translates to:
  /// **'Items Per Page'**
  String get pageSizeSettings;

  /// No description provided for @pageSizeCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current: {size} items/page'**
  String pageSizeCurrent(int size);

  /// No description provided for @currentSettingLabel.
  ///
  /// In en, this message translates to:
  /// **'Current: {value}'**
  String currentSettingLabel(String value);

  /// No description provided for @setToValue.
  ///
  /// In en, this message translates to:
  /// **'Set to: {value}'**
  String setToValue(String value);

  /// No description provided for @llmConfigRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'LLM translation requires an API Key. Please configure it in settings first.'**
  String get llmConfigRequiredMessage;

  /// No description provided for @autoSwitchedToLlm.
  ///
  /// In en, this message translates to:
  /// **'Auto-switched to: LLM Translation'**
  String get autoSwitchedToLlm;

  /// No description provided for @translationDescGoogle.
  ///
  /// In en, this message translates to:
  /// **'Requires network access to Google services'**
  String get translationDescGoogle;

  /// No description provided for @translationDescYoudao.
  ///
  /// In en, this message translates to:
  /// **'Works with default network'**
  String get translationDescYoudao;

  /// No description provided for @translationDescMicrosoft.
  ///
  /// In en, this message translates to:
  /// **'Works with default network'**
  String get translationDescMicrosoft;

  /// No description provided for @translationDescLlm.
  ///
  /// In en, this message translates to:
  /// **'OpenAI-compatible API, requires manual API Key configuration'**
  String get translationDescLlm;

  /// No description provided for @audioPassthroughDescAndroid.
  ///
  /// In en, this message translates to:
  /// **'Allow raw bitstream output (AC3/DTS) to external decoder. May take exclusive audio control.'**
  String get audioPassthroughDescAndroid;

  /// No description provided for @permissionExplanation.
  ///
  /// In en, this message translates to:
  /// **'Permission Explanation'**
  String get permissionExplanation;

  /// No description provided for @backgroundRunningPermission.
  ///
  /// In en, this message translates to:
  /// **'Background Running Permission'**
  String get backgroundRunningPermission;

  /// No description provided for @notificationPermissionDesc.
  ///
  /// In en, this message translates to:
  /// **'Used for showing media playback notification, allowing control from lock screen and notification bar.'**
  String get notificationPermissionDesc;

  /// No description provided for @backgroundRunningPermissionDesc.
  ///
  /// In en, this message translates to:
  /// **'Exempts app from battery optimization to ensure audio continues playing in background.'**
  String get backgroundRunningPermissionDesc;

  /// No description provided for @notificationGrantedStatus.
  ///
  /// In en, this message translates to:
  /// **'Granted - Can show playback notification and controls'**
  String get notificationGrantedStatus;

  /// No description provided for @notificationDeniedStatus.
  ///
  /// In en, this message translates to:
  /// **'Not granted - Tap to request permission'**
  String get notificationDeniedStatus;

  /// No description provided for @backgroundGrantedStatus.
  ///
  /// In en, this message translates to:
  /// **'Granted - App can run continuously in background'**
  String get backgroundGrantedStatus;

  /// No description provided for @backgroundDeniedStatus.
  ///
  /// In en, this message translates to:
  /// **'Not granted - Tap to request permission'**
  String get backgroundDeniedStatus;

  /// No description provided for @notificationPermissionGranted.
  ///
  /// In en, this message translates to:
  /// **'Notification permission granted'**
  String get notificationPermissionGranted;

  /// No description provided for @notificationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Notification permission denied'**
  String get notificationPermissionDenied;

  /// No description provided for @requestNotificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to request notification permission: {error}'**
  String requestNotificationFailed(String error);

  /// No description provided for @backgroundPermissionGranted.
  ///
  /// In en, this message translates to:
  /// **'Background running permission granted'**
  String get backgroundPermissionGranted;

  /// No description provided for @backgroundPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Background running permission denied'**
  String get backgroundPermissionDenied;

  /// No description provided for @requestBackgroundFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to request background permission: {error}'**
  String requestBackgroundFailed(String error);

  /// No description provided for @permissionRequired.
  ///
  /// In en, this message translates to:
  /// **'{permission} Required'**
  String permissionRequired(String permission);

  /// No description provided for @permissionPermanentlyDenied.
  ///
  /// In en, this message translates to:
  /// **'{permission} has been permanently denied. Please enable it manually in system settings.'**
  String permissionPermanentlyDenied(String permission);

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @permissionsAndroidOnly.
  ///
  /// In en, this message translates to:
  /// **'Permission management is only available on Android'**
  String get permissionsAndroidOnly;

  /// No description provided for @permissionsNotNeeded.
  ///
  /// In en, this message translates to:
  /// **'Other platforms do not require manual permission management'**
  String get permissionsNotNeeded;

  /// No description provided for @refreshPermissionStatus.
  ///
  /// In en, this message translates to:
  /// **'Refresh permission status'**
  String get refreshPermissionStatus;

  /// No description provided for @deleteFileConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{fileName}\"?'**
  String deleteFileConfirm(String fileName);

  /// No description provided for @deleteSelectedFilesConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {count} selected files?'**
  String deleteSelectedFilesConfirm(int count);

  /// No description provided for @deleted.
  ///
  /// In en, this message translates to:
  /// **'Deleted'**
  String get deleted;

  /// No description provided for @cannotOpenFolder.
  ///
  /// In en, this message translates to:
  /// **'Cannot open folder: {path}'**
  String cannotOpenFolder(String path);

  /// No description provided for @openFolderFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to open folder: {error}'**
  String openFolderFailed(String error);

  /// No description provided for @reloadingFromDisk.
  ///
  /// In en, this message translates to:
  /// **'Reloading from disk...'**
  String get reloadingFromDisk;

  /// No description provided for @refreshComplete.
  ///
  /// In en, this message translates to:
  /// **'Refresh complete'**
  String get refreshComplete;

  /// No description provided for @refreshFailed.
  ///
  /// In en, this message translates to:
  /// **'Refresh failed: {error}'**
  String refreshFailed(String error);

  /// No description provided for @deleteSelectedWorksConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {count} selected works?'**
  String deleteSelectedWorksConfirm(int count);

  /// No description provided for @partialDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Partial deletion failed: {error}'**
  String partialDeleteFailed(String error);

  /// No description provided for @deletedNOfTotal.
  ///
  /// In en, this message translates to:
  /// **'Deleted {success}/{total} tasks'**
  String deletedNOfTotal(int success, int total);

  /// No description provided for @deleteFailedWithError.
  ///
  /// In en, this message translates to:
  /// **'Deletion failed: {error}'**
  String deleteFailedWithError(String error);

  /// No description provided for @noWorkMetadataForOffline.
  ///
  /// In en, this message translates to:
  /// **'This download has no saved work details and cannot be viewed offline'**
  String get noWorkMetadataForOffline;

  /// No description provided for @openWorkDetailFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to open work detail: {error}'**
  String openWorkDetailFailed(String error);

  /// No description provided for @noLocalDownloads.
  ///
  /// In en, this message translates to:
  /// **'No local downloads'**
  String get noLocalDownloads;

  /// No description provided for @exitSelection.
  ///
  /// In en, this message translates to:
  /// **'Exit selection'**
  String get exitSelection;

  /// No description provided for @reload.
  ///
  /// In en, this message translates to:
  /// **'Reload'**
  String get reload;

  /// No description provided for @openFolder.
  ///
  /// In en, this message translates to:
  /// **'Open Folder'**
  String get openFolder;

  /// No description provided for @playlistLink.
  ///
  /// In en, this message translates to:
  /// **'Playlist Link'**
  String get playlistLink;

  /// No description provided for @playlistLinkHint.
  ///
  /// In en, this message translates to:
  /// **'Paste playlist link, e.g.:\nhttps://www.asmr.one/playlist?id=...'**
  String get playlistLinkHint;

  /// No description provided for @unrecognizedPlaylistLink.
  ///
  /// In en, this message translates to:
  /// **'Unrecognized playlist link or ID'**
  String get unrecognizedPlaylistLink;

  /// No description provided for @addingPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Adding playlist...'**
  String get addingPlaylist;

  /// No description provided for @playlistAddedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Playlist added successfully'**
  String get playlistAddedSuccess;

  /// No description provided for @addFailed.
  ///
  /// In en, this message translates to:
  /// **'Add failed'**
  String get addFailed;

  /// No description provided for @playlistNotFound.
  ///
  /// In en, this message translates to:
  /// **'Playlist does not exist or has been deleted'**
  String get playlistNotFound;

  /// No description provided for @noPermissionToAccessPlaylist.
  ///
  /// In en, this message translates to:
  /// **'No permission to access this playlist'**
  String get noPermissionToAccessPlaylist;

  /// No description provided for @networkConnectionFailed.
  ///
  /// In en, this message translates to:
  /// **'Network connection failed, please check network'**
  String get networkConnectionFailed;

  /// No description provided for @addFailedWithError.
  ///
  /// In en, this message translates to:
  /// **'Add failed: {error}'**
  String addFailedWithError(String error);

  /// No description provided for @creatingPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Creating playlist...'**
  String get creatingPlaylist;

  /// No description provided for @playlistCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Playlist \"{name}\" created successfully'**
  String playlistCreatedSuccess(String name);

  /// No description provided for @createFailedWithError.
  ///
  /// In en, this message translates to:
  /// **'Creation failed: {error}'**
  String createFailedWithError(String error);

  /// No description provided for @noPlaylists.
  ///
  /// In en, this message translates to:
  /// **'No playlists'**
  String get noPlaylists;

  /// No description provided for @noPlaylistsDescription.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t created or favorited any playlists yet'**
  String get noPlaylistsDescription;

  /// No description provided for @myPlaylists.
  ///
  /// In en, this message translates to:
  /// **'My Playlists'**
  String get myPlaylists;

  /// No description provided for @totalNItems.
  ///
  /// In en, this message translates to:
  /// **'{count} total'**
  String totalNItems(int count);

  /// No description provided for @systemPlaylistCannotDelete.
  ///
  /// In en, this message translates to:
  /// **'System playlists cannot be deleted'**
  String get systemPlaylistCannotDelete;

  /// No description provided for @deletePlaylist.
  ///
  /// In en, this message translates to:
  /// **'Delete Playlist'**
  String get deletePlaylist;

  /// No description provided for @unfavoritePlaylist.
  ///
  /// In en, this message translates to:
  /// **'Unfavorite Playlist'**
  String get unfavoritePlaylist;

  /// No description provided for @deletePlaylistConfirm.
  ///
  /// In en, this message translates to:
  /// **'Deletion is irreversible. Users who favorited this playlist will lose access. Are you sure?'**
  String get deletePlaylistConfirm;

  /// No description provided for @unfavoritePlaylistConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to unfavorite \"{name}\"?'**
  String unfavoritePlaylistConfirm(String name);

  /// No description provided for @unfavorite.
  ///
  /// In en, this message translates to:
  /// **'Unfavorite'**
  String get unfavorite;

  /// No description provided for @deleting.
  ///
  /// In en, this message translates to:
  /// **'Deleting...'**
  String get deleting;

  /// No description provided for @deleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Deleted successfully'**
  String get deleteSuccess;

  /// No description provided for @onlyOwnerCanEdit.
  ///
  /// In en, this message translates to:
  /// **'Only the playlist owner can edit'**
  String get onlyOwnerCanEdit;

  /// No description provided for @editPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Edit Playlist'**
  String get editPlaylist;

  /// No description provided for @playlistNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Playlist name cannot be empty'**
  String get playlistNameRequired;

  /// No description provided for @privacyDescPrivate.
  ///
  /// In en, this message translates to:
  /// **'Only you can view'**
  String get privacyDescPrivate;

  /// No description provided for @privacyDescUnlisted.
  ///
  /// In en, this message translates to:
  /// **'Only people with the link can view'**
  String get privacyDescUnlisted;

  /// No description provided for @privacyDescPublic.
  ///
  /// In en, this message translates to:
  /// **'Anyone can view'**
  String get privacyDescPublic;

  /// No description provided for @addWorks.
  ///
  /// In en, this message translates to:
  /// **'Add Works'**
  String get addWorks;

  /// No description provided for @addWorksInputHint.
  ///
  /// In en, this message translates to:
  /// **'Enter text containing work IDs, RJ numbers will be auto-detected'**
  String get addWorksInputHint;

  /// No description provided for @workId.
  ///
  /// In en, this message translates to:
  /// **'Work ID'**
  String get workId;

  /// No description provided for @workIdHint.
  ///
  /// In en, this message translates to:
  /// **'e.g.: RJ123456\nrj233333'**
  String get workIdHint;

  /// No description provided for @detectedNWorkIds.
  ///
  /// In en, this message translates to:
  /// **'Detected {count} work IDs'**
  String detectedNWorkIds(int count);

  /// No description provided for @addNWorks.
  ///
  /// In en, this message translates to:
  /// **'Add {count}'**
  String addNWorks(int count);

  /// No description provided for @noValidWorkIds.
  ///
  /// In en, this message translates to:
  /// **'No valid work IDs found (starting with RJ)'**
  String get noValidWorkIds;

  /// No description provided for @addingNWorks.
  ///
  /// In en, this message translates to:
  /// **'Adding {count} works...'**
  String addingNWorks(int count);

  /// No description provided for @addedNWorksSuccess.
  ///
  /// In en, this message translates to:
  /// **'Successfully added {count} works'**
  String addedNWorksSuccess(int count);

  /// No description provided for @removeWork.
  ///
  /// In en, this message translates to:
  /// **'Remove Work'**
  String get removeWork;

  /// No description provided for @removeWorkConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove \"{title}\" from the playlist?'**
  String removeWorkConfirm(String title);

  /// No description provided for @removeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Removed successfully'**
  String get removeSuccess;

  /// No description provided for @removeFailedWithError.
  ///
  /// In en, this message translates to:
  /// **'Remove failed: {error}'**
  String removeFailedWithError(String error);

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @saveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Saved successfully'**
  String get saveSuccess;

  /// No description provided for @saveFailedWithError.
  ///
  /// In en, this message translates to:
  /// **'Save failed: {error}'**
  String saveFailedWithError(String error);

  /// No description provided for @noWorks.
  ///
  /// In en, this message translates to:
  /// **'No works'**
  String get noWorks;

  /// No description provided for @playlistNoWorksDescription.
  ///
  /// In en, this message translates to:
  /// **'No works have been added to this playlist yet'**
  String get playlistNoWorksDescription;

  /// No description provided for @lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated'**
  String get lastUpdated;

  /// No description provided for @createdTime.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get createdTime;

  /// No description provided for @nWorksCount.
  ///
  /// In en, this message translates to:
  /// **'{count} works'**
  String nWorksCount(int count);

  /// No description provided for @nPlaysCount.
  ///
  /// In en, this message translates to:
  /// **'{count} plays'**
  String nPlaysCount(int count);

  /// No description provided for @removeFromPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Remove from playlist'**
  String get removeFromPlaylist;

  /// No description provided for @checkNetworkOrRetry.
  ///
  /// In en, this message translates to:
  /// **'Please check your network connection or try again later'**
  String get checkNetworkOrRetry;

  /// No description provided for @reachedEnd.
  ///
  /// In en, this message translates to:
  /// **'You\'ve reached the end~'**
  String get reachedEnd;

  /// No description provided for @excludedNWorks.
  ///
  /// In en, this message translates to:
  /// **'Excluded {count} works'**
  String excludedNWorks(int count);

  /// No description provided for @pageExcludedNWorks.
  ///
  /// In en, this message translates to:
  /// **'This page excluded {count} works'**
  String pageExcludedNWorks(int count);
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'ru', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return SZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SEn();
    case 'ja':
      return SJa();
    case 'ru':
      return SRu();
    case 'zh':
      return SZh();
  }

  throw FlutterError(
      'S.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
