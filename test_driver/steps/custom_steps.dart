import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class ScrollUntilTextVisible
    extends When2WithWorld<String, String, FlutterWorld> {
  ScrollUntilTextVisible()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 30));

  @override
  RegExp get pattern =>
      RegExp(r'I scroll {string} down until {string} is visible');

  @override
  Future<void> executeStep(String scrollableList, String targetPersona) async {
    await world.driver.scrollUntilVisible(
        find.byType(scrollableList), find.text(targetPersona),
        dxScroll: 0.0, dyScroll: -300);
  }
}

class VerifyPersonsList extends When1WithWorld<Table, FlutterWorld> {
  VerifyPersonsList()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 30));

  @override
  RegExp get pattern =>
      RegExp(r'the following list of persons should be displayed');

  @override
  Future<void> executeStep(Table personsTable) async {
    final List<Map<String, String>> personsMap = personsTable.asMap();
    for (int i = 0; i < personsMap.length; i++) {
      String person = personsMap[i]['Name'];
      print("===>Checking for $person in the list");

      await world.driver.scrollUntilVisible(
          find.byType('ListView'), find.text(person),
          dxScroll: 0.0, dyScroll: -300, timeout: const Duration(seconds: 20));

      bool isPersonDisplayed =
          await FlutterDriverUtils.isPresent(find.text(person), world.driver);
      expect(isPersonDisplayed, true);
    }
  }
}
