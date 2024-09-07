class Quotesmodal {
  final String quote;
  final String author;
  final String cat;

  Quotesmodal({
    required this.quote,
    required this.author,
    required this.cat,
  });

  factory Quotesmodal.fromMap({required Map data}) {
    return Quotesmodal(
      quote: data['quote'],
      author: data['author'],
      cat: data['category'],
    );
  }
}
