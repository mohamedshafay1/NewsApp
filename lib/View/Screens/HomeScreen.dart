import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Controller/api.dart';
import 'package:newsapp/View/Wedget/CategoryBotton.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constant.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGround,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Choose News Categories",
                  style: TextStyle(color: textColor, fontSize: fontxlarge),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 14,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryBotton(textBotton: "sports", colorBotton: red),
                    CategoryBotton(textBotton: "business", colorBotton: blue),
                    CategoryBotton(textBotton: "science", colorBotton: yellow),
                    CategoryBotton(
                        textBotton: "entertainment", colorBotton: green),
                    CategoryBotton(
                        textBotton: "general", colorBotton: orangeLight),
                    CategoryBotton(textBotton: "sports", colorBotton: blue),
                    CategoryBotton(textBotton: "sports", colorBotton: red),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: api.fetchArticles(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return (snapshot.hasData)
                        ? ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () async {
                                  if (!await launchUrl(
                                     Uri.parse(snapshot.data[index].url)))
                                    throw 'Could not launch ${snapshot.data[index].url}';
                                },
                                child: Card(
                                  color: white,
                                  elevation: 5,
                                  shadowColor: textColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  '${snapshot.data[index].urlToImage}')),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: Radius.circular(25)),
                                          color: Colors.redAccent,
                                        ),
                                        height: 200,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "${snapshot.data[index].title}",
                                          style: TextStyle(
                                              fontSize: fontSubTitel,
                                              color: textColor,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Share.share(
                                                    '${snapshot.data[index].url}',
                                                    subject:
                                                        'The Linl Shared By Times App 😊 ');
                                              },
                                              icon: Icon(Icons.share_rounded)),
                                          IconButton(
                                              onPressed: () {
                                                FlutterClipboard.copy(
                                                        '${snapshot.data[index].url}')
                                                    .then((value) => {
                                                          Scaffold.of(context)
                                                              .showSnackBar(
                                                                  new SnackBar(
                                                            content: new Text(
                                                                "Copy Done"),
                                                          ))
                                                        });
                                              },
                                              icon: Icon(Icons.copy_rounded)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
