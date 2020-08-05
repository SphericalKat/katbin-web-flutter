import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    ]
                  ),
                )
              ]),
        ),
        backgroundColor: Theme.of(context).cardColor,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.only(right: 16, left: 16),
          child: SizedBox.expand(
            child: Scrollbar(
              child: TextField(
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                    fontFamily: 'jetbrains-mono', color: Colors.white),
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:
                        '> Paste, save, share! (Pasting just a URL will shorten it!)',
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
