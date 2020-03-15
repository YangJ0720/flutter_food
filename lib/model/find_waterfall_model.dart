class FindWaterfallModel {
  final String background;
  final String icon;
  final String name;
  final String summary;

  FindWaterfallModel(this.background, this.icon, this.name, this.summary);

  factory FindWaterfallModel.fromJson(Map<String, dynamic> map) {
    String background = map['background'];
    String icon = map['icon'];
    String name = map['name'];
    String summary = map['summary'];
    return FindWaterfallModel(background, icon, name, summary);
  }
}
