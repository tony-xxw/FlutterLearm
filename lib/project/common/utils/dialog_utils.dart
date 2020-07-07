import 'package:flutter/cupertino.dart';
import 'package:helloflutter/project/common/utils/navigator_utlis.dart';

class DialogUtils {
  static Future<Null> showEditDialog(
    BuildContext context,
    String dialogTitle,
    ValueChanged<String> onTitleChanged,
    ValueChanged<String> onContentChanged,
    VoidCallback onPreseed, {
    TextEditingController titleController,
    TextEditingController valueController,
    bool needTitle = true,
  }) {
    return NavigatorUtils.showXXWDialog(
        context: context,
        builder: (BuildContext context) {
          return Center();
        });
  }
}
