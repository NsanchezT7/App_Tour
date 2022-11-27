/// results : [{"datasource":{"sourcename":"openstreetmap","attribution":"© OpenStreetMap contributors","license":"Open Database License","url":"https://www.openstreetmap.org/copyright"},"name":"Hospital Universitário","housenumber":"2565","street":"Avenida Professor Lineu Prestes","suburb":"Butantã","district":"Butantã","city":"São Paulo","county":"Região Metropolitana de São Paulo","state":"São Paulo","postcode":"05508-000","country":"Brazil","country_code":"br","lon":-46.74095019191067,"lat":-23.56491995,"state_code":"SP","formatted":"Hospital Universitário, Avenida Professor Lineu Prestes 2565, Butantã, São Paulo - SP, 05508-000, Brazil","address_line1":"Hospital Universitário","address_line2":"Avenida Professor Lineu Prestes 2565, Butantã, São Paulo - SP, 05508-000, Brazil","category":"healthcare.hospital","timezone":{"name":"America/Sao_Paulo","offset_STD":"-03:00","offset_STD_seconds":-10800,"offset_DST":"-03:00","offset_DST_seconds":-10800},"result_type":"amenity","rank":{"importance":0.521335061990991,"popularity":6.693641490876697,"confidence":1,"match_type":"match_by_building"},"place_id":"51521cb574d75e47c059a31b06989e9037c0f00102f901e8eb760900000000c00201920317486f73706974616c20556e69766572736974c3a172696f","bbox":{"lon1":-46.7426016,"lat1":-23.5658343,"lon2":-46.7397181,"lat2":-23.5636028}},{"datasource":{"sourcename":"openstreetmap","attribution":"© OpenStreetMap contributors","license":"Open Database License","url":"https://www.openstreetmap.org/copyright"},"name":"Hospital Universitario","street":"Avenida Islas Baleares","suburb":"Barriada de los Ríos","city":"Burgos","county":"Burgos","state":"Castile and León","postcode":"09005","country":"Spain","country_code":"es","lon":-3.685955,"lat":42.3603982,"formatted":"Hospital Universitario, Avenida Islas Baleares, 09005 Burgos, Spain","address_line1":"Hospital Universitario","address_line2":"Avenida Islas Baleares, 09005 Burgos, Spain","county_code":"BU","category":"service.taxi","timezone":{"name":"Europe/Madrid","offset_STD":"+01:00","offset_STD_seconds":3600,"offset_DST":"+02:00","offset_DST_seconds":7200,"abbreviation_STD":"CET","abbreviation_DST":"CEST"},"result_type":"amenity","rank":{"importance":0.201,"popularity":6.135861046118314,"confidence":1,"match_type":"match_by_building"},"place_id":"51b0389cf9d57c0dc059c5443987212e4540f00103f90101e43b6800000000c00201920316486f73706974616c20556e697665727369746172696f","bbox":{"lon1":-3.686005,"lat1":42.3603482,"lon2":-3.685905,"lat2":42.3604482}},{"datasource":{"sourcename":"openstreetmap","attribution":"© OpenStreetMap contributors","license":"Open Database License","url":"https://www.openstreetmap.org/copyright"},"name":"Hospital Universitario","street":"Avenida Islas Baleares","suburb":"Barriada de los Ríos","city":"Burgos","county":"Burgos","state":"Castile and León","postcode":"09005","country":"Spain","country_code":"es","lon":-3.6851823,"lat":42.361034,"formatted":"Hospital Universitario, Avenida Islas Baleares, 09005 Burgos, Spain","address_line1":"Hospital Universitario","address_line2":"Avenida Islas Baleares, 09005 Burgos, Spain","county_code":"BU","category":"public_transport.bus","timezone":{"name":"Europe/Madrid","offset_STD":"+01:00","offset_STD_seconds":3600,"offset_DST":"+02:00","offset_DST_seconds":7200,"abbreviation_STD":"CET","abbreviation_DST":"CEST"},"result_type":"amenity","rank":{"importance":0.201,"popularity":6.25402773151819,"confidence":1,"match_type":"match_by_building"},"place_id":"516e6292db407b0dc0593d5fb35c362e4540f00103f901cfa9809800000000c00201920316486f73706974616c20556e697665727369746172696f","bbox":{"lon1":-3.6852323,"lat1":42.360984,"lon2":-3.6851323,"lat2":42.361084}},{"datasource":{"sourcename":"openstreetmap","attribution":"© OpenStreetMap contributors","license":"Open Database License","url":"https://www.openstreetmap.org/copyright"},"name":"University Hospital","street":"Al Lowa' Hassn Kamel Street","city":"Al-Khamisa","state":"Asyut","postcode":"71516","country":"Egypt","country_code":"eg","lon":31.16571814973242,"lat":27.1847893,"formatted":"University Hospital, Al Lowa' Hassn Kamel Street, Al-Khamisa, 71516, Egypt","address_line1":"University Hospital","address_line2":"Al Lowa' Hassn Kamel Street, Al-Khamisa, 71516, Egypt","category":"building","timezone":{"name":"Africa/Cairo","offset_STD":"+02:00","offset_STD_seconds":7200,"offset_DST":"+02:00","offset_DST_seconds":7200,"abbreviation_STD":"EET","abbreviation_DST":"EET"},"result_type":"amenity","rank":{"importance":0.101,"popularity":1.0038976168243137,"confidence":1,"match_type":"match_by_building"},"place_id":"51527431816c2a3f40599626005a4e2f3b40f00101f9018364150000000000c00201920313556e697665727369747920486f73706974616c","bbox":{"lon1":31.1652344,"lat1":27.1839056,"lon2":31.1679877,"lat2":27.1856757}}]
/// query : {"text":"","parsed":{"house":"hospital universitario","expected_type":"unknown"}}

