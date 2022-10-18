import 'package:flutter/material.dart';

class PersonScreenPage extends StatefulWidget {
  const PersonScreenPage({super.key});

  @override
  State<PersonScreenPage> createState() => _PersonScreenPageState();
}

class _PersonScreenPageState extends State<PersonScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('សេវ៉ាកម្មទំនាក់ទំនង'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  title: Text("Phone Number"),
                  subtitle: Text('+85589990000'),
                  trailing: IconButton(
                    onPressed: () {

                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
