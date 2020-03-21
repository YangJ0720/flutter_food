class HomeTabModel {
  final int id;
  final String label;

  HomeTabModel(this.id, this.label);

  factory HomeTabModel.fromJson(Map<String, dynamic> map) {
    var id = map['id'];
    var label = map['label'];
    return HomeTabModel(id, label);
  }
}
