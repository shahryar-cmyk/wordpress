import 'package:flutter/material.dart';
import 'package:soledesign/TestingOrientation/ListWidget.dart';
import 'package:soledesign/TestingOrientation/detailWidget.dart';
class MasterDetailPage extends StatefulWidget {
  @override
  _MasterDetailPageState createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  var selectedValue = 0;
  var isLargeScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        if (MediaQuery.of(context).size.width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }
        return Row(
          children: <Widget>[
            Expanded(
              child: ListWidget(
                10,
                (value) {
                  if (isLargeScreen) {
                    selectedValue = value;
                    setState(() {});
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailWidget(value);
                        },
                      ),
                    );
                  }
                },
              ),
            ),
            isLargeScreen ? Expanded(child: DetailWidget(selectedValue)) : Container(),
            // isLargeScreen ? Expanded(child: DetailWidget(selectedValue)) : Container(),
          ],
        );
      }),
    );
  }
}
