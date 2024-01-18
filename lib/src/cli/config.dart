import 'package:cider/src/template/diff.dart';
import 'package:cider/src/template/tag.dart';

class Config {
  Config(
      {String diffTemplate = '',
      String tagLinkTemplate = '',
      this.keepEmptyUnreleased = false,
      this.changelogNewline = true})
      : diffTemplate = Diff(diffTemplate),
        tagLinkTemplate = Tag(tagLinkTemplate);

  final Diff diffTemplate;
  final Tag tagLinkTemplate;
  final bool keepEmptyUnreleased;
  final bool changelogNewline;
}
