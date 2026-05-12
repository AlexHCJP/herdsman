import 'dart:io';

import 'package:herdsman/utils/consts.dart';

/// Deletes a git hook by renaming it to have a .sample extension.
/// If the hook does not exist, it skips the deletion.
void delete({required String hookName, bool verbose = false}) {
  stdout.writeln('Deleting git hook: $hookName');
  final hookFile = File('${Consts.herdsmanDirPath}/$hookName');

  if (hookFile.existsSync()) {
    if (verbose) stdout.writeln('🗑️ Deleted git hook file: $hookName');
    final sampleFile = hookFile.copySync(
      '${Consts.herdsmanDirPath}/$hookName.sample',
    );
    hookFile.deleteSync();
    sampleFile.createSync();
    if (verbose) {
      stdout.writeln('📄 Created sample git hook file: $hookName.sample');
    }
    stdout.writeln('✅ Deleted git hook: $hookName');
  } else {
    stdout.writeln('⚠️ Git hook $hookName does not exist. Skipping...');
  }
}

/// Deletes multiple git hooks by renaming them to have a .sample extension.
/// If a hook does not exist, it skips the deletion for that hook.
void deleteMulti(List<String> hookNames, {bool verbose = false}) {
  for (final hookName in hookNames) {
    delete(hookName: hookName, verbose: verbose);
  }
}