class Result {
  Result({
      List<Results>? results, 
      Query? query,}){
    _results = results;
    _query = query;
}

  Result.fromJson(dynamic json) {
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
    _query = json['query'] != null ? Query.fromJson(json['query']) : null;
  }
  List<Results>? _results;
  Query? _query;
Result copyWith({  List<Results>? results,
  Query? query,
}) => Result(  results: results ?? _results,
  query: query ?? _query,
);
  List<Results>? get results => _results;
  Query? get query => _query;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    if (_query != null) {
      map['query'] = _query?.toJson();
    }
    return map;
  }

}

/// text : ""
/// parsed : {"house":"hospital universitario","expected_type":"unknown"}

class Query {
  Query({
      String? text, 
      Parsed? parsed,}){
    _text = text;
    _parsed = parsed;
}

  Query.fromJson(dynamic json) {
    _text = json['text'];
    _parsed = json['parsed'] != null ? Parsed.fromJson(json['parsed']) : null;
  }
  String? _text;
  Parsed? _parsed;
Query copyWith({  String? text,
  Parsed? parsed,
}) => Query(  text: text ?? _text,
  parsed: parsed ?? _parsed,
);
  String? get text => _text;
  Parsed? get parsed => _parsed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    if (_parsed != null) {
      map['parsed'] = _parsed?.toJson();
    }
    return map;
  }

}

/// house : "hospital universitario"
/// expected_type : "unknown"

class Parsed {
  Parsed({
      String? house, 
      String? expectedType,}){
    _house = house;
    _expectedType = expectedType;
}

  Parsed.fromJson(dynamic json) {
    _house = json['house'];
    _expectedType = json['expected_type'];
  }
  String? _house;
  String? _expectedType;
Parsed copyWith({  String? house,
  String? expectedType,
}) => Parsed(  house: house ?? _house,
  expectedType: expectedType ?? _expectedType,
);
  String? get house => _house;
  String? get expectedType => _expectedType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['house'] = _house;
    map['expected_type'] = _expectedType;
    return map;
  }

}

