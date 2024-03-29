import 'package:clientes/models/Client.dart';
import 'package:clientes/networks/client_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/Pagination.dart';


part 'clientEvent.dart';
part 'clientState.dart';


class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final ClientNetwork _clientNetwork = ClientNetwork();

  ClientBloc() : super(ClientInitialState()) {
    on<ClientEvent>((event, emit) async {
      if (event is GetClients) {
        late List<Client> clients;
        late Pagination pagination;
        late int totalPages;

        emit(ClientLoading());
        try {
          await _clientNetwork.getClients(event.page)
            .then((value) => {
              pagination = value
            });
          clients = pagination.data;
          totalPages = pagination.totalPages;

          if (clients.length > 0) {
            emit(ClientLoaded(clients: clients, totalPages: totalPages));
            emit(ClientSuccess());
          } else {
            emit(ClientFail(response: "No se pudo obtener la lista"));
          }
        } catch(err) {
          emit(ClientFail(response: "No se pudo obtener la lista"));
        }
      }
    });
  }
}