import 'package:args/command_runner.dart';
import 'package:cider/src/cli/command/cider_command.dart';
import 'package:cider/src/cli/command/log_sub_command.dart';
import 'package:cider/src/project.dart';

class LogCommand extends CiderCommand {
  LogCommand(super.printer) {
    addSubcommand(LogSubCommand.add(printer));
    addSubcommand(LogSubCommand.fix(printer));
    addSubcommand(LogSubCommand.change(printer));
    addSubcommand(LogSubCommand.deprecate(printer));
    addSubcommand(LogSubCommand.remove(printer));
    addSubcommand(LogSubCommand.security(printer));
  }

  @override
  final name = 'log';
  @override
  final description =
      'Add a new entry to the "Unreleased" section of the changelog';

  @override
  Future<int> exec(Project project) async {
    throw UsageException(
        'Log command can only be used with subcommands', usage);
  }
}
