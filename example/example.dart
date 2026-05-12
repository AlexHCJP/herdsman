import 'package:herdsman/active.dart';
import 'package:herdsman/add.dart';
import 'package:herdsman/delete.dart';
import 'package:herdsman/init.dart';

void main() async {
  // Initialize the .herdsman/githooks directory
  await init(verbose: true);

  // Add a pre-commit hook
  await add(hookName: 'pre-commit', verbose: true);

  // Activate all hooks
  active(verbose: true);

  // Remove a hook
  delete(hookName: 'pre-commit', verbose: true);
}
