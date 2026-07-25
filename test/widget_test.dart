import 'package:flutter_test/flutter_test.dart';
import 'package:personal_page/main.dart';

void main() {
  testWidgets('PortfolioApp loads test', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    expect(find.text('Mohammed Rashid Chowdhury'), findsOneWidget);
  });
}