/// datasource : {"sourcename":"openstreetmap","attribution":"© OpenStreetMap contributors","license":"Open Database License","url":"https://www.openstreetmap.org/copyright"}
/// name : "Hospital Universitário"
/// housenumber : "2565"
/// street : "Avenida Professor Lineu Prestes"
/// suburb : "Butantã"
/// district : "Butantã"
/// city : "São Paulo"
/// county : "Região Metropolitana de São Paulo"
/// state : "São Paulo"
/// postcode : "05508-000"
/// country : "Brazil"
/// country_code : "br"
/// lon : -46.74095019191067
/// lat : -23.56491995
/// state_code : "SP"
/// formatted : "Hospital Universitário, Avenida Professor Lineu Prestes 2565, Butantã, São Paulo - SP, 05508-000, Brazil"
/// address_line1 : "Hospital Universitário"
/// address_line2 : "Avenida Professor Lineu Prestes 2565, Butantã, São Paulo - SP, 05508-000, Brazil"
/// category : "healthcare.hospital"
/// timezone : {"name":"America/Sao_Paulo","offset_STD":"-03:00","offset_STD_seconds":-10800,"offset_DST":"-03:00","offset_DST_seconds":-10800}
/// result_type : "amenity"
/// rank : {"importance":0.521335061990991,"popularity":6.693641490876697,"confidence":1,"match_type":"match_by_building"}
/// place_id : "51521cb574d75e47c059a31b06989e9037c0f00102f901e8eb760900000000c00201920317486f73706974616c20556e69766572736974c3a172696f"
/// bbox : {"lon1":-46.7426016,"lat1":-23.5658343,"lon2":-46.7397181,"lat2":-23.5636028}

class Results {
  Results({
      Datasource? datasource, 
      String? name, 
      String? housenumber, 
      String? street, 
      String? suburb, 
      String? district, 
      String? city, 
      String? county, 
      String? state, 
      String? postcode, 
      String? country, 
      String? countryCode, 
      num? lon, 
      num? lat, 
      String? stateCode, 
      String? formatted, 
      String? addressLine1, 
      String? addressLine2, 
      String? category, 
      Timezone? timezone, 
      String? resultType, 
      Rank? rank, 
      String? placeId, 
      Bbox? bbox,}){
    _datasource = datasource;
    _name = name;
    _housenumber = housenumber;
    _street = street;
    _suburb = suburb;
    _district = district;
    _city = city;
    _county = county;
    _state = state;
    _postcode = postcode;
    _country = country;
    _countryCode = countryCode;
    _lon = lon;
    _lat = lat;
    _stateCode = stateCode;
    _formatted = formatted;
    _addressLine1 = addressLine1;
    _addressLine2 = addressLine2;
    _category = category;
    _timezone = timezone;
    _resultType = resultType;
    _rank = rank;
    _placeId = placeId;
    _bbox = bbox;
}

