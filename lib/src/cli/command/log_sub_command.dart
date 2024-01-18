import 'package:cider/src/cli/console.dart';
import 'package:cider/src/project.dart';
import 'package:cider/src/cli/command/cider_command.dart';

class LogSubCommand extends CiderCommand {
  LogSubCommand(
    this.name, {
    String? type,
    required this.description,
    required Console printer,
  })  : type = type ?? name,
        super(printer) {
    argParser
      ..addFlag('commit', help: 'Commit the log entry.', defaultsTo: false)
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
      );
  }

  factory LogSubCommand.add(Console printer) => LogSubCommand(
        'add',
        description: 'Add a new feature to the changelog',
        printer: printer,
      );

  factory LogSubCommand.fix(Console printer) => LogSubCommand(
        'fix',
        description: 'Add a new bug fix to the changelog',
        printer: printer,
      );

  factory LogSubCommand.change(Console printer) => LogSubCommand(
        'change',
        description: 'Add a new change to the changelog',
        printer: printer,
      );

  factory LogSubCommand.deprecate(Console printer) => LogSubCommand(
        'deprecate',
        description: 'Add a new deprecation to the changelog',
        printer: printer,
      );

  factory LogSubCommand.remove(Console printer) => LogSubCommand(
        'remove',
        description: 'Add a new removal to the changelog',
        printer: printer,
      );

  factory LogSubCommand.security(Console printer) => LogSubCommand(
        'security',
        description: 'Add a new security fix to the changelog',
        printer: printer,
      );

  @override
  final String name;

  @override
  final String description;

  final String type;

  @override
  Future<int> exec(Project project) async {
    final description = argResults!.rest[0];
    await project.addUnreleased(type, description);
    final shouldCommit = argResults!['commit'] as bool;
    if (shouldCommit) {
      final commitScope = argResults!['commit-scope'] as String;
      await project.commitLog(type, description, scope: commitScope);
    }

    return 0;
  }
}
