import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_appnew_version/example/bloc/app_bloc.dart';
import 'package:pharmacy_appnew_version/example/bloc/app_state.dart';
import 'package:pharmacy_appnew_version/example/model/model.dart';
import '../bloc/app_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void iniState() {
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Firebase Firestore')),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            List<ProductModel> data = state.mydata;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, index) {
                return Card(
                  child: ListTile(
                    title: Text(data[index].name),
                    trailing: Text(data[index].price),
                  ),
                );
              },
            );
          } else if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
