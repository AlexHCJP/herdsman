import 'package:args/args.dart';
import 'package:herdsman/active.dart';
import 'package:herdsman/add.dart';
import 'package:herdsman/delete.dart';
import 'package:herdsman/init.dart';

const String version = '1.0.0';

ArgParser buildParser() {
  return ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Print this usage information.',
    )
    ..addFlag(
      'verbose',
      abbr: 'v',
      negatable: false,
      help: 'Show additional command output.',
    )
    ..addFlag(
      'init',
      abbr: 'i',
      negatable: false,
      help: 'Initialize git hooks.',
    )
    ..addFlag(
      'active',
      abbr: 'A',
      negatable: false,
      help: 'Activate herdsman git hooks.',
    )
    ..addFlag('add', abbr: 'a', negatable: false, help: 'Add git hooks.')
    ..addFlag('delete', abbr: 'd', negatable: false, help: 'Delete git hooks.')
    ..addFlag('version', negatable: false, help: 'Print the tool version.');
}

void printUsage(ArgParser argParser) {
  print('Usage: dart herdsman.dart <flags> [arguments]');
  print(argParser.usage);
}

void main(List<String> arguments) {
  final ArgParser argParser = buildParser();
  try {
    final ArgResults results = argParser.parse(arguments);
    bool verbose = false;

    // Process the parsed arguments.
    if (results.flag('verbose')) {
      print('Verbose mode enabled.');
      verbose = true;
    }

    if (results.flag('help')) {
      printUsage(argParser);
      return;
    }
    if (results.flag('version')) {
      print('herdsman version: $version');
      return;
    }
    if (results.flag('add')) {
      addMulti(results.rest, verbose);
      return;
    }
    if (results.flag('delete')) {
      deleteMulti(results.rest, verbose);
      return;
    }
    if (results.flag('init')) {
      init(verbose);
      return;
    }
    if (results.flag('active')) {
      active(verbose);
      return;
    }
  } on FormatException catch (e) {
    // Print usage information if an invalid argument was provided.
    print(e.message);
    print('');
    printUsage(argParser);
  }
}
