import 'package:clientes/providers/login_provider.dart';
import 'package:clientes/screens/home.dart';
import 'package:clientes/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'blocs/clients_bloc/clientBloc.dart';

void main() {
  runApp(
    // define the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider(),),
      ],
      // define the bloc providers
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ClientBloc>(
            create: (BuildContext context) => ClientBloc(),
          ),
        ],
        child: const MyApp()
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPrincipalPage(),
    );
  }

}

class MyPrincipalPage extends StatefulWidget {
  const MyPrincipalPage({ super.key });

  @override
  State<MyPrincipalPage> createState() => _MyPrincipalPage();

}

class _MyPrincipalPage extends State<MyPrincipalPage> {
  late LoginProvider _loginProvider;

  @override
  void initState() {
    _loginProvider = Provider.of<LoginProvider>(context, listen: false);
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return _loginProvider.user.isLogged ? const Home() : const Login() ;
  }
}

