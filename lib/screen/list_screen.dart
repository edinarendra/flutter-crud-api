import 'package:flutter/material.dart';
import 'package:flutter_crud/model/user.dart';
import 'package:flutter_crud/req_res.dart';
import 'package:flutter_crud/screen/add_screen.dart';

class ListData extends StatefulWidget {
  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  List<User> listUser = [];
  ApiConnection apiConnection = ApiConnection();

  getUsers() async {
    listUser = await apiConnection.getUsers();
    setState(() {});
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD API"),
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .popAndPushNamed('/add-data', arguments: [
                    listUser[index].id,
                    listUser[index].name,
                    listUser[index].phoneNumber
                  ]),
                  child: Container(
                    padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(listUser[index].name),
                          Text(listUser[index].phoneNumber),
                      ],
                    )
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).popAndPushNamed('/add-data', arguments: [
                        listUser[index].id,
                        listUser[index].name,
                        listUser[index].phoneNumber
                      ]),
                      icon: Icon(Icons.edit)
                    ),
                  IconButton(
                      color: Colors.red,
                      iconSize: 40,
                      onPressed: () async {
                        bool response = await apiConnection
                            .deleteUseres(int.parse(listUser[index].id)
                        );
                        if (response) {
                          print('berhasil menghapus data');
                        } else {
                          print('gagal menghapus data');
                        }
                        getUsers();
                      },
                      icon: Icon(Icons.delete),
                    )
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: listUser.length),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).popAndPushNamed('/add-data');
        },
      ),
    );
  }
}
