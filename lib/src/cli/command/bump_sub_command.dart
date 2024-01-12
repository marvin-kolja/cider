import 'package:cider/src/cli/console.dart';
import 'package:cider/src/project.dart';
import 'package:cider/src/cli/command/cider_command.dart';
import 'package:version_manipulation/mutations.dart';

class BumpSubCommand extends CiderCommand {
  BumpSubCommand(
    this.name, {
    required this.description,
    required this.mutation,
    required Console printer,
  }) : super(printer) {
    argParser
      ..addFlag('keep-build', help: 'Keep the existing build')
      ..addFlag('bump-build', help: 'Also bump the build')
      ..addOption('build',
          help: 'Sets the build to the given value', defaultsTo: '')
      ..addOption('pre',
          help: 'Sets the pre-release to the given value', defaultsTo: '');
  }

  factory BumpSubCommand.major(Console printer) => BumpSubCommand(
    'major',
    description: 'Bump the major version',
    mutation: BumpMajor(),
    printer: printer,
  );

  factory BumpSubCommand.breaking(Console printer) => BumpSubCommand(
    'breaking',
    description: 'Bump the breaking version',
    mutation: BumpBreaking(),
    printer: printer,
  );

  factory BumpSubCommand.minor(Console printer) => BumpSubCommand(
    'minor',
    description: 'Bump the minor version',
    mutation: BumpMinor(),
    printer: printer,
  );

  factory BumpSubCommand.patch(Console printer) => BumpSubCommand(
    'patch',
    description: 'Bump the patch version',
    mutation: BumpPatch(),
    printer: printer,
  );

  factory BumpSubCommand.build(Console printer) => BumpSubCommand(
    'build',
    description: 'Bump the build version',
    mutation: BumpBuild(),
    printer: printer,
  );

  factory BumpSubCommand.preRelease(Console printer) => BumpSubCommand(
    'pre',
    description: 'Bump the pre-release version',
    mutation: BumpPreRelease(),
    printer: printer,
  );

  factory BumpSubCommand.release(Console printer) => BumpSubCommand(
    'release',
    description: 'Bump the release version',
    mutation: Release(),
    printer: printer,
  );

  @override
  final String name;

  @override
  final String description;

  final VersionMutation mutation;

  @override
  Future<int> exec(Project project) async {
    final result = await project.bumpVersion(mutation,
        keepBuild: argResults!['keep-build'],
        bumpBuild: argResults!['bump-build'],
        build: argResults!['build'],
        pre: argResults!['pre']);
    printer.out.writeln(result);

    return 0;
  }
}
