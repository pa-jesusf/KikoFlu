import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/app_localizations.dart';
import 'audio_format_settings_screen.dart';
import 'blocked_items_screen.dart';
import 'llm_settings_screen.dart';
import '../models/sort_options.dart';
import '../providers/settings_provider.dart';
import '../utils/l10n_extensions.dart';
import '../utils/snackbar_util.dart';
import '../widgets/scrollable_appbar.dart';
import '../widgets/sort_dialog.dart';

/// 偏好设置页面
class PreferencesScreen extends ConsumerWidget {
  const PreferencesScreen({super.key});

  void _showSubtitleLibraryPriorityDialog(BuildContext context, WidgetRef ref) {
    final currentPriority = ref.read(subtitleLibraryPriorityProvider);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          S.of(context).subtitleLibraryPriority,
          style: const TextStyle(fontSize: 18),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).selectSubtitlePriority,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            ...SubtitleLibraryPriority.values.map((priority) {
              return RadioListTile<SubtitleLibraryPriority>(
                title: Text(priority.localizedName(context)),
                subtitle: Text(
                  priority == SubtitleLibraryPriority.highest
                      ? S.of(context).subtitlePriorityHighestDesc
                      : S.of(context).subtitlePriorityLowestDesc,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                value: priority,
                groupValue: currentPriority,
                onChanged: (value) {
                  if (value != null) {
                    ref
                        .read(subtitleLibraryPriorityProvider.notifier)
                        .updatePriority(value);
                    Navigator.pop(context);
                    SnackBarUtil.showSuccess(
                      context,
                      S.of(context).setToValue(value.localizedName(context)),
                    );
                  }
                },
              );
            }),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).close),
          ),
        ],
      ),
    );
  }

  void _showDefaultSortDialog(BuildContext context, WidgetRef ref) {
    final currentSort = ref.read(defaultSortProvider);

    showDialog(
      context: context,
      builder: (context) => CommonSortDialog(
        title: S.of(context).defaultSortSettings,
        currentOption: currentSort.order,
        currentDirection: currentSort.direction,
        availableOptions: SortOrder.values
            .where((option) => option != SortOrder.updatedAt)
            .toList(),
        onSort: (option, direction) {
          ref
              .read(defaultSortProvider.notifier)
              .updateDefaultSort(option, direction);
          SnackBarUtil.showSuccess(
            context,
            S.of(context).defaultSortUpdated,
          );
        },
        autoClose: false,
      ),
    );
  }

  void _showTranslationSourceDialog(BuildContext context, WidgetRef ref) {
    final currentSource = ref.read(translationSourceProvider);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          S.of(context).translationSourceSettings,
          style: const TextStyle(fontSize: 18),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).selectTranslationProvider,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            ...TranslationSource.values.map((source) {
              return RadioListTile<TranslationSource>(
                title: Text(source.localizedName(context)),
                subtitle: Text(
                  _getTranslationSourceDescription(context, source),
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                value: source,
                groupValue: currentSource,
                onChanged: (value) {
                  if (value != null) {
                    if (value == TranslationSource.llm) {
                      final llmSettings = ref.read(llmSettingsProvider);
                      if (llmSettings.apiKey.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(S.of(context).needsConfiguration),
                            content:
                                Text(S.of(context).llmConfigRequiredMessage),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(S.of(context).cancel),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.pop(context); // Close alert dialog
                                  Navigator.pop(
                                      context); // Close source selection dialog
                                  await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LLMSettingsScreen(),
                                    ),
                                  );

                                  // Check if configured successfully
                                  final newSettings =
                                      ref.read(llmSettingsProvider);
                                  if (newSettings.apiKey.isNotEmpty) {
                                    ref
                                        .read(
                                            translationSourceProvider.notifier)
                                        .updateSource(TranslationSource.llm);
                                    if (context.mounted) {
                                      SnackBarUtil.showSuccess(
                                        context,
                                        S.of(context).autoSwitchedToLlm,
                                      );
                                    }
                                  }
                                },
                                child: Text(S.of(context).goToConfigure),
                              ),
                            ],
                          ),
                        );
                        return;
                      }
                    }

                    ref
                        .read(translationSourceProvider.notifier)
                        .updateSource(value);
                    Navigator.pop(context);
                    SnackBarUtil.showSuccess(
                      context,
                      S.of(context).setToValue(value.localizedName(context)),
                    );
                  }
                },
              );
            }),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).close),
          ),
        ],
      ),
    );
  }

  String _getTranslationSourceDescription(BuildContext context, TranslationSource source) {
    final s = S.of(context);
    switch (source) {
      case TranslationSource.google:
        return s.translationDescGoogle;
      case TranslationSource.youdao:
        return s.translationDescYoudao;
      case TranslationSource.microsoft:
        return s.translationDescMicrosoft;
      case TranslationSource.llm:
        return s.translationDescLlm;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priority = ref.watch(subtitleLibraryPriorityProvider);
    final defaultSort = ref.watch(defaultSortProvider);
    final translationSource = ref.watch(translationSourceProvider);

    return Scaffold(
      appBar: ScrollableAppBar(
        title: Text(S.of(context).preferenceSettings, style: const TextStyle(fontSize: 18)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.library_books,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(S.of(context).subtitleLibraryPriority),
                  subtitle: Text(S.of(context).currentSettingLabel(priority.localizedName(context))),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _showSubtitleLibraryPriorityDialog(context, ref);
                  },
                ),
                Divider(color: Theme.of(context).colorScheme.outlineVariant),
                ListTile(
                  leading: Icon(Icons.sort,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(S.of(context).defaultSortSettingTitle),
                  subtitle: Text(
                      '${defaultSort.order.localizedLabel(context)} - ${defaultSort.direction.localizedLabel(context)}'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _showDefaultSortDialog(context, ref);
                  },
                ),
                Divider(color: Theme.of(context).colorScheme.outlineVariant),
                ListTile(
                  leading: Icon(Icons.translate,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(S.of(context).translationSource),
                  subtitle: Text(S.of(context).currentSettingLabel(translationSource.localizedName(context))),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _showTranslationSourceDialog(context, ref);
                  },
                ),
                if (translationSource == TranslationSource.llm) ...[
                  Divider(color: Theme.of(context).colorScheme.outlineVariant),
                  ListTile(
                    leading: Icon(Icons.settings_input_component,
                        color: Theme.of(context).colorScheme.primary),
                    title: Text(S.of(context).llmSettings),
                    subtitle: Text(S.of(context).llmSettingsSubtitle),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LLMSettingsScreen(),
                        ),
                      );
                    },
                  ),
                ],
                Divider(color: Theme.of(context).colorScheme.outlineVariant),
                ListTile(
                  leading: Icon(Icons.audio_file,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(S.of(context).audioFormatPreference),
                  subtitle: Text(S.of(context).audioFormatSubtitle),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AudioFormatSettingsScreen(),
                      ),
                    );
                  },
                ),
                Divider(color: Theme.of(context).colorScheme.outlineVariant),
                ListTile(
                  leading: Icon(Icons.block,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(S.of(context).blockingSettings),
                  subtitle: Text(S.of(context).blockingSettingsSubtitle),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BlockedItemsScreen(),
                      ),
                    );
                  },
                ),
                // 仅在 Android, Windows 和 macOS 平台上显示音频直通设置
                if (Theme.of(context).platform == TargetPlatform.android ||
                    Theme.of(context).platform == TargetPlatform.windows ||
                    Theme.of(context).platform == TargetPlatform.macOS) ...[
                  Divider(color: Theme.of(context).colorScheme.outlineVariant),
                  SwitchListTile(
                    secondary: Icon(Icons.surround_sound,
                        color: Theme.of(context).colorScheme.primary),
                    title: Text(S.of(context).audioPassthrough),
                    subtitle: Text(
                      (Theme.of(context).platform == TargetPlatform.windows ||
                              Theme.of(context).platform ==
                                  TargetPlatform.macOS)
                          ? S.of(context).audioPassthroughDescWindows
                          : S.of(context).audioPassthroughDescAndroid,
                      style: const TextStyle(fontSize: 12),
                    ),
                    value: ref.watch(audioPassthroughProvider),
                    onChanged: (value) async {
                      if (value) {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(S.of(context).warning),
                            content:
                                Text(S.of(context).audioPassthroughWarning),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: Text(S.of(context).cancel),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(S.of(context).confirm),
                              ),
                            ],
                          ),
                        );

                        if (confirmed != true) return;
                      }

                      ref.read(audioPassthroughProvider.notifier).toggle(value);
                      if (context.mounted) {
                        SnackBarUtil.showSuccess(
                          context,
                          value
                              ? ((Theme.of(context).platform ==
                                          TargetPlatform.windows ||
                                      Theme.of(context).platform ==
                                          TargetPlatform.macOS)
                                  ? S.of(context).exclusiveModeEnabled
                                  : S.of(context).audioPassthroughEnabled)
                              : S.of(context).audioPassthroughDisabled,
                        );
                      }
                    },
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
