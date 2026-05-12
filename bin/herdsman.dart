import 'dart:io';

import 'package:args/args.dart';
import 'package:herdsman/active.dart';
import 'package:herdsman/add.dart';
import 'package:herdsman/delete.dart';
import 'package:herdsman/init.dart';

const String version = '1.0.2';

ArgParser buildParser() => ArgParser()
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
  ..addFlag('init', abbr: 'i', negatable: false, help: 'Initialize git hooks.')
  ..addFlag(
    'active',
    abbr: 'A',
    negatable: false,
    help: 'Activate herdsman git hooks.',
  )
  ..addFlag('add', abbr: 'a', negatable: false, help: 'Add git hooks.')
  ..addFlag('delete', abbr: 'd', negatable: false, help: 'Delete git hooks.')
  ..addFlag('version', negatable: false, help: 'Print the tool version.');

void printUsage(ArgParser argParser) {
  stdout
    ..writeln('Usage: dart herdsman.dart <flags> [arguments]')
    ..writeln(argParser.usage);
}

void main(List<String> arguments) {
  final argParser = buildParser();
  try {
    final results = argParser.parse(arguments);
    var verbose = false;

    // Process the parsed arguments.
    if (results.flag('verbose')) {
      verbose = true;
    }

    if (results.flag('help')) {
      printUsage(argParser);
      return;
    }
    if (results.flag('version')) {
      stdout.writeln('herdsman version: $version');
      return;
    }
    if (results.flag('add')) {
      addMulti(results.rest, verbose: verbose);
      return;
    }
    if (results.flag('delete')) {
      deleteMulti(results.rest, verbose: verbose);
      return;
    }
    if (results.flag('init')) {
      init(verbose: verbose);
      return;
    }
    if (results.flag('active')) {
      active(verbose: verbose);
      return;
    }
  } on FormatException catch (e) {
    // Print usage information if an invalid argument was provided.
    stdout
      ..writeln(e.message)
      ..writeln('');
    printUsage(argParser);
  }
}
