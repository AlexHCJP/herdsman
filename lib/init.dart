import 'dart:io';

import 'package:herdsman/utils/consts.dart';
import 'package:herdsman/utils/copy_dir.dart';



void init(bool verbose) async {
  final dir = Directory(Consts.herdsmanDirPath);

  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
    if (verbose) print('📁 Creating ${Consts.herdsmanDirPath} directory...');
  } else {
    while (true) {
      print('🔄 Replace git hooks directory to ${Consts.herdsmanDirPath}? [Y/N]');
      final response = stdin.readLineSync();
      if (response == null) continue;
      if (response.toLowerCase() == 'n') {
        return;
      } else if (response.toLowerCase() == 'y') {
        break;
      }
    }
  }

  final gitHooksDir = Directory('.git/hooks');
  if (!gitHooksDir.existsSync()) {
    print(
      '❌ No .git/hooks directory found. Are you sure this is a git repository?',
    );
    exit(1);
  }

  copyDir(gitHooksDir, Directory(Consts.herdsmanDirPath));
  if (verbose) print('✅ Copied existing git hooks to ${Consts.herdsmanDirPath}');

  final result = await Process.run('git', [
    'config',
    'core.hooksPath',
    Consts.herdsmanDirPath,
  ]);
  if (verbose) print('⚙️ Setting git hooks path to ${Consts.herdsmanDirPath}');

  if (result.exitCode != 0) {
    stderr.write(result.stderr);
    exit(1);
  }
}
