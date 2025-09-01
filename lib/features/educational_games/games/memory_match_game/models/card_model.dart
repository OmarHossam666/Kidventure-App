class CardModel {
  final String flag;
  bool isFlipped;
  bool isMatched;

  CardModel({
    required this.flag,
    this.isFlipped = false,
    this.isMatched = false,
  });
}
