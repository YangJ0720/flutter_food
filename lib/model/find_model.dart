class FindModel {
  final int id;
  final String label;

  FindModel(this.id, this.label);

  factory FindModel.fromJson(Map<String, dynamic> map) {
    return FindModel(map['id'], map['label']);
  }
}
