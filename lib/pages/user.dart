import 'package:first/data/datasource/remote_data.dart';
import 'package:first/pages/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(remoteUser: RemoteUser())..add(LoadUser()),
      child: Scaffold(
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              final user = state.users;
              return ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(user[index].avatar)),
                      title: Text(
                          '${user[index].firstName} ${user[index].lastName}'),
                      subtitle: Text(user[index].email),
                    ),
                  );
                },
              );
            } else if (state is UserError) {
              return Center(
                child: Text(state.error),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
