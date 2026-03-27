import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/app_localizations.dart';
import 'player_buttons_settings_screen.dart';
import 'player_lyric_style_screen.dart';
import 'work_detail_display_settings_screen.dart';
import 'work_card_display_settings_screen.dart';
import 'my_tabs_display_settings_screen.dart';
import '../widgets/scrollable_appbar.dart';
import '../providers/settings_provider.dart';

class UiSettingsScreen extends ConsumerWidget {
  const UiSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageSize = ref.watch(pageSizeProvider);

    return Scaffold(
      appBar: ScrollableAppBar(
        title: Text(
          S.of(context).uiSettings,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.tune,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(S.of(context).playerButtonSettings),
                  subtitle: Text(S.of(context).playerButtonSettingsSubtitle),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const PlayerButtonsSettingsScreen(),
                      ),
                    );
                  },
                ),
                Divider(color: Theme.of(context).colorScheme.outlineVariant),
                ListTile(
                  leading: Icon(Icons.lyrics,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(S.of(context).playerLyricStyle),
                  subtitle: Text(S.of(context).playerLyricStyleSubtitle),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PlayerLyricStyleScreen(),
                      ),
                    );
                  },
                ),
                Divider(color: Theme.of(context).colorScheme.outlineVariant),
                ListTile(
                  leading: Icon(Icons.visibility,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(S.of(context).workDetailDisplaySettings),
                  subtitle: Text(S.of(context).workDetailDisplaySubtitle),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const WorkDetailDisplaySettingsScreen(),
                      ),
                    );
                  },
                ),
                Divider(color: Theme.of(context).colorScheme.outlineVariant),
                ListTile(
                  leading: Icon(Icons.grid_view,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(S.of(context).workCardDisplaySettings),
                  subtitle: Text(S.of(context).workCardDisplaySubtitle),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const WorkCardDisplaySettingsScreen(),
                      ),
                    );
                  },
                ),
                Divider(color: Theme.of(context).colorScheme.outlineVariant),
                ListTile(
                  leading: Icon(Icons.tab,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(S.of(context).myTabsDisplaySettings),
                  subtitle: Text(S.of(context).myTabsDisplaySubtitle),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const MyTabsDisplaySettingsScreen(),
                      ),
                    );
                  },
                ),
                Divider(color: Theme.of(context).colorScheme.outlineVariant),
                ListTile(
                  leading: Icon(Icons.format_list_numbered,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(S.of(context).pageSizeSettings),
                  subtitle: Text(S.of(context).pageSizeCurrent(pageSize)),
                  trailing: DropdownButton<int>(
                    value: pageSize,
                    underline: const SizedBox(),
                    items: [20, 40, 60, 100].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        ref
                            .read(pageSizeProvider.notifier)
                            .updatePageSize(newValue);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
