class VerseModel {
  final int chapterId;
  final int chapterNumber;
  final int externalId;
  final int id;
  final String text;
  final String title;
  final int verseNumber;
  final int verseOrder;
  final String transliteration;
  final String wordMeanings;

  VerseModel({
    required this.chapterId,
    required this.chapterNumber,
    required this.externalId,
    required this.id,
    required this.text,
    required this.title,
    required this.verseNumber,
    required this.verseOrder,
    required this.transliteration,
    required this.wordMeanings,
  });

  factory VerseModel.fromMap({required Map<String, dynamic> data}) {
    return VerseModel(
      chapterId: data['chapter_id'],
      chapterNumber: data['chapter_number'],
      externalId: data['externalId'],
      id: data['id'],
      text: data['text'],
      title: data['title'],
      verseNumber: data['verse_number'],
      verseOrder: data['verse_order'],
      transliteration: data['transliteration'],
      wordMeanings: data['word_meanings'],
    );
  }
}
