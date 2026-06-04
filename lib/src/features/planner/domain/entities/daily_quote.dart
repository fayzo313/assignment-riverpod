class DailyQuote {
  const DailyQuote({
    required this.text,
    required this.author,
    required this.fetchedAt,
  });

  final String text;
  final String author;
  final DateTime fetchedAt;

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'author': author,
      'fetchedAt': fetchedAt.toIso8601String(),
    };
  }

  factory DailyQuote.fromJson(Map<String, dynamic> json) {
    return DailyQuote(
      text: json['text'] as String? ?? '',
      author: json['author'] as String? ?? '',
      fetchedAt: DateTime.parse(
        json['fetchedAt'] as String? ?? DateTime.now().toIso8601String(),
      ),
    );
  }
}
