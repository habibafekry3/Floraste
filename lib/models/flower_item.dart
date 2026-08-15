class FlowerItem {
  final String name;
  final String imgUrl;
  final double price;
  final bool addToChart;

  FlowerItem({
    required this.name,
    required this.imgUrl,
    required this.price,
    this.addToChart = false,
  });
}

final List<String> productImagePages = [
  'assets/images/f1.png',
  'assets/images/f2.png',
  'assets/images/f3.png',
];
