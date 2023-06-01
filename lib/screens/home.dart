import 'package:clientes/blocs/clients_bloc/clientBloc.dart';
import 'package:clientes/widgets/client_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../main.dart';
import '../models/Client.dart';
import '../providers/login_provider.dart';
import '../utils/helpers.dart';

class Home extends StatefulWidget {
  const Home({ super.key });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late LoginProvider _loginProvider;
  int page = 1;
  int totalPages = 0;
  List<Client> clients = [];
  //controller for smartRefresh to pull and get more clients
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final ScrollController _scrollController = ScrollController();

  @override
  // this executed at the start
  void initState() {
    // GetClients event trigger
    BlocProvider.of<ClientBloc>(context).add(GetClients(page: page));
    // obtain the user logged
    _loginProvider = Provider.of<LoginProvider>(context, listen: false);
    super.initState();
  }

  // this executed at the end
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // return an empty string if the property is not found
        title: Text('Bienvenido/a ${_loginProvider.user.username}'),
        // right button
        actions: [
          IconButton(
            onPressed: () {
              // logic to logout
              _loginProvider.setUser(isLogged: false, username: "");
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyApp()
                ),
                (route) => false
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocListener<ClientBloc, ClientState>(
          listener: (context, state) {
            if (state is ClientFail) {
              // emit snackbar
              showMessage(
                context: context,
                message: state.response,
                action: ActionStatus.fail
              );
            } else if (state is ClientLoaded) {
              setState(() {
                totalPages = state.totalPages;
                if (page == 1) {
                  clients = state.clients;
                } else {
                  clients = [...clients, ...state.clients];
                }
              });
            }
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              // screen height
              height: MediaQuery.of(context).size.height,
              child: BlocBuilder<ClientBloc, ClientState>(
                builder: (context, state) {
                  if (state is ClientLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ClientSuccess) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Column(
                        children: [
                          Expanded(
                            child: SmartRefresher(
                              // header refresh
                              enablePullDown: true,
                              // footer refresh
                              enablePullUp: true,
                              onRefresh: () {
                                setState(() {
                                  page = 1;
                                  BlocProvider.of<ClientBloc>(context).add(GetClients(page: page));
                                });

                              },
                              onLoading: () {
                                if (page < totalPages) {
                                  setState(() {
                                    page++;
                                    BlocProvider.of<ClientBloc>(context).add(GetClients(page: page));
                                  });
                                }
                              },
                              controller: _refreshController,
                              child: ListView.separated(
                                separatorBuilder: (BuildContext context, int index) => const Divider(),
                                itemCount: clients.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return clientProfile(context, clients[index]);
                                },
                              ),
                            ),
                          )
                        ],
                      )
                    );
                  } else return Container();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

}