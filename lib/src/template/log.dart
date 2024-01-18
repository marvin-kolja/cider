import 'package:cider/src/template/template.dart';

final class Log extends Template {
  const Log(super.template);

  String render(Object type, Object description) => template
      .replaceAll('%type%', type.toString())
      .replaceAll('%description%', description.toString());
}
