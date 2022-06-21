class Activity {
  late final imageUrl;
  late final String name;
  late final String type;
  late final List<String> startTimes;
  late final int rating;
  late final int price;

  Activity({
    this.imageUrl,
    required String name,
    required String type,
    required List<String> startTimes,
    required int rating,
    required int price,
  });
}
