import 'dart:async';

import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/custom_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      FlutterDriverReporter(),
      JsonReporter(path: 'report.json')
    ]
    ..stepDefinitions = [ScrollUntilTextVisible(), VerifyPersonsList()]
    ..hooks = [AttachScreenshotOnFailedStepHook()]
    ..restartAppBetweenScenarios = true
    ..tagExpression = "@run"
    ..targetAppPath = "test_driver/app.dart"
    ..exitAfterTestRun = true;
  return GherkinRunner().execute(config);
}