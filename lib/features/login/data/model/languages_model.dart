/// status : 200
/// data : [{"id":"ar","name":"Arabic","direction":"rtl","author":"hasanen@snono-systems.com","font":"Arial"},{"id":"en","name":"English","direction":"ltr","author":"hasanen@snono-systems.com","font":"Arial"},{"id":"pt","name":"Português","direction":"ltr","author":"renda@inforomba.net","font":"Arial"},{"id":"tr","name":"Turkish","direction":"ltr","author":"safa@teknobilgroup.com","font":"Arial"}]

class LanguagesModel {
  LanguagesModel({int? status, List<Data>? data}) {
    _status = status;
    _data = data;
  }

  LanguagesModel.fromJson(dynamic json) {
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

  LanguagesModel copyWith({int? status, List<Data>? data}) =>
      LanguagesModel(status: status ?? _status, data: data ?? _data);

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

/// id : "ar"
/// name : "Arabic"
/// direction : "rtl"
/// author : "hasanen@snono-systems.com"
/// font : "Arial"

class Data {
  Data({
    String? id,
    String? name,
    String? direction,
    String? author,
    String? font,
  }) {
    _id = id;
    _name = name;
    _direction = direction;
    _author = author;
    _font = font;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _direction = json['direction'];
    _author = json['author'];
    _font = json['font'];
  }

  String? _id;
  String? _name;
  String? _direction;
  String? _author;
  String? _font;

  Data copyWith({
    String? id,
    String? name,
    String? direction,
    String? author,
    String? font,
  }) => Data(
    id: id ?? _id,
    name: name ?? _name,
    direction: direction ?? _direction,
    author: author ?? _author,
    font: font ?? _font,
  );

  String? get id => _id;

  String? get name => _name;

  String? get direction => _direction;

  String? get author => _author;

  String? get font => _font;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['direction'] = _direction;
    map['author'] = _author;
    map['font'] = _font;
    return map;
  }
}
