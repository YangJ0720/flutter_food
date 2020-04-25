import 'package:event_bus/event_bus.dart';

class GlobalEvent {
  EventBus eventBus;
  factory GlobalEvent() =>_getInstance();
  static GlobalEvent get instance => _getInstance();
  static GlobalEvent _instance;
  GlobalEvent._internal() {
    eventBus = EventBus();
  }
  static GlobalEvent _getInstance() {
    if (_instance == null) {
      _instance =  GlobalEvent._internal();
    }
    return _instance;
  }
}

/// 商品价格
class ProductPriceEvent {
  final double price;

  ProductPriceEvent(this.price);
}