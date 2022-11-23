class Sitie{
  var _id;
  var _name;

  get id => _id;

  set id(value) {
    _id = value;
  }

  var _city;
  var _depart;
  var _temp;
  var _descr;
  var _rating;

  Sitie(this._id, this._name, this._city, this._depart, this._temp, this._descr,
      this._rating);

  Sitie.fromJson(Map <String,dynamic> json)
      :_id=json['id'],
        _name=json['name'],
        _city=json['city'],
        _depart=json['depart'],
        _temp=json['temp'],
        _descr=json['descr'],
        _rating=json['rating'];

  Map<String, dynamic> ToJson() => {
    'id': _id,
    'name': _name,
    'city': _city,
    'depart': _depart,
    'temp': _temp,
    'descr': _descr,
    'rating': _rating,
  };

  get name => _name;

  set name(value) {
    _name = value;
  }

  get city => _city;

  set city(value) {
    _city = value;
  }

  get depart => _depart;

  set depart(value) {
    _depart = value;
  }

  get temp => _temp;

  set temp(value) {
    _temp = value;
  }

  get descr => _descr;

  set descr(value) {
    _descr = value;
  }

  get rating => _rating;

  set rating(value) {
    _rating = value;
  }
}