  Results.fromJson(dynamic json) {
    _datasource = json['datasource'] != null ? Datasource.fromJson(json['datasource']) : null;
    _name = json['name'];
    _housenumber = json['housenumber'];
    _street = json['street'];
    _suburb = json['suburb'];
    _district = json['district'];
    _city = json['city'];
    _county = json['county'];
    _state = json['state'];
    _postcode = json['postcode'];
    _country = json['country'];
    _countryCode = json['country_code'];
    _lon = json['lon'];
    _lat = json['lat'];
    _stateCode = json['state_code'];
    _formatted = json['formatted'];
    _addressLine1 = json['address_line1'];
    _addressLine2 = json['address_line2'];
    _category = json['category'];
    _timezone = json['timezone'] != null ? Timezone.fromJson(json['timezone']) : null;
    _resultType = json['result_type'];
    _rank = json['rank'] != null ? Rank.fromJson(json['rank']) : null;
    _placeId = json['place_id'];
    _bbox = json['bbox'] != null ? Bbox.fromJson(json['bbox']) : null;
  }
  Datasource? _datasource;
  String? _name;
  String? _housenumber;
  String? _street;
  String? _suburb;
  String? _district;
  String? _city;
  String? _county;
  String? _state;
  String? _postcode;
  String? _country;
  String? _countryCode;
  num? _lon;
  num? _lat;
  String? _stateCode;
  String? _formatted;
  String? _addressLine1;
  String? _addressLine2;
  String? _category;
  Timezone? _timezone;
  String? _resultType;
  Rank? _rank;
  String? _placeId;
  Bbox? _bbox;
Results copyWith({  Datasource? datasource,
  String? name,
  String? housenumber,
  String? street,
  String? suburb,
  String? district,
  String? city,
  String? county,
  String? state,
  String? postcode,
  String? country,
  String? countryCode,
  num? lon,
  num? lat,
  String? stateCode,
  String? formatted,
  String? addressLine1,
  String? addressLine2,
  String? category,
  Timezone? timezone,
  String? resultType,
  Rank? rank,
  String? placeId,
  Bbox? bbox,
}) => Results(  datasource: datasource ?? _datasource,
  name: name ?? _name,
  housenumber: housenumber ?? _housenumber,
  street: street ?? _street,
  suburb: suburb ?? _suburb,
  district: district ?? _district,
  city: city ?? _city,
  county: county ?? _county,
  state: state ?? _state,
  postcode: postcode ?? _postcode,
  country: country ?? _country,
  countryCode: countryCode ?? _countryCode,
  lon: lon ?? _lon,
  lat: lat ?? _lat,
  stateCode: stateCode ?? _stateCode,
  formatted: formatted ?? _formatted,
  addressLine1: addressLine1 ?? _addressLine1,
  addressLine2: addressLine2 ?? _addressLine2,
  category: category ?? _category,
  timezone: timezone ?? _timezone,
  resultType: resultType ?? _resultType,
  rank: rank ?? _rank,
  placeId: placeId ?? _placeId,
  bbox: bbox ?? _bbox,
);
  Datasource? get datasource => _datasource;
  String? get name => _name;
  String? get housenumber => _housenumber;
  String? get street => _street;
  String? get suburb => _suburb;
  String? get district => _district;
  String? get city => _city;
  String? get county => _county;
  String? get state => _state;
  String? get postcode => _postcode;
  String? get country => _country;
  String? get countryCode => _countryCode;
  num? get lon => _lon;
  num? get lat => _lat;
  String? get stateCode => _stateCode;
  String? get formatted => _formatted;
  String? get addressLine1 => _addressLine1;
  String? get addressLine2 => _addressLine2;
  String? get category => _category;
  Timezone? get timezone => _timezone;
  String? get resultType => _resultType;
  Rank? get rank => _rank;
  String? get placeId => _placeId;
  Bbox? get bbox => _bbox;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_datasource != null) {
      map['datasource'] = _datasource?.toJson();
    }
    map['name'] = _name;
    map['housenumber'] = _housenumber;
    map['street'] = _street;
    map['suburb'] = _suburb;
    map['district'] = _district;
    map['city'] = _city;
    map['county'] = _county;
    map['state'] = _state;
    map['postcode'] = _postcode;
    map['country'] = _country;
    map['country_code'] = _countryCode;
    map['lon'] = _lon;
    map['lat'] = _lat;
    map['state_code'] = _stateCode;
    map['formatted'] = _formatted;
    map['address_line1'] = _addressLine1;
    map['address_line2'] = _addressLine2;
    map['category'] = _category;
    if (_timezone != null) {
      map['timezone'] = _timezone?.toJson();
    }
    map['result_type'] = _resultType;
    if (_rank != null) {
      map['rank'] = _rank?.toJson();
    }
    map['place_id'] = _placeId;
    if (_bbox != null) {
      map['bbox'] = _bbox?.toJson();
    }
    return map;
  }

}

/// lon1 : -46.7426016
/// lat1 : -23.5658343
/// lon2 : -46.7397181
/// lat2 : -23.5636028

class Bbox {
  Bbox({
      num? lon1, 
      num? lat1, 
      num? lon2, 
      num? lat2,}){
    _lon1 = lon1;
    _lat1 = lat1;
    _lon2 = lon2;
    _lat2 = lat2;
}

  Bbox.fromJson(dynamic json) {
    _lon1 = json['lon1'];
    _lat1 = json['lat1'];
    _lon2 = json['lon2'];
    _lat2 = json['lat2'];
  }
  num? _lon1;
  num? _lat1;
  num? _lon2;
  num? _lat2;
Bbox copyWith({  num? lon1,
  num? lat1,
  num? lon2,
  num? lat2,
}) => Bbox(  lon1: lon1 ?? _lon1,
  lat1: lat1 ?? _lat1,
  lon2: lon2 ?? _lon2,
  lat2: lat2 ?? _lat2,
);
  num? get lon1 => _lon1;
  num? get lat1 => _lat1;
  num? get lon2 => _lon2;
  num? get lat2 => _lat2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon1'] = _lon1;
    map['lat1'] = _lat1;
    map['lon2'] = _lon2;
    map['lat2'] = _lat2;
    return map;
  }

}

/// importance : 0.521335061990991
/// popularity : 6.693641490876697
/// confidence : 1
/// match_type : "match_by_building"

