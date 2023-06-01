import 'package:clientes/models/Client.dart';

Pagination paginationFromJson(dynamic str) => Pagination.fromJson((str));

class Pagination {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<Client> data;

  Pagination({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    page: json["page"],
    perPage: json["per_page"],
    total: json["total"],
    totalPages: json["total_pages"],
    data: clientsFromJson(json["data"]),
  );
}

