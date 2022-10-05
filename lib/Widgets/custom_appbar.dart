import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomAppBarPage extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBarPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBarPage> createState() => _CustomAppBarPageState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}

class _CustomAppBarPageState extends State<CustomAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 0,
      title: Container(
        //color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          'Our Pharmacy',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.white),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ))
      ],
    );
  }
}
