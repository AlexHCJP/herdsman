import 'dart:io';

import 'package:herdsman/utils/consts.dart';

Future<void> apply(String hookName, bool verbose) async {
  final hookFile = File('${Consts.herdsmanDirPath}/$hookName.sample');

  if (hookFile.existsSync()) {
    final newFile = File('${Consts.herdsmanDirPath}/$hookName');
    if (newFile.existsSync()) {
      print('⚠️ Git hook $hookName already exists. Skipping...');
      return;
    }
    final file = hookFile.copySync('${Consts.herdsmanDirPath}/$hookName');
    if (verbose) print('🔨 Creating git hook: $hookName');
    final fileHandle = file.openWrite();
    fileHandle.writeAll(['#!/bin/sh\n', 'set -e\n']);
    if (verbose) print('✍️ Writing to git hook: $hookName');
    await fileHandle.close();
    file.createSync();
    if (verbose) print('📄 Created git hook file: $hookName');
    hookFile.deleteSync();
    if (verbose) print('🗑️ Deleting sample git hook: $hookName.sample');
    final result = await Process.run('chmod', [
      '+x',
      '${Consts.herdsmanDirPath}/$hookName',
    ], runInShell: true);
    if (verbose) {
      print('⚙️ Setting executable permission for git hook: $hookName');
    }

    if (result.exitCode != 0) {
      stderr.write(result.stderr);
      exit(1);
    } else {
      print('✅ Applied git hook: $hookName');
    }
  } else {
    print('⚠️ Git hook $hookName already exists. Skipping...');
  }
}

void applyMulti(List<String> hookNames, bool verbose) {
  for (final hookName in hookNames) {
    apply(hookName, verbose);
  }
}
