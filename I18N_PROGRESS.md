# KikoFlu i18n 国际化进度跟踪

## 支持语言
- 🇨🇳 简体中文 (zh)
- 🇹🇼 繁體中文 (zh_Hant)
- 🇺🇸 English (en)
- 🇯🇵 日本語 (ja)
- 🇷🇺 Русский (ru)

## 基础设施 ✅
- [x] ARB 文件创建 (5 种语言)
- [x] l10n.yaml 配置
- [x] locale_provider.dart (语言切换 + 持久化)
- [x] MaterialApp 多语言配置
- [x] 语言设置 UI (settings_screen.dart)
- [x] flutter gen-l10n 验证通过

---

## 模块进度

### Module 1: 枚举扩展 ✅
- [x] `lib/src/utils/l10n_extensions.dart` — 所有枚举的 localizedLabel(context) 方法

### Module 2: 主屏幕 ✅
- [x] `lib/src/screens/main_screen.dart`

### Module 3: 搜索相关 ✅
- [x] `lib/src/screens/search_screen.dart`
- [x] `lib/src/screens/search_result_screen.dart`
- [x] `lib/src/widgets/sort_dialog.dart`

### Module 4: 设置相关 ✅
- [x] `lib/src/screens/settings_screen.dart`
- [x] `lib/src/screens/about_screen.dart`
- [x] `lib/src/screens/theme_settings_screen.dart`
- [x] `lib/src/screens/ui_settings_screen.dart`
- [x] `lib/src/screens/permissions_screen.dart`
- [x] `lib/src/screens/preferences_screen.dart`

### Module 5: 我的/播单/历史/下载 ✅
- [x] `lib/src/screens/my_screen.dart`
- [x] `lib/src/screens/history_screen.dart`
- [x] `lib/src/screens/downloads_screen.dart`
- [x] `lib/src/screens/local_downloads_screen.dart`
- [x] `lib/src/screens/playlists_screen.dart`
- [x] `lib/src/screens/playlist_detail_screen.dart`
- [x] `lib/src/screens/works_screen.dart`

### Module 6: 播放器相关 ❌
- [ ] `lib/src/screens/audio_player_screen.dart` (~42 UI 字符串)
- [ ] `lib/src/widgets/player/player_controls_widget.dart` (~43 UI 字符串)
- [ ] `lib/src/widgets/player/playlist_dialog.dart` (~28 UI 字符串)
- [ ] `lib/src/widgets/player/sleep_timer_dialog.dart` (~31 UI 字符串)
- [ ] `lib/src/widgets/player/sleep_timer_button.dart` (~5 UI 字符串)
- [ ] `lib/src/widgets/player/lyric_display_widget.dart` (~10 UI 字符串)
- [ ] `lib/src/widgets/player/player_cover_widget.dart` (~9 UI 字符串)
- [ ] `lib/src/widgets/mini_player.dart` (~36 UI 字符串)

### Module 7: 作品详情 ❌
- [ ] `lib/src/screens/work_detail_screen.dart` (~124 UI 字符串)
- [ ] `lib/src/screens/offline_work_detail_screen.dart` (~54 UI 字符串)

### Module 8: 文件浏览器 ❌
- [ ] `lib/src/widgets/file_explorer_widget.dart` (~312 UI 字符串)
- [ ] `lib/src/widgets/offline_file_explorer_widget.dart` (~211 UI 字符串)
- [ ] `lib/src/widgets/file_selection_dialog.dart` (~69 UI 字符串)

### Module 9: 登录与账户 ❌
- [ ] `lib/src/screens/login_screen.dart` (~75 UI 字符串)
- [ ] `lib/src/screens/account_management_screen.dart` (~42 UI 字符串)
- [ ] `lib/src/screens/user_switch_screen.dart` (~30 UI 字符串)

### Module 10: 其他屏幕 ❌
- [ ] `lib/src/screens/subtitle_library_screen.dart` (~232 UI 字符串)
- [ ] `lib/src/screens/floating_lyric_style_screen.dart` (~38 UI 字符串)
- [ ] `lib/src/screens/blocked_items_screen.dart` (~28 UI 字符串)
- [ ] `lib/src/screens/player_lyric_style_screen.dart` (~20 UI 字符串)

