// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoteField {
  static const String tableName = 'notes';
  static const String id = 'id';
  static const String title = 'title';
  static const String content = 'content';

  static List<String> values() => [id, title, content];
}

class NoteModel {
  late final int? id;
  final String title;
  final String content;

  NoteModel({
    this.id,
    required this.title,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  NoteModel copyWith({
    int? id,
    String? title,
    String? content,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }
}
