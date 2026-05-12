import 'dart:io';

import 'package:herdsman/utils/consts.dart';
import 'package:herdsman/utils/hooks.dart';

/// Activates all git hooks by setting the core.hooksPath and making hook files executable.
/// If any error occurs during the process, it writes the error to stderr and exits with code 1.
void active({bool verbose = false}) {
  final result = Process.runSync('git', [
    'config',
    'core.hooksPath',
    Consts.herdsmanDirPath,
  ]);

  if (result.exitCode != 0) {
    stderr.write(result.stderr);
    exit(1);
  }

  for (final hook in [...getHooks(), ...deactiveHooks()]) {
    final file = File(hook);
    if (file.existsSync()) {
      final result = Process.runSync('chmod', ['+x', hook], runInShell: true);

      if (result.exitCode != 0) {
        stderr.write(result.stderr);
        exit(1);
      } else {
        stdout.writeln('✅ Activated git hook: $hook');
      }
    }
  }
  stdout.writeln('🎉 All git hooks are activated.');
}
