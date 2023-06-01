part of 'clientBloc.dart';

@immutable
abstract class ClientState {}

class ClientInitialState extends ClientState {}

class ClientLoading extends ClientState {}

class ClientFail extends ClientState {
  final String response;
  ClientFail({ required this.response });
}

class ClientLoaded extends ClientState {
  final List<Client> clients;
  final int totalPages;
  ClientLoaded({ required this.clients, required this.totalPages });
}

class ClientSuccess extends ClientState {}