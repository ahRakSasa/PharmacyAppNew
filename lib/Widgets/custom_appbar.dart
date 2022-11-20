import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/favourite/favourite_page.dart';
import 'package:pharmacy_appnew_version/profile/edit_acc.dart';

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
      backgroundColor: Colors.white,
      elevation: 0,
      title: Image(
        image: AssetImage('assets/images1/company_logo.png'),
        height: 100,
        width: 200,
      ),
      iconTheme: IconThemeData(
        color: Colors.green,
        size: 30,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            )),
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return FavouritePage();
              },
            ));
          },
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ProfilePage();
              },
            ));
          },
          icon: Image(image: AssetImage('assets/images1/person_logo.png')),
        ),
      ],
    );
  }
}
