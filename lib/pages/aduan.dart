import 'package:first/data/datasource/remote_data.dart';
import 'package:first/pages/bloc/aduan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/getwidget.dart';

class AduanPage extends StatelessWidget {
  const AduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AduanBloc(remoteAduan: RemoteAduan())..add(LoadAduan()),
      child: Scaffold(
        body: BlocBuilder<AduanBloc, AduanState>(
          builder: (context, state) {
            if (state is AduanLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AduanLoaded) {
              final aduan = state.aduans;
              return ListView.builder(
                itemCount: aduan.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.account_circle_rounded, size: 45,),
                      title: Text(aduan[index].judulKeluhan),
                      subtitle: Text(aduan[index].kategori),
                    ),
                  );
                },
              );
            } else if (state is AduanError) {
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
