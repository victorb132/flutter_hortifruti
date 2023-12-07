import 'package:flutter_hortifruti/app/data/models/city.dart';
import 'package:flutter_hortifruti/app/data/provider/api.dart';

class SelectCityRepository {
  final Api _api;

  SelectCityRepository(this._api);

  Future<List<CityModel>> getCities() => _api.getCities();
}
