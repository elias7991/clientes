import 'package:dio/dio.dart';
import 'package:clientes/models/Client.dart';

final dio = Dio();

class ClientNetwork {
  late List<Client> clients;

  Future<List<Client>> getClients(int page) async {
    final url = "https://reqres.in/api/users?page=$page";

    try {
      // await for response
      await dio.get(url)
        .then((res) => clients = clientsFromJson(res.data["data"]));



      // and then returned
      return clients;

    } catch (err) {
      // in error cases return an empty list
      return [];
    }
  }
}