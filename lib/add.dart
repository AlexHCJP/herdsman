import 'dart:io';

import 'package:herdsman/utils/consts.dart';

/// Adds a git hook by copying from the sample file.
/// If the hook already exists, it skips the addition.
Future<void> add(String hookName, bool verbose) async {
  final hookFile = File('${Consts.herdsmanDirPath}/$hookName.sample');

  if (hookFile.existsSync()) {
    final newFile = File('${Consts.herdsmanDirPath}/$hookName');
    if (newFile.existsSync()) {
      print('⚠️ Git hook $hookName already exists. Skipping...');
      return;
    }
    final file = hookFile.copySync('${Consts.herdsmanDirPath}/$hookName');
    if (verbose) print('🔨 Creating git hook: $hookName');
    file.createSync();
    if (verbose) print('📄 Created git hook file: $hookName');
    hookFile.deleteSync();
    if (verbose) print('🗑️ Deleting sample git hook: $hookName.sample');

    print('✅ Add git hook: $hookName');
  } else {
    print('⚠️ Git hook $hookName already exists. Skipping...');
  }
}

/// Adds multiple git hooks by copying from their respective sample files.
/// If a hook already exists, it skips the addition for that hook.
void addMulti(List<String> hookNames, bool verbose) {
  for (final hookName in hookNames) {
    add(hookName, verbose);
  }
}
