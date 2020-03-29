class HomeExclusiveGridModel {
  final int id;
  final String label;
  final String url;

  HomeExclusiveGridModel(this.id, this.label, this.url);

  factory HomeExclusiveGridModel.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String label = json['label'];
    String url = json['url'];
    return HomeExclusiveGridModel(id, label, url);
  }
}
