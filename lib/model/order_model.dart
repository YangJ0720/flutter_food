class OrderModel {
  final String url;
  final String name;
  final int state;
  final String date;
  final String stateDescription;
  final String summary;
  final double price;

  OrderModel(this.url, this.name, this.state, this.date, this.stateDescription,
      this.summary, this.price);

  factory OrderModel.fromJson(Map<String, dynamic> map) {
    var url = map['url'];
    var name = map['name'];
    var state = map['state'];
    var date = map['date'];
    var stateDescription = map['state_description'];
    var summary = map['summary'];
    var price = map['price'];
    return OrderModel(url, name, state, date, stateDescription, summary, price);
  }
}
