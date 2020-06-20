import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Persona App', () {

    final seePersonaLink = find.byValueKey('persona');
    final firstPersonaName = find.descendant(of: find.byTooltip("Luke Skywalker"), matching: find.byType("Text"));
    final secondPersonaNameD = find.ancestor(
        of:find.byValueKey("image-1"),matching: find.byType("Row")
    );
    final secondPersonaNameA = find.descendant(
        of:secondPersonaNameD,matching: find.byType("Text")
    );
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('should show list of all personas', () async {
      expect(await driver.getText(seePersonaLink), "See All Persons");
    });

    test('should show list of all personas', () async {
      await driver.tap(seePersonaLink);
      expect(await driver.getText(firstPersonaName), "Luke Skywalker");
    });
    test('should show second persona by heirarchy', () async {
      expect(await driver.getText(secondPersonaNameA), "C-3PO");
    });

  });
}