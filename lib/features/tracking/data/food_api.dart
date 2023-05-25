import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class FoodAPI {
  final dio = GetIt.I.get<Dio>();
  final uri = 'https://world.openfoodfacts.org/api/v2/product/';

  // Beispiel: 4260402485034
  FutureOr<String> getFoodFromBarcode(String barcode) async {
    final result = await dio.get<String>(uri + barcode);
    log(result.data.toString());
    return '';
  }
}
