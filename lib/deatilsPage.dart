import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memories/finalPage.dart';
import 'package:memories/storePage.dart';
import 'package:memories/main.dart';

class deatilsPage extends StatefulWidget {



  @override
  _deatilsPageState createState() => _deatilsPageState();
}

class _deatilsPageState extends State<deatilsPage> {
  final auth = FirebaseAuth.instance;
  XFile? _imageFile;
  final ImagePicker picker = ImagePicker();
  TextEditingController _date = new TextEditingController();
  TextEditingController _tittle = new TextEditingController();
  TextEditingController _about = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text('Hi',
            style: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 35),
          ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => storePage(),
              ),
              );
            },
            icon: Icon(Icons.calendar_today),
          ),
        ],
      ),
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: _date,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                      ),
                      labelText: 'Date',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: '01/01/2000',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: _tittle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.title,
                        color: Colors.blue,
                      ),
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      labelText: 'Tittle',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: _about,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.padding,
                        color: Colors.blue,
                      ),
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      labelText: 'Write the moment',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(context: context, builder: ((builder) => bottomSheet()),
                        );
                      },
                      child: Icon(
                        Icons.camera_alt_sharp,
                        color: Colors.white,
                        size: 28.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.4 * (MediaQuery.of(context).size.height / 30),
                        width: 5 * (MediaQuery.of(context).size.width / 15),
                        margin: EdgeInsets.only(bottom: 20),
                        child: RaisedButton(
                          elevation: 5.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onPressed: () {
                            auth.signOut();
                           Navigator.pop(context);
                          },
                          child: Text(
                            "LogOut",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontSize: MediaQuery.of(context).size.height / 50,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(

                        child: Container(
                          height: 1.4 * (MediaQuery.of(context).size.height / 30),
                          width: 5 * (MediaQuery.of(context).size.width / 15),
                          margin: EdgeInsets.only(bottom: 20),
                          child: RaisedButton(
                            elevation: 5.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => finalPage(
                                  date: _date.text,
                                  about: _about.text,
                                  tittle: _tittle.text
                              ),
                              ),
                              );
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                fontSize: MediaQuery.of(context).size.height / 50,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),



              ],
            ),
          ),
        ),

      ),
    );
  }
}
void takePhoto(ImageSource source) async{

}


Widget bottomSheet() {
  return Container(
    height: 100.0,
    width: 100,
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      children: [
        Text(
          'Choose the Photo',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
                icon: Icon(Icons.image),
                label: Text('Gallery'),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                  // takePhoto(ImageSource.gallery);
                }),
            FlatButton.icon(
              onPressed: () {
                takePhoto(ImageSource.camera);
                // takePhoto(ImageSource.camera);
              },
              icon: Icon(Icons.camera),
              label: Text('Camera'),
            ),
          ],
        ),
      ],
    ),
  );
}