### Module 11: 通用组件 ❌
- [ ] `lib/src/widgets/enhanced_work_card.dart` (~40 UI 字符串)
- [ ] `lib/src/widgets/text_preview_screen.dart` (~53 UI 字符串)
- [ ] `lib/src/widgets/review_progress_dialog.dart` (~39 UI 字符串)
- [ ] `lib/src/widgets/image_gallery_screen.dart` (~48 UI 字符串)
- [ ] `lib/src/widgets/history_work_card.dart` (~75 UI 字符串)
- [ ] `lib/src/widgets/add_to_playlist_dialog.dart` (~33 UI 字符串)
- [ ] `lib/src/widgets/subtitle_adjustment_dialog.dart` (~40 UI 字符串)
- [ ] `lib/src/widgets/pdf_preview_screen.dart` (~32 UI 字符串)
- [ ] `lib/src/widgets/work_detail/add_tag_dialog.dart` (~40 UI 字符串)
- [ ] `lib/src/widgets/work_detail/tag_vote_dialog.dart` (~31 UI 字符串)
- [ ] `lib/src/widgets/cover_preview_dialog.dart` (~23 UI 字符串)
- [ ] `lib/src/widgets/pagination_bar.dart` (~20 UI 字符串)
- [ ] `lib/src/widgets/playlist_card.dart` (~15 UI 字符串)
- [ ] `lib/src/widgets/desktop_floating_lyric.dart` (~24 UI 字符串)
- [ ] `lib/src/widgets/work_bookmark_manager.dart` (~20 UI 字符串)
- [ ] `lib/src/widgets/works_grid_view.dart` (~8 UI 字符串)
- [ ] `lib/src/widgets/cached_image_widget.dart` (~10 UI 字符串)
- [ ] `lib/src/widgets/scrollable_appbar.dart` (~8 UI 字符串)
- [ ] `lib/src/widgets/circle_chip.dart` (~11 UI 字符串)
- [ ] `lib/src/widgets/rating_detail_popup.dart` (~12 UI 字符串)
- [ ] `lib/src/widgets/tag_chip.dart` (~9 UI 字符串)
- [ ] `lib/src/widgets/va_chip.dart` (~9 UI 字符串)
- [ ] `lib/src/widgets/download_fab.dart` (~6 UI 字符串)
- [ ] `lib/src/widgets/privacy_blur_cover.dart` (~4 UI 字符串)
- [ ] `lib/src/widgets/responsive_dialog.dart` (~5 UI 字符串)
- [ ] `lib/src/widgets/volume_control.dart` (~5 UI 字符串)
- [ ] `lib/src/widgets/global_audio_player_wrapper.dart` (~4 UI 字符串)
- [ ] `lib/src/widgets/overscroll_next_page_detector.dart` (~2 UI 字符串)

### Module 12: 工具类 ❌
- [ ] `lib/src/utils/snackbar_util.dart` (~30 UI 字符串)
- [ ] `lib/src/utils/file_icon_utils.dart` (~66 UI 字符串)
- [ ] `lib/src/utils/encoding_utils.dart` (~21 UI 字符串)
- [ ] `lib/src/utils/string_utils.dart` (~9 UI 字符串)
- [ ] `lib/src/utils/server_utils.dart` (~7 UI 字符串)
- [ ] `lib/src/utils/image_blur_util.dart` (~13 UI 字符串)

### Module 13: 数据模型 ❌
- [ ] `lib/src/models/work.dart` (~48 UI 字符串)
- [ ] `lib/src/models/playlist.dart` (~24 UI 字符串)
- [ ] `lib/src/models/download_task.dart` (~26 UI 字符串)
- [ ] `lib/src/models/user.dart` (~27 UI 字符串)
- [ ] `lib/src/models/search_type.dart` (~21 UI 字符串)
- [ ] `lib/src/models/history_record.dart` (~16 UI 字符串)
- [ ] `lib/src/models/account.dart` (~18 UI 字符串)
- [ ] `lib/src/models/lyric.dart` (~14 UI 字符串)
- [ ] `lib/src/models/sort_options.dart` (~9 UI 字符串)
- [ ] `lib/src/models/audio_track.dart` (~4 UI 字符串)

