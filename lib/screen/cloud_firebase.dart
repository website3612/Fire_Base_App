import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/collection/collection_routes.dart';

import 'package:flutter/material.dart';

class DatabaseCloud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloud fireStore'),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              data
                  .add({'name': 'hii', 'address': 'surat'})
                  .then((value) => print('add success'))
                  .catchError((e) => print('add error==>>$e'));

              //   userCollection
              //       .add({
              //         'name': 'test1',
              //         'address': 'surat',
              //         'list': [10, 20, 30]
              //       })
              //       .then((value) => print('add success'))
              //       .catchError((e) => print(e));
              // },
            },
            child: Text('Add'),
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: data.snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<DocumentSnapshot> docs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${docs[index].get('name')}'),
                    subtitle: Text('${docs[index].get('address')}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            data
                                .doc(docs[index].id)
                                .delete()
                                .then((value) => print('delete success'))
                                .catchError((e) {
                              print('delete Error $e');
                            });

                            // userCollection
                            //     .doc(kFirebaseAuth.currentUser.uid)
                            //     .set({
                            //       'name': 'test1',
                            //       'address': 'surat',
                            //       'list': [10, 20, 30]
                            //     })
                            //     .then((value) => print('add success'))
                            //     .catchError((e) => print(e));
                          },
                          icon: Icon(Icons.cancel),
                        ),
                        IconButton(
                            onPressed: () {
                              data
                                  .doc('${docs[index].id}')
                                  .update({'name': 'hello'})
                                  .then((value) => print('update success'))
                                  .catchError((e) => print('update error $e'));
                            },
                            icon: Icon(Icons.edit))
                      ],
                    ),
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
