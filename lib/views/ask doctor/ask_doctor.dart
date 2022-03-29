import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AskDoctor extends StatelessWidget {
  const AskDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Container(
              color: Colors.yellow[900],
              height: 60,
              width: double.infinity,
              child: const Center(
                  child: Text(
                'استشر طبيبك',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ))),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => launch(
                            'sms:+019575777?body= مرحبا اريد استشارة طبيب'),
                        icon: Icon(
                          Icons.sms,
                          size: 40,
                          color: Colors.yellow[900],
                        )),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                    // const Text(
                    //   'ارسل رساله نصيه',
                    //   style: TextStyle(
                    //     fontSize: 19,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => launch(
                            'mailto:esraa@gmail.com?subject=اسشر طبيب&body=مرحبا اريد استشارة طبيب برجاء التواصل معى '),
                        icon: Icon(
                          Icons.email,
                          size: 40,
                          color: Colors.yellow[900],
                        )),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                    // const Text(
                    //   'التواصل عبر البريد الإلكتروني',
                    //   style: TextStyle(
                    //     fontSize: 19,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => launch('tel:+201010839446'),
                        icon: Icon(
                          Icons.phone,
                          size: 40,
                          color: Colors.yellow[900],
                        )),
                    // const SizedBox(width: 20,),
                    // const Text('اتصل مباشرة', style: TextStyle(fontSize: 19,),),
                  ],
                ),
              ),
            ],
          )

          // Container(
          //   width: 100,height: 100,
          //   color: Colors.grey[400],
          //   child: Column(
          //     children:  [
          //       IconButton(
          //           onPressed: () => launch('tel:+201010839446'),
          //           icon:  Icon(Icons.phone,size: 40,color: Colors.yellow[900],)),
          //       const SizedBox(width: 20,),
          //       const Text('اتصل مباشرة', style: TextStyle(fontSize: 19,color: Colors.white),),
          //
          //     ],
          //   ),
          // )
        ]),
      ),
    );
  }
}
