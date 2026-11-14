import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kikoeru_flutter/src/widgets/offline_banner_inset.dart';

void main() {
  Future<(double, double)> layout(WidgetTester tester, bool offline) async {
    late double childTopPadding;
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(
          size: Size(669, 951),
          padding: EdgeInsets.only(top: 82),
          viewPadding: EdgeInsets.only(top: 82),
        ),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: OfflineBannerInset(
            offline: offline,
            child: Builder(builder: (context) {
              childTopPadding = MediaQuery.paddingOf(context).top;
              return const SizedBox.expand(key: Key('page'));
            }),
          ),
        ),
      ),
    );
    final top = tester.getTopLeft(find.byKey(const Key('page'))).dy;
    return (top, childTopPadding);
  }

  testWidgets('online pages keep the top safe area', (tester) async {
    expect(await layout(tester, false), (0.0, 82.0));
  });

  testWidgets('offline pages start below the banner without a top inset',
      (tester) async {
    // Same content position as before (30 + 82), but the page no longer sees
    // a tall status bar it could put a toolbar into.
    expect(await layout(tester, true), (112.0, 0.0));
  });
}
