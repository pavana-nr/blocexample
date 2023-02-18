import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:providerexample/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:providerexample/presentation/bloc/user_bloc/user_event.dart';

import '../../data/models/user_models/user_model.dart';
import '../bloc/user_bloc/user_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<User>? userList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<UserBloc>(context).add(FetchUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('User List')),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserLoadedState) {
            return ListView.builder(
                itemCount: state.data == null ? 0 : state.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: const Icon(Icons.list),
                      trailing: Text(
                        state.data![index].email ?? '',
                        style:
                            const TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text(
                        state.data![index].name ?? '',
                      ));
                });
          }
          if (state is UserError) {
            return Center(
              child: Text(state.e.toString()),
            );
          }
          return const Center(child: CircularProgressIndicator());
        }));
  }
}
