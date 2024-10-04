class ChapterModel {
  final int chapterNumber;
  final String chapterSummary;
  final String chapterSummaryHindi;
  final int id;
  final String img;
  final String imageName;
  final String name;
  final String nameMeaning;
  final String nameTranslation;
  final String nameTransliterated;
  final int versesCount;

  ChapterModel({
    required this.chapterNumber,
    required this.chapterSummary,
    required this.chapterSummaryHindi,
    required this.id,
    required this.img,
    required this.imageName,
    required this.name,
    required this.nameMeaning,
    required this.nameTranslation,
    required this.nameTransliterated,
    required this.versesCount,
  });

  factory ChapterModel.fromMap({required Map<String, dynamic> data}) {
    return ChapterModel(
      chapterNumber: data['chapter_number'],
      chapterSummary: data['chapter_summary'],
      chapterSummaryHindi: data['chapter_summary_hindi'],
      id: data['id'],
      img: data['img'],
      imageName: data['image_name'],
      name: data['name'],
      nameMeaning: data['name_meaning'],
      nameTranslation: data['name_translation'],
      nameTransliterated: data['name_transliterated'],
      versesCount: data['verses_count'],
    );
  }
}
