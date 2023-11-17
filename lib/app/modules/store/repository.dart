import 'package:flutter_hortifruti/app/data/models/store.dart';
import 'package:flutter_hortifruti/app/data/provider/api.dart';

class StoreRepository {
  final Api _api;

  StoreRepository(this._api);

  Future<StoreModel> getStore(int id) => _api.getStore(id);
}