### Module 14: Provider ❌
- [ ] `lib/src/providers/auth_provider.dart` (~75 UI 字符串)
- [ ] `lib/src/providers/lyric_provider.dart` (~67 UI 字符串)
- [ ] `lib/src/providers/settings_provider.dart` (~44 UI 字符串)
- [ ] `lib/src/providers/floating_lyric_style_provider.dart` (~55 UI 字符串)
- [ ] `lib/src/providers/audio_provider.dart` (~16 UI 字符串)
- [ ] `lib/src/providers/works_provider.dart` (~23 UI 字符串)
- [ ] `lib/src/providers/search_result_provider.dart` (~19 UI 字符串)
- [ ] `lib/src/providers/playlist_detail_provider.dart` (~15 UI 字符串)
- [ ] `lib/src/providers/my_reviews_provider.dart` (~19 UI 字符串)
- [ ] `lib/src/providers/floating_lyric_provider.dart` (~25 UI 字符串)
- [ ] `lib/src/providers/player_buttons_provider.dart` (~16 UI 字符串)
- [ ] `lib/src/providers/search_history_provider.dart` (~14 UI 字符串)
- [ ] `lib/src/providers/work_detail_display_provider.dart` (~11 UI 字符串)
- [ ] `lib/src/providers/player_lyric_style_provider.dart` (~17 UI 字符串)
- [ ] `lib/src/providers/work_card_display_provider.dart` (~10 UI 字符串)
- [ ] `lib/src/providers/playlists_provider.dart` (~11 UI 字符串)
- [ ] `lib/src/providers/history_provider.dart` (~9 UI 字符串)
- [ ] `lib/src/providers/theme_provider.dart` (~5 UI 字符串)
- [ ] `lib/src/providers/my_tabs_display_provider.dart` (~5 UI 字符串)
- [ ] `lib/src/providers/locale_provider.dart` (~5 UI 字符串)
- [ ] `lib/src/providers/subtitle_library_provider.dart` (~4 UI 字符串)
- [ ] `lib/src/providers/update_provider.dart` (~2 UI 字符串)

### Module 15: 服务层 ❌ (低优先级 — 大量 debug 日志)
- [ ] `lib/src/services/kikoeru_api_service.dart` (~367 UI 字符串)
- [ ] `lib/src/services/subtitle_library_service.dart` (~268 UI 字符串)
- [ ] `lib/src/services/cache_service.dart` (~85 UI 字符串)
- [ ] `lib/src/services/download_service.dart` (~59 UI 字符串)
- [ ] `lib/src/services/translation_service.dart` (~48 UI 字符串)
- [ ] `lib/src/services/floating_lyric_service.dart` (~36 UI 字符串)
- [ ] `lib/src/services/download_path_service.dart` (~31 UI 字符串)
- [ ] `lib/src/services/audio_player_service.dart` (~29 UI 字符串)
- [ ] `lib/src/services/account_database.dart` (~29 UI 字符串)
- [ ] `lib/src/services/youdao_translator.dart` (~41 UI 字符串)
- [ ] `lib/src/services/microsoft_translator.dart` (~19 UI 字符串)
- [ ] `lib/src/services/llm_translator.dart` (~20 UI 字符串)
- [ ] `lib/src/services/update_service.dart` (~14 UI 字符串)
- [ ] `lib/src/services/history_database.dart` (~15 UI 字符串)
- [ ] `lib/src/services/caching_stream_audio_source.dart` (~10 UI 字符串)
- [ ] `lib/src/services/storage_service.dart` (~6 UI 字符串)

---

## ARB 文件状态
| 文件 | 状态 |
|------|------|
| `lib/l10n/app_en.arb` | ✅ 同步 (~615+ keys) |
| `lib/l10n/app_zh.arb` | ✅ 同步 |
| `lib/l10n/app_zh_Hant.arb` | ✅ 同步 |
| `lib/l10n/app_ja.arb` | ✅ 同步 |
| `lib/l10n/app_ru.arb` | ✅ 同步 |

## 注意事项
- `.g.dart` 文件是由 `json_serializable` 生成的，需要修改源 model 后重新生成
- `S.of(context)` 不能在 `initState()` 中使用，需在 `didChangeDependencies()` 或 build 方法中调用
- 替换 `const Text('中文')` 为 `Text(S.of(context).key)` 时需移除 `const`
- Provider/Service 中的中文如果不直接显示给用户（debug/log），可降低优先级
