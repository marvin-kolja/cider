import 'dart:io';

import 'package:cider/src/cli/git/command.dart';

class Git {
  Git(this.workingDirectory);

  GitCommand addAll() {
    return GitCommand(
      workingDirectory: workingDirectory,
      arguments: ['add', '-a'],
    );
  }

  GitCommand addFiles(List<File> files) {
    assert(files.isNotEmpty, 'Files must not be empty.');

    return GitCommand(
      workingDirectory: workingDirectory,
      arguments: ['add', ...files.map((it) => it.path)],
    );
  }

  GitCommand commit(String message) {
    return GitCommand(
      workingDirectory: workingDirectory,
      arguments: ['commit', '-m', message],
    );
  }

  GitCommand tag(String name, {String? message, bool? annotated = false}) {
    final args = ['tag'];
    if (annotated == true) {
      args.add('-a');
    }
    args.add(name);
    if (message != null) {
      args.addAll(['-m', message]);
    }
    return GitCommand(
      workingDirectory: workingDirectory,
      arguments: args,
    );
  }

  GitCommand removeStaged() {
    return GitCommand(
      workingDirectory: workingDirectory,
      arguments: ['restore', '--staged', '.'],
    );
  }

  final Directory workingDirectory;
}
