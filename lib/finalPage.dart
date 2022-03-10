import 'package:flutter/material.dart';
import 'package:memories/storePage.dart';

class finalPage extends StatelessWidget {
  String date, about, tittle;
  finalPage({required this.date, required this.about, required this.tittle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        iconTheme: IconThemeData(color: Colors.black //change your color here
            ),
        backgroundColor: Colors.white,
        title: Text(
          '${tittle}',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 35, color: Colors.grey),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => storePage(),
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
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    '${date}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      fontFamily: 'BaysideFont-Regular-Demo.otf',
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: const Radius.circular(70),
                        bottomLeft: const Radius.circular(70),
                        topLeft: const Radius.circular(70),
                        topRight: const Radius.circular(70),
                      ),
                    ),
                    child: Center(
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight: const Radius.circular(70),
                              bottomLeft: const Radius.circular(70),
                              topLeft: const Radius.circular(70),
                              topRight: const Radius.circular(70),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${about}',
                              style: TextStyle(
                                  fontFamily: 'SupermercadoOne-Regular.ttf'),
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
