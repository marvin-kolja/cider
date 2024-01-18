import 'package:cider/src/project.dart';
import 'package:cider/src/cli/command/cider_command.dart';

class ReleaseCommand extends CiderCommand {
  ReleaseCommand(super.printer) {
    argParser
      ..addOption('date', help: 'Release date', defaultsTo: 'today')
      ..addFlag('commit', help: 'Commit the release', defaultsTo: false)
      ..addOption(
        'commit-scope',
        help: 'Commit scope.',
        defaultsTo: 'cli',
        allowed: ['cli', 'staged', 'all'],
        allowedHelp: {
          'cli':
              'Commit only changes made by the CLI.\nIf there are other changes in the pubspec.yaml file other than the version they will be ignored.',
          'staged': 'Commit staged files and changes made by the CLI.',
          'all': 'Commit all changes. This adds files to the index.',
        },
      )
      ..addFlag('tag', help: 'Tag the release', defaultsTo: false);
  }

  @override
  final name = 'release';
  @override
  final description = 'Release the unreleased changes';

  @override
  Future<int> exec(Project project) async {
    final date = argResults!['date'];
    final parsedDate = date == 'today' ? DateTime.now() : DateTime.parse(date);
    final release = await project.release(parsedDate);
    final shouldCommit = argResults!['commit'] as bool;

    if (shouldCommit) {
      final commitScope = argResults!['commit-scope'] as String;
      await project.commitRelease(
        scope: commitScope,
      );
      final shouldTag = argResults!['tag'] as bool;
      if (shouldTag) {
        await project.tagRelease();
      }
    }

    printer.out.writeln(release);
    return 0;
  }
}
