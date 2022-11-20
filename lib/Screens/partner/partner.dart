import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew_version/models/partner/partner_model.dart';

import '../../bottom/custom_navbar.dart';

class PartnerShipPage extends StatefulWidget {
  const PartnerShipPage({super.key});

  @override
  State<PartnerShipPage> createState() => _PartnerShipPageState();
}

class _PartnerShipPageState extends State<PartnerShipPage> {
  List<String> docsId = [];
  Future<Partners?> getBranch(String docId) async {
    final docProduct =
        FirebaseFirestore.instance.collection('partner').doc(docId);
    final snapshot = await docProduct.get();
    if (snapshot.exists) {
      // return branchFromJson(snapshot.data()! as Map<String,dynamic>);
      return Partners.fromJson(snapshot.data()!);
    }
    return Partners.fromJson(snapshot.data()!);
  }

  Future getDocsID() async {
    await FirebaseFirestore.instance.collection('partner').get().then((value) {
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
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'ដៃគូរសហការណ៍',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
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
                    : buildViewProduct(partners: dataProduct as Partners);
              }
            },
          );
        },
      ),
    );
  }

  Widget buildViewProduct({Partners? partners}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CachedNetworkImage(imageUrl: partners!.partner.first.imageAsset),
          ],
        ),
      ),
    );
  }
}
