// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addMessage":
            MessageLookupByLibrary.simpleMessage("هل تريد حفظ هذه الملاحظة؟"),
        "addNote": MessageLookupByLibrary.simpleMessage("اضافة ملاحظة"),
        "delete": MessageLookupByLibrary.simpleMessage("حذف"),
        "deleteMessage":
            MessageLookupByLibrary.simpleMessage("هل تريد حذف هذه الملاحظة؟"),
        "discard": MessageLookupByLibrary.simpleMessage("تجاهل"),
        "edit": MessageLookupByLibrary.simpleMessage("تعديل"),
        "editMessage":
            MessageLookupByLibrary.simpleMessage("هل تريد تعديل هذه الملاحظة؟"),
        "editNote": MessageLookupByLibrary.simpleMessage("تعديل الملاحظة"),
        "homeTitle": MessageLookupByLibrary.simpleMessage("الملاحظات"),
        "save": MessageLookupByLibrary.simpleMessage("حفظ"),
        "stringLangKey": MessageLookupByLibrary.simpleMessage("English")
      };
}
