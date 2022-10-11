import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../detail/detail.dart';

class PopularProductPage extends StatelessWidget {
  PopularProductPage({Key? key, required this.documentId}) : super(key: key);
  String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference stu = FirebaseFirestore.instance.collection('products');
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
          return data['popular'] == true
              ? InkWell(
                  onTap: () async {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailProductPage(documentId: documentId);
                      },
                    ));
                  },
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            child: Container(
                              height: 150,
                              child: AspectRatio(
                                aspectRatio: 10 / 9, //aspect ratio for Image
                                child: Image(
                                  image: NetworkImage(
                                      data['imageAsset'][0]['url'].toString()),
                                  fit: BoxFit.cover,
                                  height:
                                      150, //fill type of image inside aspectRatio
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 15),
                              child: Container(
                                // width: widthValue - widget.leftPosition,
                                width: 160,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.black.withAlpha(90)),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 10,
                              left: 30,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          data['name'].toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(color: Colors.white),
                                        ),
                                        Text(
                                          data['price'].toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                )
              : const SizedBox();
        }
        return ListTile(
          title: Text('Loading....'),
        );
      },
    );
  }
}
