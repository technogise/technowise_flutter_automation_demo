import 'dart:async';

import 'package:flutter_gherkin_addons/wrapper.dart';

import 'steps/custom_steps.dart';

Future<void> main() {
  return TestRuntime.start(
      [
        scrollUntillTextVisible(),
        verifyPersonaList(),
      ]
  );
}