part of 'clientBloc.dart';


@immutable
abstract class ClientEvent {}

class GetClients extends ClientEvent {
  final int page;
  GetClients({ required this.page });
}

