import 'package:flutter_hortifruti/app/data/models/store.dart';
import 'package:flutter_hortifruti/app/data/provider/api.dart';

class HomeRepository {
  final Api _api;

  HomeRepository(this._api);

  Future<List<StoreModel>> getStores() => _api.getStores();
}
