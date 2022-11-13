import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 226, 226),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'សេវ៉ាកម្មទំនាក់ទំនង',
            style: TextStyle(color: Colors.green),
          ),
          iconTheme: IconThemeData(
            color: Colors.green,
            size: 30,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images1/boss1.jpgss'),
                  ),
                  title: Text("Phone Number"),
                  subtitle: Text('089990000'),
                  trailing: IconButton(
                    onPressed: () {
                      launch('tel:+85561860119');
                    },
                    icon: Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        'https://o.remove.bg/downloads/6a42eb6f-5a6d-484f-92f8-bd0d1f6ac3b1/image-removebg-preview.png'),
                  ),
                  title: Text("Telegram"),
                  subtitle: Text('https://t.me/joinchat/oUOz_1MYw8MyMWM9'),
                  trailing: IconButton(
                    onPressed: () {
                      launch('https://t.me/joinchat/oUOz_1MYw8MyMWM9');
                    },
                    icon: Icon(
                      Icons.telegram,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images1/boss1.jpgss'),
                  ),
                  title: Text("Email"),
                  subtitle: Text('sorsampisith@gmail.com'),
                  trailing: IconButton(
                    onPressed: () {
                      launch(
                          'mailto:sorsampisith@gmail.com?subject=This is Subject Title&body=This is Body of Email');
                    },
                    icon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        'https://o.remove.bg/downloads/1b49cb7d-2727-43d3-9c24-63c9201ee1f9/image-removebg-preview.png'),
                  ),
                  title: Text("FaceBook"),
                  subtitle: Text('ឱសថស្ថានយើង - Our Pharmacy'),
                  trailing: IconButton(
                    onPressed: () {
                      launch(
                          'https://www.facebook.com/search/top?q=%E1%9E%B1%E1%9E%9F%E1%9E%90%E1%9E%9F%E1%9F%92%E1%9E%90%E1%9E%B6%E1%9E%93%E1%9E%99%E1%9E%BE%E1%9E%84%20-%20our%20pharmacy');
                    },
                    icon: Icon(
                      Icons.facebook_outlined,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
