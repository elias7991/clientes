import 'package:dio/dio.dart';

import '../models/Pagination.dart';

final dio = Dio();

class ClientNetwork {
  late Pagination pagination;

  Future<Pagination> getClients(int page) async {
    final url = "https://reqres.in/api/users?page=$page";

    try {
      // await for response
      /* await dio.get(url)
        .then((res) => clients = clientsFromJson(res.data["data"]));*/
      await dio.get(url)
        .then((res) => pagination = paginationFromJson(res.data));


      // and then returned
      return pagination;

    } catch (err) {
      // in error cases return an empty list
      return Pagination(page: 0, data: [], perPage: 0, total: 0, totalPages: 0);
    }
  }
}