import 'package:cider/src/template/diff.dart';
import 'package:cider/src/template/log.dart';
import 'package:cider/src/template/tag.dart';

class Config {
  Config(
      {String diffTemplate = '',
      String tagLinkTemplate = '',
      String tagTemplate = '',
      String releaseCommitTemplate = '',
      String logCommitTemplate = '',
      this.keepEmptyUnreleased = false,
      this.changelogNewline = true})
      : diffTemplate = Diff(diffTemplate),
        tagLinkTemplate = Tag(tagLinkTemplate),
        tagTemplate = Tag(tagTemplate),
        releaseCommitTemplate = Tag(releaseCommitTemplate),
        logCommitTemplate = Log(logCommitTemplate);

  final Diff diffTemplate;
  final Tag tagLinkTemplate;
  final Tag tagTemplate;
  final Tag releaseCommitTemplate;
  final Log logCommitTemplate;
  final bool keepEmptyUnreleased;
  final bool changelogNewline;
}
