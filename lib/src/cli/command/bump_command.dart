import 'package:args/command_runner.dart';
import 'package:cider/src/project.dart';
import 'package:cider/src/cli/command/bump_sub_command.dart';
import 'package:cider/src/cli/command/cider_command.dart';

class BumpCommand extends CiderCommand {
  BumpCommand(super.printer) {
    addSubcommand(BumpSubCommand.breaking(printer));
    addSubcommand(BumpSubCommand.major(printer));
    addSubcommand(BumpSubCommand.minor(printer));
    addSubcommand(BumpSubCommand.patch(printer));
    addSubcommand(BumpSubCommand.build(printer));
    addSubcommand(BumpSubCommand.preRelease(printer));
    addSubcommand(BumpSubCommand.release(printer));
  }

  @override
  final name = 'bump';
  @override
  final description = 'Bump project version';

  @override
  Future<int> exec(Project project) async {
    throw UsageException(
        'Bump command can only be used with subcommands', usage);
  }
}
