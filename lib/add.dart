import 'dart:io';

import 'package:herdsman/utils/consts.dart';

/// Adds a git hook by copying from the sample file.
/// If the hook already exists, it skips the addition.
Future<void> add({required String hookName, bool verbose = false}) async {
  final hookFile = File('${Consts.herdsmanDirPath}/$hookName.sample');

  if (hookFile.existsSync()) {
    final newFile = File('${Consts.herdsmanDirPath}/$hookName');
    if (newFile.existsSync()) {
      stdout.writeln('⚠️ Git hook $hookName already exists. Skipping...');
      return;
    }
    final file = hookFile.copySync('${Consts.herdsmanDirPath}/$hookName');
    if (verbose) stdout.writeln('🔨 Creating git hook: $hookName');
    file.createSync();
    if (verbose) stdout.writeln('📄 Created git hook file: $hookName');
    hookFile.deleteSync();
    if (verbose)
      stdout.writeln('🗑️ Deleting sample git hook: $hookName.sample');

    stdout.writeln('✅ Add git hook: $hookName');
  } else {
    stdout.writeln('⚠️ Git hook $hookName already exists. Skipping...');
  }
}

/// Adds multiple git hooks by copying from their respective sample files.
/// If a hook already exists, it skips the addition for that hook.
void addMulti(List<String> hookNames, {bool verbose = false}) {
  for (final hookName in hookNames) {
    add(hookName: hookName, verbose: verbose);
  }
}
