import 'package:flutter_test/flutter_test.dart';
import 'package:akradev_home/main.dart';

void main() {
  testWidgets('LandingPage renders without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.text('akradev studio'), findsWidgets);
  });
}
