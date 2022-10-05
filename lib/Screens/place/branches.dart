import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BranchPage extends StatefulWidget {
  const BranchPage({Key? key}) : super(key: key);

  @override
  _BranchPageState createState() => _BranchPageState();
}

class _BranchPageState extends State<BranchPage> {
  final CollectionReference _branches =
      FirebaseFirestore.instance.collection('branch');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 300,
      child: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('សាខា')),
          ),
          body: StreamBuilder(
            stream: _branches.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Container(
                      width: 200,
                      height: 350,
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CachedNetworkImage(
                                imageUrl: documentSnapshot['branch'][0]
                                    ['imageAsset']),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(documentSnapshot['branch'][0]
                                        ['address']),
                                    Text(documentSnapshot['branch'][0]
                                        ['phoneNum']),
                                    Text(documentSnapshot['branch'][0]
                                        ['province']),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      documentSnapshot['branch'][0]
                                              ['googleAddress']
                                          .toString();
                                    },
                                    icon: Icon(Icons.place))
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}
