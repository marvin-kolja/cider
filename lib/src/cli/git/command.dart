import 'dart:io';

class GitCommand {
  GitCommand({
    required this.workingDirectory,
    required this.arguments,
  });

  final Directory workingDirectory;

  final List<String> arguments;


  Future<ProcessResult> exec() async {
    final process = await Process.run(
      'git',
      arguments,
      workingDirectory: workingDirectory.path,
      runInShell: false,
    );

    if (process.exitCode != 0) {
      throw Exception(process.stderr);
    }

    return process;
  }
}
