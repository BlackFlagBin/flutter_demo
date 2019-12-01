import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/page_state.dart';
import 'package:flutter_demo/widget/failed_page.dart';
import 'package:flutter_demo/widget/loading_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String url;

  const WebPage({Key key, @required this.url}) : super(key: key);

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  PageState _pageState = PageState.LOADING;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebPage"),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Offstage(offstage: _pageState != PageState.LOADING, child: LoadingPage()),
            Offstage(offstage: _pageState != PageState.FAILED, child: FailedPage(errorMsg: "")),
            Offstage(
              offstage: _pageState != PageState.SUCCESS,
              child: WebView(
                onPageFinished: (url) {
                  setState(() {
                    _pageState = PageState.SUCCESS;
                  });
                },
                initialUrl: widget.url,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
