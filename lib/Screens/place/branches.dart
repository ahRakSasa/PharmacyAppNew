import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/bottom/bottom_until.dart';
import 'package:pharmacy_appnew_version/models/branches/branch_model.dart';

import '../../bottom/custom_navbar.dart';

class BranchScreen extends StatefulWidget {
  const BranchScreen({super.key});

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  int index = 3;
  List<String> docsId = [];
  Future<Branch?> getBranch(String docId) async {
    final docProduct =
        FirebaseFirestore.instance.collection('branch').doc(docId);
    final snapshot = await docProduct.get();
    if (snapshot.exists) {
      // return branchFromJson(snapshot.data()! as Map<String,dynamic>);
      return Branch.fromJson(snapshot.data()!);
    }
    return Branch.fromJson(snapshot.data()!);
  }

  Future getDocsID() async {
    await FirebaseFirestore.instance.collection('branch').get().then((value) {
      value.docs.forEach((DocumentSnapshot document) {
        setState(() {
          docsId.add(document.reference.id);
        });
      });
    });
  }

  var temDocsId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temDocsId = getDocsID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'សាខា',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context, 3),
      body: ListView.builder(
        itemCount: docsId.length,
        itemBuilder: (context, index) {
          return FutureBuilder(
            future: getBranch(docsId[index]),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('wrong'),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                final dataProduct = snapshot.data!;
                return dataProduct == null
                    ? const Center(
                        child: Text('No Products'),
                      )
                    : buildViewProduct(branch1: dataProduct as Branch);
              }
            },
          );
        },
      ),
    );
  }

  Widget buildViewProduct({Branch? branch1}) {
    return Container(
      width: 200,
      height: 350,
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CachedNetworkImage(imageUrl: branch1!.branch.first.imageAsset),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(branch1.branch.first.address),
                    Text(branch1.branch.first.phoneNum),
                    Text(branch1.branch.first.province),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      branch1.branch.first.googleAddress;
                    },
                    icon: Icon(Icons.place))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
