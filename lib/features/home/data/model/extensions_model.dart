/// status : 200
/// data : [{"name":"extension test","id":3,"price":10},{"name":"Extension test 2","id":4,"price":100}]

class ExtensionsModel {
  ExtensionsModel({int? status, List<Data>? data}) {
    _status = status;
    _data = data;
  }

  ExtensionsModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  int? _status;
  List<Data>? _data;

  ExtensionsModel copyWith({int? status, List<Data>? data}) =>
      ExtensionsModel(status: status ?? _status, data: data ?? _data);

  int? get status => _status;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "extension test"
/// id : 3
/// price : 10

class Data {
  Data({String? name, int? id, int? price}) {
    _name = name;
    _id = id;
    _price = price;
  }

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
    _price = json['price'];
  }

  String? _name;
  int? _id;
  int? _price;

  Data copyWith({String? name, int? id, int? price}) =>
      Data(name: name ?? _name, id: id ?? _id, price: price ?? _price);

  String? get name => _name;

  int? get id => _id;

  int? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    map['price'] = _price;
    return map;
  }
}
