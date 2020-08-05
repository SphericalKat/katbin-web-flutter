import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:katbin/src/controllers/paste.dart';
import 'package:katbin/src/models/paste.dart';
import 'package:katbin/src/models/saved_paste_response.dart';
import 'package:supercharged/supercharged.dart';
import 'package:url_launcher/url_launcher.dart';

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
        style: TextStyle(fontFamily: 'jetbrains-mono', color: Colors.white),
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
      return FutureBuilder<SavedPasteResponse>(
        future: PasteController.to.getSavedPaste(Get.parameters['paste']),
        builder: (BuildContext context, AsyncSnapshot<SavedPasteResponse> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return centerProgressBar(context);
            case ConnectionState.active:
              return centerProgressBar(context);
            case ConnectionState.waiting:
              return centerProgressBar(context);
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error.toString()}');
              }
              if (snapshot.data.isUrl) {
                launch(snapshot.data.content).then((value) {
                  exit(0);
                }).catchError(print);
                return null;
              }

              return Text(snapshot.data.content);
            default:
              return centerProgressBar(context);
          }
        },
      );
    } else {
      return Text('Sum random error');
    }
  }

  Widget centerProgressBar(BuildContext context) => Center(
    child: CircularProgressIndicator(
      backgroundColor: Theme.of(context).backgroundColor,
    ),
  );

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
            onPressed: () async {
              var pasteID = await PasteController.to.savePaste(PasteModel(
                  isUrl: false, content: PasteController.to.content));
              Get.offNamed('/$pasteID');
            },
          ),
        ],
      );
}
