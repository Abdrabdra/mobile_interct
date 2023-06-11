// ignore_for_file: public_member_api_docs, sort_constructors_first
class CommentModelInter {
  String text;
  int busId;
  CommentModelInter({
    required this.text,
    required this.busId,
  });

  @override
  String toString() => 'CommentModelInter(text: $text, busId: $busId)';
}
