import 'package:flutter/material.dart';
import 'package:newsapp/View/Screens/ScreenCategory.dart';
import '../../constant.dart';

class CategoryBotton extends StatelessWidget {
  String textBotton;
  Color colorBotton;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 5),
        child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: colorBotton,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return ScreenCategory(textBotton);
              }));
            },
            child: Text(
              "$textBotton",
              style: TextStyle(fontWeight: FontWeight.w800, color: white),
            )),
      ),
    );
  }

  CategoryBotton({required this.textBotton, required this.colorBotton});
}
