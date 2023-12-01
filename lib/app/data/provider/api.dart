import 'dart:convert';

import 'package:flutter_hortifruti/app/data/models/address.dart';
import 'package:flutter_hortifruti/app/data/models/city.dart';
import 'package:flutter_hortifruti/app/data/models/order_request.dart';
import 'package:flutter_hortifruti/app/data/models/store.dart';
import 'package:flutter_hortifruti/app/data/models/user.dart';
import 'package:flutter_hortifruti/app/data/models/user_address_request.dart';
import 'package:flutter_hortifruti/app/data/models/user_login_request.dart';
import 'package:flutter_hortifruti/app/data/models/user_login_response.dart';
import 'package:flutter_hortifruti/app/data/services/config/storage/service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Api extends GetConnect {
  final _storageService = Get.find<StorageService>();

  @override
  void onInit() {
    httpClient.baseUrl = 'http://127.0.0.1:3333';

    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });

    httpClient.addAuthenticator((Request request) {
      final token = _storageService.token;
      final headers = {
        'Authorization': 'Bearer $token',
      };

      request.headers.addAll(headers);

      return request;
    });

    super.onInit();
  }

  Future<List<CityModel>> getCities() async {
    final response = _errorHandler(await get('/cidades'));

    List<CityModel> data = [];

    for (final city in response.body) {
      data.add(CityModel.fromJson(city));
    }

    return data;
  }

  Future<void> postAddress(UserAddressRequestModel data) async {
    final response = _errorHandler(await post('/enderecos', jsonEncode(data)));

    return response.body;
  }

  Future<List<StoreModel>> getStores() async {
    final response = _errorHandler(await get('/cidades/1/estabelecimentos'));

    List<StoreModel> data = [];

    for (final store in response.body) {
      data.add(StoreModel.fromJson(store));
    }

    return data;
  }

  Future<UserLoginResponseModel> login(UserLoginRequestModel data) async {
    final response = _errorHandler(await post('/login', jsonEncode(data)));

    return UserLoginResponseModel.fromJson(response.body);
  }

  Future<UserModel> getUser() async {
    final response = _errorHandler(await get('/auth/me'));
    return UserModel.fromJson(response.body);
  }

  Future<List<AddressModel>> getUserAddresses() async {
    final response = _errorHandler(await get('/enderecos'));

    List<AddressModel> data = [];

    for (final address in response.body) {
      data.add(AddressModel.fromJson(address));
    }

    return data;
  }

  Future<StoreModel> getStore(int id) async {
    final response = _errorHandler(await get('/estabelecimentos/$id'));

    return StoreModel.fromJson(response.body);
  }

  Future postOrder(OrderRequestModel data) async {
    _errorHandler(await post('/pedidos', jsonEncode(data)));
  }

  Response _errorHandler(Response response) {
    print(response.bodyString);

    switch (response.statusCode) {
      case 200:
      case 202:
      case 204:
        return response;
      default:
        throw 'Ocorreu um erro aqui';
    }
  }
}