class Rank {
  Rank({
      num? importance, 
      num? popularity, 
      num? confidence, 
      String? matchType,}){
    _importance = importance;
    _popularity = popularity;
    _confidence = confidence;
    _matchType = matchType;
}

  Rank.fromJson(dynamic json) {
    _importance = json['importance'];
    _popularity = json['popularity'];
    _confidence = json['confidence'];
    _matchType = json['match_type'];
  }
  num? _importance;
  num? _popularity;
  num? _confidence;
  String? _matchType;
Rank copyWith({  num? importance,
  num? popularity,
  num? confidence,
  String? matchType,
}) => Rank(  importance: importance ?? _importance,
  popularity: popularity ?? _popularity,
  confidence: confidence ?? _confidence,
  matchType: matchType ?? _matchType,
);
  num? get importance => _importance;
  num? get popularity => _popularity;
  num? get confidence => _confidence;
  String? get matchType => _matchType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['importance'] = _importance;
    map['popularity'] = _popularity;
    map['confidence'] = _confidence;
    map['match_type'] = _matchType;
    return map;
  }

}

/// name : "America/Sao_Paulo"
/// offset_STD : "-03:00"
/// offset_STD_seconds : -10800
/// offset_DST : "-03:00"
/// offset_DST_seconds : -10800

class Timezone {
  Timezone({
      String? name, 
      String? offsetSTD, 
      num? offsetSTDSeconds, 
      String? offsetDST, 
      num? offsetDSTSeconds,}){
    _name = name;
    _offsetSTD = offsetSTD;
    _offsetSTDSeconds = offsetSTDSeconds;
    _offsetDST = offsetDST;
    _offsetDSTSeconds = offsetDSTSeconds;
}

  Timezone.fromJson(dynamic json) {
    _name = json['name'];
    _offsetSTD = json['offset_STD'];
    _offsetSTDSeconds = json['offset_STD_seconds'];
    _offsetDST = json['offset_DST'];
    _offsetDSTSeconds = json['offset_DST_seconds'];
  }
  String? _name;
  String? _offsetSTD;
  num? _offsetSTDSeconds;
  String? _offsetDST;
  num? _offsetDSTSeconds;
Timezone copyWith({  String? name,
  String? offsetSTD,
  num? offsetSTDSeconds,
  String? offsetDST,
  num? offsetDSTSeconds,
}) => Timezone(  name: name ?? _name,
  offsetSTD: offsetSTD ?? _offsetSTD,
  offsetSTDSeconds: offsetSTDSeconds ?? _offsetSTDSeconds,
  offsetDST: offsetDST ?? _offsetDST,
  offsetDSTSeconds: offsetDSTSeconds ?? _offsetDSTSeconds,
);
  String? get name => _name;
  String? get offsetSTD => _offsetSTD;
  num? get offsetSTDSeconds => _offsetSTDSeconds;
  String? get offsetDST => _offsetDST;
  num? get offsetDSTSeconds => _offsetDSTSeconds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['offset_STD'] = _offsetSTD;
    map['offset_STD_seconds'] = _offsetSTDSeconds;
    map['offset_DST'] = _offsetDST;
    map['offset_DST_seconds'] = _offsetDSTSeconds;
    return map;
  }

}

/// sourcename : "openstreetmap"
/// attribution : "© OpenStreetMap contributors"
/// license : "Open Database License"
/// url : "https://www.openstreetmap.org/copyright"

class Datasource {
  Datasource({
      String? sourcename, 
      String? attribution, 
      String? license, 
      String? url,}){
    _sourcename = sourcename;
    _attribution = attribution;
    _license = license;
    _url = url;
}

  Datasource.fromJson(dynamic json) {
    _sourcename = json['sourcename'];
    _attribution = json['attribution'];
    _license = json['license'];
    _url = json['url'];
  }
  String? _sourcename;
  String? _attribution;
  String? _license;
  String? _url;
Datasource copyWith({  String? sourcename,
  String? attribution,
  String? license,
  String? url,
}) => Datasource(  sourcename: sourcename ?? _sourcename,
  attribution: attribution ?? _attribution,
  license: license ?? _license,
  url: url ?? _url,
);
  String? get sourcename => _sourcename;
  String? get attribution => _attribution;
  String? get license => _license;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sourcename'] = _sourcename;
    map['attribution'] = _attribution;
    map['license'] = _license;
    map['url'] = _url;
    return map;
  }

}