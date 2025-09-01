import 'dart:math';
import '../models/card_model.dart';

class CardRepository {
  /// يعيد قائمة من CardModel مكوّنة من 6 أزواج (12 بطاقة)
  static List<CardModel> initializeCards() {
    final flags = ['🇺🇸', '🇬🇧', '🇫🇷', '🇩🇪', '🇮🇹', '🇪🇸'];
    final list = <CardModel>[];
    for (var flag in flags) {
      list.add(CardModel(flag: flag));
      list.add(CardModel(flag: flag));
    }
    list.shuffle(Random());
    // في البداية كل البطاقات مقلوبة (مرحلة الحفظ)
    for (var card in list) {
      card.isFlipped = true;
    }
    return list;
  }
}
