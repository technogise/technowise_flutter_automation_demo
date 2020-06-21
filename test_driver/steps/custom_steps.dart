import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_gherkin_addons/flutter_gherkin_addons.dart';
import 'package:gherkin/gherkin.dart';

GenericWhen2 scrollUntillTextVisible(){
  return when2(r'I scroll {string} down until {string} is visible',
          (context,String scrollableList, String targetPersona) async {
    await context.world.driver.scrollUntilVisible(
    find.byType(scrollableList), find.text(targetPersona),
    dxScroll: 0.0, dyScroll: -300.0);
  });
}
GenericWhen1 verifyPersonaList(){
  return when1(r'the following list of persons should be displayed',
          (context,Table personsTable) async {
    final List<Map<String, String>> personsMap = personsTable.asMap();
    for (int i = 0; i < personsMap.length; i++) {
      String person = personsMap[i]['Name'];
      print("===>Checking for $person in the list");

      await context.world.driver.scrollUntilVisible(
          find.byType('ListView'), find.text(person),
          dxScroll: 0.0, dyScroll: -300.0, timeout: const Duration(seconds: 20));

      bool isPersonDisplayed =
      await FlutterDriverUtils.isPresent(
          find.text(person), context.world.driver);
      await context.expect(isPersonDisplayed, true);
    }
  },StepDefinitionConfiguration()..timeout = Duration(seconds: 60));
}
