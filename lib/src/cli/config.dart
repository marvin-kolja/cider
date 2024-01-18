import 'package:cider/src/template/diff.dart';
import 'package:cider/src/template/tag.dart';

class Config {
  Config(
      {String diffTemplate = '',
      String tagLinkTemplate = '',
      String tagTemplate = '',
      this.keepEmptyUnreleased = false,
      this.changelogNewline = true})
      : diffTemplate = Diff(diffTemplate),
        tagLinkTemplate = Tag(tagLinkTemplate),
        tagTemplate = Tag(tagTemplate);

  final Diff diffTemplate;
  final Tag tagLinkTemplate;
  final Tag tagTemplate;
  final bool keepEmptyUnreleased;
  final bool changelogNewline;
}
