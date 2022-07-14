import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/req_res.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  ApiConnection apiConnection = ApiConnection();

  final _nameController = TextEditingController();
  final _phoneConroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;

    if (args[1].isNotEmpty) {
      _nameController.text = args[1];
    }

    if (args[2].isNotEmpty) {
      _phoneConroller.text = args[2];
    }

    return Scaffold(
      appBar: AppBar(title: Text("Create data"), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
            ),
            TextField(
              controller: _phoneConroller,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     bool response = await apiConnection.postUsers(
                  //         _nameController.text, _phoneConroller.text);
                  //     if (response) {
                  //       Navigator.of(context).popAndPushNamed('/home');
                  //     } else {
                  //       print('gagal menambahkan data');
                  //     }
                  //   },
                  //   child: Text('Create'),
                  //   style: ButtonStyle(
                  //     backgroundColor: MaterialStateProperty.all(Colors.green)
                  //   ),
                  // ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      bool response = await apiConnection.updateUsers(
                        int.parse(args[0]), _nameController.text, _phoneConroller.text
                      );
                      if (response) {
                        Navigator.of(context).popAndPushNamed('/home');
                      } else {
                        print('gagal memperbarui data');
                      }
                    },
                    child: Text('Update')
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
