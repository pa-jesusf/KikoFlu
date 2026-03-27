// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class SRu extends S {
  SRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'KikoFlu';

  @override
  String get navHome => 'Главная';

  @override
  String get navSearch => 'Поиск';

  @override
  String get navMy => 'Моё';

  @override
  String get navSettings => 'Настройки';

  @override
  String get offlineModeMessage =>
      'Автономный режим: нет подключения к сети, доступен только загруженный контент';

  @override
  String get retry => 'Повторить';

  @override
  String get searchTypeKeyword => 'Ключевое слово';

  @override
  String get searchTypeTag => 'Тег';

  @override
  String get searchTypeVa => 'Сэйю';

  @override
  String get searchTypeCircle => 'Кружок';

  @override
  String get searchTypeRjNumber => 'Номер RJ';

  @override
  String get searchHintKeyword => 'Введите название или ключевое слово...';

  @override
  String get searchHintTag => 'Введите название тега...';

  @override
  String get searchHintVa => 'Введите имя сэйю...';

  @override
  String get searchHintCircle => 'Введите название кружка...';

  @override
  String get searchHintRjNumber => 'Введите номер...';

  @override
  String get ageRatingAll => 'Все';

  @override
  String get ageRatingGeneral => 'Для всех';

  @override
  String get ageRatingR15 => 'R-15';

  @override
  String get ageRatingAdult => '18+';

  @override
  String get salesRangeAll => 'Все';

  @override
  String get sortRelease => 'Дата выхода';

  @override
  String get sortCreateDate => 'Дата каталога';

  @override
  String get sortRating => 'Рейтинг';

  @override
  String get sortReviewCount => 'Отзывы';

  @override
  String get sortRandom => 'Случайно';

  @override
  String get sortDlCount => 'Продажи';

  @override
  String get sortPrice => 'Цена';

  @override
  String get sortNsfw => 'Для всех';

  @override
  String get sortUpdatedAt => 'Дата отметки';

  @override
  String get sortAsc => 'По возрастанию';

  @override
  String get sortDesc => 'По убыванию';

  @override
  String get sortOptions => 'Параметры сортировки';

  @override
  String get sortField => 'Поле сортировки';

  @override
  String get sortDirection => 'Направление сортировки';

  @override
  String get displayModeAll => 'Все';

  @override
  String get displayModePopular => 'Популярное';

  @override
  String get displayModeRecommended => 'Рекомендуемое';

  @override
  String get subtitlePriorityHighest => 'Приоритет';

  @override
  String get subtitlePriorityLowest => 'Отложено';

  @override
  String get translationSourceGoogle => 'Google Переводчик';

  @override
  String get translationSourceYoudao => 'Youdao Переводчик';

  @override
  String get translationSourceMicrosoft => 'Microsoft Переводчик';

  @override
  String get translationSourceLlm => 'LLM Переводчик';

  @override
  String get progressMarked => 'Отмечено';

  @override
  String get progressListening => 'Слушаю';

  @override
  String get progressListened => 'Прослушано';

  @override
  String get progressReplay => 'Переслушать';

  @override
  String get progressPostponed => 'Отложено';

  @override
  String get loginTitle => 'Вход';

  @override
  String get register => 'Регистрация';

  @override
  String get addAccount => 'Добавить аккаунт';

  @override
  String get registerAccount => 'Зарегистрировать аккаунт';

  @override
  String get username => 'Имя пользователя';

  @override
  String get password => 'Пароль';

  @override
  String get serverAddress => 'Адрес сервера';

  @override
  String get login => 'Войти';

  @override
  String get loginSuccess => 'Вход выполнен';

  @override
  String get loginFailed => 'Ошибка входа';

  @override
  String get registerFailed => 'Ошибка регистрации';

  @override
  String get usernameMinLength =>
      'Имя пользователя должно содержать не менее 5 символов';

  @override
  String get passwordMinLength => 'Пароль должен содержать не менее 5 символов';

  @override
  String accountAdded(String username) {
    return 'Аккаунт «$username» добавлен';
  }

  @override
  String get testConnection => 'Проверить соединение';

  @override
  String get testing => 'Проверка...';

  @override
  String get enterServerAddressToTest =>
      'Введите адрес сервера для проверки соединения';

  @override
  String latencyMs(String ms) {
    return '$msмс';
  }

  @override
  String get connectionFailed => 'Ошибка соединения';

  @override
  String get guestModeTitle => 'Подтверждение гостевого режима';

  @override
  String get guestModeMessage =>
      'Гостевой режим имеет ограничения:\n\n• Нельзя отмечать и оценивать работы\n• Нельзя создавать плейлисты\n• Нельзя синхронизировать прогресс\n\nГостевой режим использует демо-аккаунт, который может работать нестабильно.';

  @override
  String get continueGuestMode => 'Продолжить в гостевом режиме';

  @override
  String get guestAccountAdded => 'Гостевой аккаунт добавлен';

  @override
  String get guestLoginFailed => 'Ошибка гостевого входа';

  @override
  String get guestMode => 'Гостевой режим';

  @override
  String get cancel => 'Отмена';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get close => 'Закрыть';

  @override
  String get delete => 'Удалить';

  @override
  String get save => 'Сохранить';

  @override
  String get edit => 'Редактировать';

  @override
  String get add => 'Добавить';

  @override
  String get create => 'Создать';

  @override
  String get ok => 'ОК';

  @override
  String get search => 'Поиск';

  @override
  String get filter => 'Фильтр';

  @override
  String get advancedFilter => 'Расширенный фильтр';

  @override
  String get enterSearchContent => 'Введите поисковый запрос';

  @override
  String get searchTag => 'Искать теги...';

  @override
  String get minRating => 'Мин. рейтинг';

  @override
  String minRatingStars(String stars) {
    return '$stars звёзд';
  }

  @override
  String get searchHistory => 'История поиска';

  @override
  String get clearSearchHistory => 'Очистить историю поиска';

  @override
  String get clearSearchHistoryConfirm =>
      'Вы уверены, что хотите очистить всю историю поиска?';

  @override
  String get clear => 'Очистить';

  @override
  String get searchHistoryCleared => 'История поиска очищена';

  @override
  String get noSearchHistory => 'Нет истории поиска';

  @override
  String get excludeMode => 'Исключить';

  @override
  String get includeMode => 'Включить';

  @override
  String get noResults => 'Нет результатов';

  @override
  String get loadFailed => 'Ошибка загрузки';

  @override
  String loadFailedWithError(String error) {
    return 'Ошибка загрузки: $error';
  }

  @override
  String get loading => 'Загрузка...';

  @override
  String get calculating => 'Вычисление...';

  @override
  String get getFailed => 'Не удалось получить';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get accountManagement => 'Управление аккаунтами';

  @override
  String get accountManagementSubtitle => 'Управление аккаунтами, переключение';

  @override
  String get privacyMode => 'Режим конфиденциальности';

  @override
  String get privacyModeEnabled =>
      'Включён — информация о воспроизведении скрыта';

  @override
  String get privacyModeDisabled => 'Выключен';

  @override
  String get permissionManagement => 'Управление разрешениями';

  @override
  String get permissionManagementSubtitle => 'Уведомления, фоновая работа';

  @override
  String get desktopFloatingLyric => 'Плавающие субтитры';

  @override
  String get floatingLyricEnabled =>
      'Включено — субтитры отображаются на рабочем столе';

  @override
  String get floatingLyricDisabled => 'Выключено';

  @override
  String get styleSettings => 'Настройки стиля';

  @override
  String get styleSettingsSubtitle => 'Шрифт, цвет, прозрачность и т.д.';

  @override
  String get downloadPath => 'Путь загрузки';

  @override
  String get downloadPathSubtitle =>
      'Настроить расположение загруженных файлов';

  @override
  String get cacheManagement => 'Управление кешем';

  @override
  String currentCache(String size) {
    return 'Текущий кеш: $size';
  }

  @override
  String get themeSettings => 'Настройки темы';

  @override
  String get themeSettingsSubtitle => 'Тёмный режим, цвет темы и т.д.';

  @override
  String get uiSettings => 'Настройки интерфейса';

  @override
  String get uiSettingsSubtitle => 'Плеер, страница деталей, карточки и т.д.';

  @override
  String get preferenceSettings => 'Предпочтения';

  @override
  String get preferenceSettingsSubtitle =>
      'Переводчик, блокировки, аудио и т.д.';

  @override
  String get aboutTitle => 'О приложении';

  @override
  String get unknownVersion => 'Неизвестно';

  @override
  String get licenseLoadFailed => 'Не удалось загрузить файл LICENSE';

  @override
  String get licenseEmpty => 'Файл LICENSE пуст';

  @override
  String get failedToLoadAbout => 'Не удалось загрузить информацию';

  @override
  String get newVersionFound => 'Найдена новая версия';

  @override
  String newVersionAvailable(String version, String current) {
    return '$version доступна (текущая: $current)';
  }

  @override
  String get versionInfo => 'Информация о версии';

  @override
  String currentVersion(String version) {
    return 'Текущая версия: $version';
  }

  @override
  String get checkUpdate => 'Проверить обновления';

  @override
  String get author => 'Автор';

  @override
  String get projectRepo => 'Репозиторий проекта';

  @override
  String get openSourceLicense => 'Лицензия открытого ПО';

  @override
  String get cannotOpenLink => 'Не удаётся открыть ссылку';

  @override
  String openLinkFailed(String error) {
    return 'Не удалось открыть ссылку: $error';
  }

  @override
  String foundNewVersion(String version) {
    return 'Найдена новая версия $version';
  }

  @override
  String get view => 'Просмотр';

  @override
  String get alreadyLatestVersion => 'Установлена последняя версия';

  @override
  String get checkUpdateFailed =>
      'Не удалось проверить обновления. Проверьте подключение к сети';

  @override
  String get onlineMarks => 'Онлайн-отметки';

  @override
  String get historyRecord => 'История';

  @override
  String get playlists => 'Плейлисты';

  @override
  String get downloaded => 'Загружено';

  @override
  String get downloadTasks => 'Задачи загрузки';

  @override
  String get subtitleLibrary => 'Библиотека субтитров';

  @override
  String get all => 'Все';

  @override
  String get marked => 'Отмечено';

  @override
  String get listening => 'Слушаю';

  @override
  String get listened => 'Прослушано';

  @override
  String get replayMark => 'Переслушать';

  @override
  String get postponed => 'Отложено';

  @override
  String get switchToSmallGrid => 'Мелкая сетка';

  @override
  String get switchToList => 'Список';

  @override
  String get switchToLargeGrid => 'Крупная сетка';

  @override
  String get sort => 'Сортировка';

  @override
  String get noPlayHistory => 'Нет истории прослушивания';

  @override
  String get clearHistory => 'Очистить историю';

  @override
  String get clearHistoryTitle => 'Очистить историю';

  @override
  String get clearHistoryConfirm =>
      'Вы уверены, что хотите очистить всю историю? Это действие необратимо.';

  @override
  String get popularNoSort => 'В режиме «Популярное» сортировка недоступна';

  @override
  String get recommendedNoSort =>
      'В режиме «Рекомендуемое» сортировка недоступна';

  @override
  String get showAllWorks => 'Показать все работы';

  @override
  String get showOnlySubtitled => 'Только с субтитрами';

  @override
  String selectedCount(int count) {
    return 'Выбрано: $count';
  }

  @override
  String get selectAll => 'Выбрать все';

  @override
  String get deselectAll => 'Снять выделение';

  @override
  String get select => 'Выбрать';

  @override
  String get noDownloadTasks => 'Нет задач загрузки';

  @override
  String nFiles(int count) {
    return '$count файлов';
  }

  @override
  String errorWithMessage(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get pause => 'Пауза';

  @override
  String get resume => 'Продолжить';

  @override
  String get deletionConfirmTitle => 'Подтвердить удаление';

  @override
  String deletionConfirmMessage(int count) {
    return 'Удалить $count выбранных задач загрузки? Загруженные файлы тоже будут удалены.';
  }

  @override
  String deletedNFiles(int count) {
    return 'Удалено файлов: $count';
  }

  @override
  String get downloadStatusPending => 'Ожидание';

  @override
  String get downloadStatusDownloading => 'Загрузка';

  @override
  String get downloadStatusCompleted => 'Завершено';

  @override
  String get downloadStatusFailed => 'Ошибка';

  @override
  String get downloadStatusPaused => 'Приостановлено';

  @override
  String translationFailed(String error) {
    return 'Ошибка перевода: $error';
  }

  @override
  String copiedToClipboard(String label, String text) {
    return 'Скопировано $label: $text';
  }

  @override
  String get loadingFileList => 'Загрузка списка файлов...';

  @override
  String loadFileListFailed(String error) {
    return 'Не удалось загрузить список файлов: $error';
  }

  @override
  String get playlistTitle => 'Плейлист';

  @override
  String get noAudioPlaying => 'Нет воспроизводимого аудио';

  @override
  String get playbackSpeed => 'Скорость воспроизведения';

  @override
  String get backward10s => 'Назад 10 сек';

  @override
  String get forward10s => 'Вперёд 10 сек';

  @override
  String get sleepTimer => 'Таймер сна';

  @override
  String get repeatMode => 'Режим повтора';

  @override
  String get repeatOff => 'Выкл';

  @override
  String get repeatOne => 'Один трек';

  @override
  String get repeatAll => 'Весь список';

  @override
  String get addMark => 'Добавить отметку';

  @override
  String get viewDetail => 'Подробнее';

  @override
  String get volume => 'Громкость';

  @override
  String get sleepTimerTitle => 'Таймер';

  @override
  String get aboutToStop => 'Скоро остановится';

  @override
  String get remainingTime => 'Оставшееся время';

  @override
  String get finishCurrentTrack => 'Остановить после текущего трека';

  @override
  String addMinutes(int min) {
    return '+$min мин';
  }

  @override
  String get cancelTimer => 'Отменить таймер';

  @override
  String get duration => 'Длительность';

  @override
  String get specifyTime => 'Указать время';

  @override
  String get selectTimerDuration => 'Выберите длительность таймера';

  @override
  String get selectStopTime => 'Выберите время остановки';

  @override
  String get markWork => 'Отметить работу';

  @override
  String get addToPlaylist => 'Добавить в плейлист';

  @override
  String get remove => 'Удалить';

  @override
  String get createPlaylist => 'Создать плейлист';

  @override
  String get addPlaylist => 'Добавить плейлист';

  @override
  String get playlistName => 'Название плейлиста';

  @override
  String get enterPlaylistName => 'Введите название';

  @override
  String get privacySetting => 'Конфиденциальность';

  @override
  String get playlistDescription => 'Описание (необязательно)';

  @override
  String get addDescription => 'Добавить описание';

  @override
  String get enterPlaylistNameWarning => 'Введите название плейлиста';

  @override
  String get enterPlaylistLink => 'Введите ссылку на плейлист';

  @override
  String get switchAccountTitle => 'Переключить аккаунт';

  @override
  String switchAccountConfirm(String username) {
    return 'Переключиться на аккаунт «$username»?';
  }

  @override
  String switchedToAccount(String username) {
    return 'Переключено на аккаунт: $username';
  }

  @override
  String get switchFailed =>
      'Не удалось переключиться. Проверьте данные аккаунта';

  @override
  String switchFailedWithError(String error) {
    return 'Ошибка переключения: $error';
  }

  @override
  String get noAccounts => 'Нет аккаунтов';

  @override
  String get tapToAddAccount =>
      'Нажмите кнопку внизу справа, чтобы добавить аккаунт';

  @override
  String get currentAccount => 'Текущий аккаунт';

  @override
  String get switchAction => 'Переключить';

  @override
  String get deleteAccount => 'Удалить аккаунт';

  @override
  String deleteAccountConfirm(String username) {
    return 'Удалить аккаунт «$username»? Это действие необратимо.';
  }

  @override
  String get accountDeleted => 'Аккаунт удалён';

  @override
  String deletionFailedWithError(String error) {
    return 'Ошибка удаления: $error';
  }

  @override
  String get subtitleLibraryPriority => 'Приоритет библиотеки субтитров';

  @override
  String get selectSubtitlePriority =>
      'Выберите приоритет библиотеки субтитров при автозагрузке:';

  @override
  String get subtitlePriorityHighestDesc =>
      'Сначала искать в библиотеке, потом онлайн/загрузки';

  @override
  String get subtitlePriorityLowestDesc =>
      'Сначала искать онлайн/загрузки, потом в библиотеке';

  @override
  String get defaultSortSettings => 'Сортировка по умолчанию';

  @override
  String get defaultSortUpdated => 'Сортировка по умолчанию обновлена';

  @override
  String get translationSourceSettings => 'Настройки переводчика';

  @override
  String get selectTranslationProvider => 'Выберите службу перевода:';

  @override
  String get needsConfiguration => 'Требуется настройка';

  @override
  String get llmTranslation => 'LLM перевод';

  @override
  String get goToConfigure => 'Настроить';

  @override
  String get subtitlePrioritySettingSubtitle =>
      'Приоритет библиотеки субтитров';

  @override
  String get defaultSortSettingTitle => 'Сортировка на главной по умолчанию';

  @override
  String get translationSource => 'Источник перевода';

  @override
  String get llmSettings => 'Настройки LLM';

  @override
  String get llmSettingsSubtitle => 'API URL, ключ и модель';

  @override
  String get audioFormatPreference => 'Аудиоформат';

  @override
  String get audioFormatSubtitle => 'Приоритет аудиоформатов';

  @override
  String get blockingSettings => 'Блокировки';

  @override
  String get blockingSettingsSubtitle => 'Заблокированные теги, сэйю и кружки';

  @override
  String get audioPassthrough => 'Аудио-проход (Beta)';

  @override
  String get audioPassthroughDescWindows =>
      'Включить эксклюзивный режим WASAPI для lossless (требуется перезапуск)';

  @override
  String get audioPassthroughDescMac =>
      'Включить эксклюзивный режим CoreAudio для lossless';

  @override
  String get audioPassthroughDisableDesc => 'Отключить режим аудио-прохода';

  @override
  String get warning => 'Предупреждение';

  @override
  String get audioPassthroughWarning =>
      'Эта функция не полностью протестирована и может вызвать неожиданный вывод звука. Включить?';

  @override
  String get exclusiveModeEnabled =>
      'Эксклюзивный режим включён (применится после перезапуска)';

  @override
  String get audioPassthroughEnabled => 'Режим аудио-прохода включён';

  @override
  String get audioPassthroughDisabled => 'Режим аудио-прохода отключён';

  @override
  String get tagVoteSupport => 'За';

  @override
  String get tagVoteOppose => 'Против';

  @override
  String get tagVoted => 'Проголосовано';

  @override
  String get votedSupport => 'Вы проголосовали «за»';

  @override
  String get votedOppose => 'Вы проголосовали «против»';

  @override
  String get voteCancelled => 'Голос отменён';

  @override
  String voteFailed(String error) {
    return 'Ошибка голосования: $error';
  }

  @override
  String get blockThisTag => 'Заблокировать этот тег';

  @override
  String get copyTag => 'Копировать тег';

  @override
  String get addTag => 'Добавить тег';

  @override
  String loadTagsFailed(String error) {
    return 'Ошибка загрузки тегов: $error';
  }

  @override
  String get selectAtLeastOneTag => 'Выберите хотя бы один тег';

  @override
  String get tagSubmitSuccess =>
      'Теги отправлены, ожидается обработка сервером';

  @override
  String get bindEmailFirst => 'Сначала привяжите email на www.asmr.one';

  @override
  String selectedNTags(int count) {
    return 'Выбрано тегов: $count:';
  }

  @override
  String get noMatchingTags => 'Совпадающие теги не найдены';

  @override
  String get loadFailedRetry => 'Ошибка загрузки. Нажмите для повтора';

  @override
  String get refresh => 'Обновить';

  @override
  String get playlistPrivacyPrivate => 'Приватный';

  @override
  String get playlistPrivacyUnlisted => 'По ссылке';

  @override
  String get playlistPrivacyPublic => 'Публичный';

  @override
  String get systemPlaylistMarked => 'Отмеченное';

  @override
  String get systemPlaylistLiked => 'Понравившееся';

  @override
  String totalNWorks(int count) {
    return '$count работ';
  }

  @override
  String pageNOfTotal(int page, int total) {
    return 'Стр. $page/$total';
  }

  @override
  String get translateTitle => 'Перевести';

  @override
  String get translateDescription => 'Перевести описание';

  @override
  String get translating => 'Перевод...';

  @override
  String translationFallbackNotice(String source) {
    return 'Перевод не удался, автоматически переключено на $source';
  }

  @override
  String get tagLabel => 'Теги';

  @override
  String get vaLabel => 'Сэйю';

  @override
  String get circleLabel => 'Кружок';

  @override
  String get releaseDate => 'Дата выхода';

  @override
  String get ratingLabel => 'Рейтинг';

  @override
  String get salesLabel => 'Продажи';

  @override
  String get priceLabel => 'Цена';

  @override
  String get durationLabel => 'Длительность';

  @override
  String get ageRatingLabel => 'Возрастной рейтинг';

  @override
  String get hasSubtitle => 'С субтитрами';

  @override
  String get noSubtitle => 'Без субтитров';

  @override
  String get description => 'Описание';

  @override
  String get fileList => 'Список файлов';

  @override
  String get series => 'Серия';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get settingsLanguageSubtitle => 'Переключить язык интерфейса';

  @override
  String get languageSystem => 'Системный';

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
  String get themeModeDark => 'Тёмный режим';

  @override
  String get themeModeLight => 'Светлый режим';

  @override
  String get themeModeSystem => 'Системный';

  @override
  String get colorSchemeOceanBlue => 'Океанский синий';

  @override
  String get colorSchemeForestGreen => 'Лесной зелёный';

  @override
  String get colorSchemeSunsetOrange => 'Закатный оранжевый';

  @override
  String get colorSchemeLavenderPurple => 'Лавандовый';

  @override
  String get colorSchemeSakuraPink => 'Сакура';

  @override
  String get colorSchemeDynamic => 'Динамический цвет';

  @override
  String get noData => 'Нет данных';

  @override
  String get unknownError => 'Неизвестная ошибка';

  @override
  String get networkError => 'Ошибка сети';

  @override
  String get timeout => 'Время ожидания истекло';

  @override
  String get playAll => 'Воспроизвести всё';

  @override
  String get download => 'Скачать';

  @override
  String get downloadAll => 'Скачать всё';

  @override
  String get downloading => 'Загрузка';

  @override
  String get downloadComplete => 'Загрузка завершена';

  @override
  String get downloadFailed => 'Ошибка загрузки';

  @override
  String get startDownload => 'Начать загрузку';

  @override
  String get confirmDeleteDownload =>
      'Удалить эту загрузку? Загруженные файлы тоже будут удалены.';

  @override
  String get deletedSuccessfully => 'Удалено';

  @override
  String get scanSubtitleLibrary => 'Сканировать библиотеку';

  @override
  String get scanning => 'Сканирование...';

  @override
  String get scanComplete => 'Сканирование завершено';

  @override
  String get noSubtitleFiles => 'Файлы субтитров не найдены';

  @override
  String subtitleFilesFound(int count) {
    return 'Найдено файлов субтитров: $count';
  }

  @override
  String get selectDirectory => 'Выбрать каталог';

  @override
  String get privacyModeSettings => 'Режим конфиденциальности';

  @override
  String get blurCover => 'Размыть обложку';

  @override
  String get maskTitle => 'Скрыть заголовок';

  @override
  String get customTitle => 'Пользовательский заголовок';

  @override
  String get privacyModeDesc =>
      'Скрыть информацию о воспроизведении в уведомлениях и медиа-управлении';

  @override
  String get audioFormatSettingsTitle => 'Настройки аудиоформата';

  @override
  String get preferredFormat => 'Предпочтительный формат';

  @override
  String get cacheSizeLimit => 'Лимит кеша';

  @override
  String get llmApiUrl => 'API URL';

  @override
  String get llmApiKey => 'API-ключ';

  @override
  String get llmModel => 'Модель';

  @override
  String get llmPrompt => 'Системный промпт';

  @override
  String get llmConcurrency => 'Параллелизм';

  @override
  String get llmTestTranslation => 'Тест перевода';

  @override
  String get llmTestSuccess => 'Тест успешен';

  @override
  String get llmTestFailed => 'Тест не пройден';

  @override
  String get subtitleTimingAdjustment => 'Тайминг субтитров';

  @override
  String get playerLyricStyle => 'Стиль текста в плеере';

  @override
  String get floatingLyricStyle => 'Стиль плавающего текста';

  @override
  String get fontSize => 'Размер шрифта';

  @override
  String get fontColor => 'Цвет шрифта';

  @override
  String get backgroundColor => 'Цвет фона';

  @override
  String get transparency => 'Прозрачность';

  @override
  String get windowSize => 'Размер окна';

  @override
  String get playerButtonSettings => 'Кнопки плеера';

  @override
  String get showButton => 'Показать кнопку';

  @override
  String get buttonOrder => 'Порядок кнопок';

  @override
  String get workCardDisplaySettings => 'Карточка работы';

  @override
  String get showTags => 'Показывать теги';

  @override
  String get showVa => 'Показывать сэйю';

  @override
  String get showRating => 'Показывать рейтинг';

  @override
  String get showPrice => 'Показывать цену';

  @override
  String get cardSize => 'Размер карточки';

  @override
  String get compact => 'Компактный';

  @override
  String get medium => 'Средний';

  @override
  String get full => 'Полный';

  @override
  String get workDetailDisplaySettings => 'Детали работы';

  @override
  String get infoSectionVisibility => 'Видимость разделов';

  @override
  String get imageSize => 'Размер изображения';

  @override
  String get showMetadata => 'Показывать метаданные';

  @override
  String get myTabsDisplaySettings => 'Вкладки «Моё»';

  @override
  String get showTab => 'Показать вкладку';

  @override
  String get tabOrder => 'Порядок вкладок';

  @override
  String get blockedItems => 'Заблокировано';

  @override
  String get blockedTags => 'Заблокированные теги';

  @override
  String get blockedVas => 'Заблокированные сэйю';

  @override
  String get blockedCircles => 'Заблокированные кружки';

  @override
  String get unblock => 'Разблокировать';

  @override
  String get noBlockedItems => 'Нет заблокированных элементов';

  @override
  String get clearCache => 'Очистить кеш';

  @override
  String get clearCacheConfirm => 'Очистить весь кеш?';

  @override
  String get cacheCleared => 'Кеш очищен';

  @override
  String get imagePreview => 'Просмотр изображения';

  @override
  String get saveImage => 'Сохранить изображение';

  @override
  String get imageSaved => 'Изображение сохранено';

  @override
  String get saveImageFailed => 'Не удалось сохранить изображение';

  @override
  String get logout => 'Выход';

  @override
  String get logoutConfirm => 'Выйти из аккаунта?';

  @override
  String get openInBrowser => 'Открыть в браузере';

  @override
  String get copyLink => 'Копировать ссылку';

  @override
  String get linkCopied => 'Ссылка скопирована';

  @override
  String get ratingDistribution => 'Распределение оценок';

  @override
  String reviewsCount(int count) {
    return 'Отзывов: $count';
  }

  @override
  String ratingsCount(int count) {
    return 'Оценок: $count';
  }

  @override
  String get myReviews => 'Мои отзывы';

  @override
  String get noReviews => 'Нет отзывов';

  @override
  String get writeReview => 'Написать отзыв';

  @override
  String get editReview => 'Редактировать отзыв';

  @override
  String get deleteReview => 'Удалить отзыв';

  @override
  String get deleteReviewConfirm => 'Удалить этот отзыв?';

  @override
  String get reviewDeleted => 'Отзыв удалён';

  @override
  String get reviewContent => 'Текст отзыва';

  @override
  String get enterReviewContent => 'Введите текст отзыва...';

  @override
  String get submitReview => 'Отправить';

  @override
  String get reviewSubmitted => 'Отзыв отправлен';

  @override
  String reviewFailed(String error) {
    return 'Ошибка отзыва: $error';
  }

  @override
  String get notificationPermission => 'Разрешение уведомлений';

  @override
  String get mediaPermission => 'Медиатека';

  @override
  String get storagePermission => 'Хранилище';

  @override
  String get granted => 'Разрешено';

  @override
  String get denied => 'Отказано';

  @override
  String get requestPermission => 'Запросить';

  @override
  String get localDownloads => 'Локальные загрузки';

  @override
  String get offlinePlayback => 'Автономное воспроизведение';

  @override
  String get noDownloadedWorks => 'Нет загруженных работ';

  @override
  String get updateAvailable => 'Доступно обновление';

  @override
  String get ignoreThisVersion => 'Пропустить эту версию';

  @override
  String get remindLater => 'Напомнить позже';

  @override
  String get updateNow => 'Обновить сейчас';

  @override
  String get fetchFailed => 'Не удалось получить';

  @override
  String operationFailedWithError(String error) {
    return 'Ошибка операции: $error';
  }

  @override
  String get aboutSubtitle => 'Проверка обновлений, лицензии и др.';

  @override
  String get currentCacheSize => 'Текущий размер кэша';

  @override
  String cacheLimitLabelMB(int size) {
    return 'Лимит: $sizeМБ';
  }

  @override
  String get cacheUsagePercent => 'Использование';

  @override
  String get autoCleanTitle => 'Автоочистка';

  @override
  String get autoCleanDescription =>
      '• Кэш автоматически очищается при превышении лимита\n• Удаление до 80% от лимита\n• Используется стратегия LRU (наименее используемые)';

  @override
  String get autoCleanDescriptionShort =>
      '• Кэш автоматически очищается при превышении лимита\n• Удаление до 80% от лимита';

  @override
  String get confirmClear => 'Подтвердить очистку';

  @override
  String get confirmClearCacheMessage =>
      'Вы уверены, что хотите очистить весь кэш? Это действие нельзя отменить.';

  @override
  String clearCacheFailedWithError(String error) {
    return 'Ошибка очистки кэша: $error';
  }

  @override
  String get hasNewVersion => 'Новая версия';

  @override
  String get themeMode => 'Режим темы';

  @override
  String get colorTheme => 'Цветовая тема';

  @override
  String get themePreview => 'Предпросмотр темы';

  @override
  String get themeModeSystemDesc => 'Автоматическая адаптация к системной теме';

  @override
  String get themeModeLightDesc => 'Всегда использовать светлую тему';

  @override
  String get themeModeDarkDesc => 'Всегда использовать тёмную тему';

  @override
  String get colorSchemeOceanBlueDesc => 'Синий, синий, синий!';

  @override
  String get colorSchemeSakuraPinkDesc => '( ゜- ゜)つロ Ура~';

  @override
  String get colorSchemeSunsetOrangeDesc => 'Смена тем — обязательно ✍🏻✍🏻✍🏻';

  @override
  String get colorSchemeLavenderPurpleDesc => 'Братан, братан...';

  @override
  String get colorSchemeForestGreenDesc => 'Зелень, зелень, зелень';

  @override
  String get colorSchemeDynamicDesc =>
      'Использовать цвета обоев системы (Android 12+)';

  @override
  String get primaryContainer => 'Основной контейнер';

  @override
  String get secondaryContainer => 'Вторичный контейнер';

  @override
  String get tertiaryContainer => 'Третичный контейнер';

  @override
  String get surfaceColor => 'Поверхность';

  @override
  String get playerButtonSettingsSubtitle =>
      'Настроить порядок кнопок управления плеером';

  @override
  String get playerLyricStyleSubtitle =>
      'Настроить стиль субтитров мини- и полноэкранного плеера';

  @override
  String get workDetailDisplaySubtitle =>
      'Управление информацией на странице деталей';

  @override
  String get workCardDisplaySubtitle =>
      'Управление информацией на карточках работ';

  @override
  String get myTabsDisplaySubtitle =>
      'Управление отображением вкладок на странице «Моё»';

  @override
  String get pageSizeSettings => 'Элементов на странице';

  @override
  String pageSizeCurrent(int size) {
    return 'Текущее: $size элементов/стр.';
  }

  @override
  String currentSettingLabel(String value) {
    return 'Текущее: $value';
  }

  @override
  String setToValue(String value) {
    return 'Установлено: $value';
  }

  @override
  String get llmConfigRequiredMessage =>
      'Для перевода LLM требуется API Key. Сначала настройте его в параметрах.';

  @override
  String get autoSwitchedToLlm => 'Автопереключение: перевод LLM';

  @override
  String get translationDescGoogle => 'Требуется доступ к сервисам Google';

  @override
  String get translationDescYoudao => 'Работает с сетью по умолчанию';

  @override
  String get translationDescMicrosoft => 'Работает с сетью по умолчанию';

  @override
  String get translationDescLlm =>
      'OpenAI-совместимый API, требуется ручная настройка API Key';

  @override
  String get audioPassthroughDescAndroid =>
      'Разрешить вывод необработанного битового потока (AC3/DTS) на внешний декодер. Может занять эксклюзивный доступ к аудио.';

  @override
  String get permissionExplanation => 'Описание разрешений';

  @override
  String get backgroundRunningPermission => 'Разрешение на фоновую работу';

  @override
  String get notificationPermissionDesc =>
      'Для отображения уведомлений о воспроизведении, позволяющих управлять с экрана блокировки и панели уведомлений.';

  @override
  String get backgroundRunningPermissionDesc =>
      'Исключает приложение из оптимизации батареи для непрерывного воспроизведения в фоне.';

  @override
  String get notificationGrantedStatus =>
      'Разрешено — можно отображать уведомления и элементы управления';

  @override
  String get notificationDeniedStatus => 'Не разрешено — нажмите для запроса';

  @override
  String get backgroundGrantedStatus =>
      'Разрешено — приложение может работать в фоне';

  @override
  String get backgroundDeniedStatus => 'Не разрешено — нажмите для запроса';

  @override
  String get notificationPermissionGranted =>
      'Разрешение на уведомления получено';

  @override
  String get notificationPermissionDenied =>
      'Разрешение на уведомления отклонено';

  @override
  String requestNotificationFailed(String error) {
    return 'Ошибка запроса разрешения на уведомления: $error';
  }

  @override
  String get backgroundPermissionGranted =>
      'Разрешение на фоновую работу получено';

  @override
  String get backgroundPermissionDenied =>
      'Разрешение на фоновую работу отклонено';

  @override
  String requestBackgroundFailed(String error) {
    return 'Ошибка запроса разрешения на фоновую работу: $error';
  }

  @override
  String permissionRequired(String permission) {
    return 'Требуется $permission';
  }

  @override
  String permissionPermanentlyDenied(String permission) {
    return '$permission отклонено навсегда. Включите вручную в настройках системы.';
  }

  @override
  String get openSettings => 'Открыть настройки';

  @override
  String get permissionsAndroidOnly =>
      'Управление разрешениями доступно только на Android';

  @override
  String get permissionsNotNeeded =>
      'На других платформах ручное управление разрешениями не требуется';

  @override
  String get refreshPermissionStatus => 'Обновить статус разрешений';

  @override
  String deleteFileConfirm(String fileName) {
    return 'Удалить \"$fileName\"?';
  }

  @override
  String deleteSelectedFilesConfirm(int count) {
    return 'Удалить $count выбранных файлов?';
  }

  @override
  String get deleted => 'Удалено';

  @override
  String cannotOpenFolder(String path) {
    return 'Не удалось открыть папку: $path';
  }

  @override
  String openFolderFailed(String error) {
    return 'Ошибка открытия папки: $error';
  }

  @override
  String get reloadingFromDisk => 'Перезагрузка с диска...';

  @override
  String get refreshComplete => 'Обновление завершено';

  @override
  String refreshFailed(String error) {
    return 'Ошибка обновления: $error';
  }

  @override
  String deleteSelectedWorksConfirm(int count) {
    return 'Удалить $count выбранных работ?';
  }

  @override
  String partialDeleteFailed(String error) {
    return 'Частичная ошибка удаления: $error';
  }

  @override
  String deletedNOfTotal(int success, int total) {
    return 'Удалено $success/$total задач';
  }

  @override
  String deleteFailedWithError(String error) {
    return 'Ошибка удаления: $error';
  }

  @override
  String get noWorkMetadataForOffline =>
      'У этой загрузки нет сохранённых данных о работе для просмотра офлайн';

  @override
  String openWorkDetailFailed(String error) {
    return 'Ошибка открытия деталей работы: $error';
  }

  @override
  String get noLocalDownloads => 'Нет локальных загрузок';

  @override
  String get exitSelection => 'Выйти из выбора';

  @override
  String get reload => 'Перезагрузить';

  @override
  String get openFolder => 'Открыть папку';

  @override
  String get playlistLink => 'Ссылка на плейлист';

  @override
  String get playlistLinkHint =>
      'Вставьте ссылку на плейлист, например:\nhttps://www.asmr.one/playlist?id=...';

  @override
  String get unrecognizedPlaylistLink =>
      'Нераспознанная ссылка или ID плейлиста';

  @override
  String get addingPlaylist => 'Добавление плейлиста...';

  @override
  String get playlistAddedSuccess => 'Плейлист успешно добавлен';

  @override
  String get addFailed => 'Ошибка добавления';

  @override
  String get playlistNotFound => 'Плейлист не существует или был удалён';

  @override
  String get noPermissionToAccessPlaylist =>
      'Нет прав доступа к этому плейлисту';

  @override
  String get networkConnectionFailed =>
      'Ошибка сетевого подключения, проверьте сеть';

  @override
  String addFailedWithError(String error) {
    return 'Ошибка добавления: $error';
  }

  @override
  String get creatingPlaylist => 'Создание плейлиста...';

  @override
  String playlistCreatedSuccess(String name) {
    return 'Плейлист \"$name\" создан';
  }

  @override
  String createFailedWithError(String error) {
    return 'Ошибка создания: $error';
  }

  @override
  String get noPlaylists => 'Нет плейлистов';

  @override
  String get noPlaylistsDescription =>
      'Вы ещё не создали и не добавили в избранное ни одного плейлиста';

  @override
  String get myPlaylists => 'Мои плейлисты';

  @override
  String totalNItems(int count) {
    return 'Всего $count';
  }

  @override
  String get systemPlaylistCannotDelete => 'Системные плейлисты нельзя удалить';

  @override
  String get deletePlaylist => 'Удалить плейлист';

  @override
  String get unfavoritePlaylist => 'Убрать из избранного';

  @override
  String get deletePlaylistConfirm =>
      'Удаление необратимо. Пользователи, добавившие этот плейлист в избранное, потеряют к нему доступ. Продолжить?';

  @override
  String unfavoritePlaylistConfirm(String name) {
    return 'Убрать \"$name\" из избранного?';
  }

  @override
  String get unfavorite => 'Убрать из избранного';

  @override
  String get deleting => 'Удаление...';

  @override
  String get deleteSuccess => 'Успешно удалено';

  @override
  String get onlyOwnerCanEdit => 'Редактировать может только автор плейлиста';

  @override
  String get editPlaylist => 'Редактировать плейлист';

  @override
  String get playlistNameRequired => 'Название плейлиста не может быть пустым';

  @override
  String get privacyDescPrivate => 'Только вы можете просматривать';

  @override
  String get privacyDescUnlisted =>
      'Только люди со ссылкой могут просматривать';

  @override
  String get privacyDescPublic => 'Любой может просматривать';

  @override
  String get addWorks => 'Добавить работы';

  @override
  String get addWorksInputHint =>
      'Введите текст с номерами работ, RJ-номера определяются автоматически';

  @override
  String get workId => 'Номер работы';

  @override
  String get workIdHint => 'Например: RJ123456\nrj233333';

  @override
  String detectedNWorkIds(int count) {
    return 'Обнаружено $count номеров работ';
  }

  @override
  String addNWorks(int count) {
    return 'Добавить $count';
  }

  @override
  String get noValidWorkIds =>
      'Не найдено действительных номеров работ (начинающихся с RJ)';

  @override
  String addingNWorks(int count) {
    return 'Добавление $count работ...';
  }

  @override
  String addedNWorksSuccess(int count) {
    return 'Успешно добавлено $count работ';
  }

  @override
  String get removeWork => 'Удалить работу';

  @override
  String removeWorkConfirm(String title) {
    return 'Удалить «$title» из плейлиста?';
  }

  @override
  String get removeSuccess => 'Успешно удалено';

  @override
  String removeFailedWithError(String error) {
    return 'Ошибка удаления: $error';
  }

  @override
  String get saving => 'Сохранение...';

  @override
  String get saveSuccess => 'Сохранено';

  @override
  String saveFailedWithError(String error) {
    return 'Ошибка сохранения: $error';
  }

  @override
  String get noWorks => 'Нет работ';

  @override
  String get playlistNoWorksDescription =>
      'В этот плейлист ещё не добавлено ни одной работы';

  @override
  String get lastUpdated => 'Последнее обновление';

  @override
  String get createdTime => 'Дата создания';

  @override
  String nWorksCount(int count) {
    return '$count работ';
  }

  @override
  String nPlaysCount(int count) {
    return '$count воспроизведений';
  }

  @override
  String get removeFromPlaylist => 'Удалить из плейлиста';

  @override
  String get checkNetworkOrRetry =>
      'Проверьте сетевое подключение или повторите попытку позже';

  @override
  String get reachedEnd => 'Вы добрались до конца~';

  @override
  String excludedNWorks(int count) {
    return 'Исключено $count работ';
  }

  @override
  String pageExcludedNWorks(int count) {
    return 'На этой странице исключено $count работ';
  }
}
