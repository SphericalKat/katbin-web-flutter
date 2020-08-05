import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:katbin/src/controllers/paste.dart';
import 'package:katbin/src/models/paste.dart';
import 'package:supercharged/supercharged.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: GetBuilder<PasteController>(
        init: PasteController(),
        builder: (controller) {
          return Center(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.only(right: 16, left: 16),
              child: SizedBox.expand(
                child: Scrollbar(
                  child: buildPasteBody(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildPasteBody() {
    if (!Get.parameters.containsKey('paste')) {
      return TextField(
        onChanged: (String value) => PasteController.to.content = value,
        keyboardType: TextInputType.multiline,
        style: TextStyle(
            fontFamily: 'jetbrains-mono', color: Colors.white),
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText:
          '> Paste, save, share! (Pasting just a URL will shorten it!)',
          hintStyle: TextStyle(color: Colors.white),
        ),
      );
    }

    if (Get.parameters['paste'].isNotEmpty) {
      print(Get.parameters['paste']);
      return Text(Get.parameters['paste']);
    } else {
      return Text('Sum random error');
    }
  }

  Widget buildAppBar(BuildContext context) => AppBar(
    title: RichText(
      text: TextSpan(
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
                text: 'Kat',
                style: TextStyle(
                    color: '4e75ed'.toColor(),
                    fontFamily: 'jetbrains-mono',
                    shadows: [
                      Shadow(
                        color: '4e75ed'.toColor(),
                        blurRadius: 5.0,
                      )
                    ])),
            TextSpan(
              text: 'Bin',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'jetbrains-mono',
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      blurRadius: 5.0,
                    )
                  ]),
            )
          ]),
    ),
    backgroundColor: Theme.of(context).cardColor,
    actions: [
      IconButton(
        icon: IconShadowWidget(
          Icon(
            Icons.save,
            color: Colors.white,
          ),
          shadowColor: Colors.white,
        ),
        onPressed: () {
          PasteController.to.savePaste(PasteModel(isUrl: false, content: PasteController.to.content));
        },
      ),
    ],
  );
}
