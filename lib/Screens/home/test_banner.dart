import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestDetail extends StatefulWidget {
  const TestDetail({super.key});

  @override
  State<TestDetail> createState() => _TestDetailState();
}

class _TestDetailState extends State<TestDetail> {
  List<String> docId = [];

  final CollectionReference _banner =
      FirebaseFirestore.instance.collection('banner');
  getProducDetail() async {
    await FirebaseFirestore.instance.collection('banner').get().then((value) {
      value.docs.forEach((element) {
        docId.add(element.reference.id);
        print('productDocsID:${element.reference.id}');
      });
    });
  }

  var firedata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    firedata = getProducDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test get Product'),
      ),
      body: FutureBuilder(
        future: firedata,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Icon(
                Icons.info,
                size: 30,
                color: Colors.red,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: docId.length,
            itemBuilder: (context, index) {
              return StudentWidget(documentId: docId[index]);
            },
          );
        },
      ),
    );
  }
}

class StudentWidget extends StatelessWidget {
  StudentWidget({Key? key, required this.documentId}) : super(key: key);
  String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference stu = FirebaseFirestore.instance.collection('banner');
    return FutureBuilder<DocumentSnapshot>(
      future: stu.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return InkWell(
            onTap: () async {},
            child: Card(
              color: Color.fromARGB(255, 241, 215, 213),
              child: ListTile(
                title: Text(data['title'].toString()),
              ),
            ),
          );
        }
        return ListTile(
          title: Text('Loading....'),
        );
      },
    );
  }
}
