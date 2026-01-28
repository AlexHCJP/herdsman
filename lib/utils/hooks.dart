import 'package:herdsman/utils/consts.dart';

/// List of standard Git hook names
const hooks = [
  'applypatch-msg',
  'pre-applypatch',
  'post-applypatch',
  'pre-commit',
  'prepare-commit-msg',
  'commit-msg',
  'post-commit',
  'pre-rebase',
  'post-checkout',
  'post-merge',
  'pre-push',
  'pre-receive',
  'update',
  'post-receive',
  'post-update',
  'push-to-checkout',
  'pre-auto-gc',
  'post-rewrite',
  'sendemail-validate',
];

/// Returns the list of active git hook file paths
List<String> getHooks() {
  return hooks.map((value) => '${Consts.herdsmanDirPath}/$value').toList();
}

/// Returns the list of deactivated git hook file paths
List<String> deactiveHooks() {
  return hooks
      .map((value) => '${Consts.herdsmanDirPath}/$value.deactive')
      .toList();
}
