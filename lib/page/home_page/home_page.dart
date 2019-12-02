import 'package:flutter/material.dart';
import 'package:flutter_demo/bean/base_data_entity.dart';
import 'package:flutter_demo/common/api_exception.dart';
import 'package:flutter_demo/common/page_state.dart';
import 'package:flutter_demo/network/net_work.dart';
import 'package:flutter_demo/page/home_page/widget/item_view.dart';
import 'package:flutter_demo/widget/failed_page.dart';
import 'package:flutter_demo/widget/loading_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageState _pageState = PageState.LOADING;
  List<BaseDataResult> _dataList = [];
  String _errorMsg = "";

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    try {
      _dataList = await NetWork.getAndroidDataList();
      setState(() {
        _pageState = PageState.SUCCESS;
      });
    } catch (e) {
      setState(() {
        _pageState = PageState.FAILED;
        if (e is ApiException) {
          _errorMsg = e.msg;
        } else if (e is Exception) {
          _errorMsg = e.toString();
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget = Center(
      child: Text("Default State"),
    );
    switch (_pageState) {
      case PageState.LOADING:
        bodyWidget = LoadingPage();
        break;
      case PageState.SUCCESS:
        bodyWidget = ListView.builder(
          itemBuilder: (context, index) {
            var itemData = _dataList[index];
            return ItemView(
              itemData: itemData,
            );
          },
          itemCount: _dataList.length,
        );
        break;
      case PageState.FAILED:
        bodyWidget = FailedPage(
          errorMsg: _errorMsg,
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: SafeArea(
          child: AnimatedSwitcher(
        child: bodyWidget,
        transitionBuilder: (widget, animation) {
          return ScaleTransition(
            scale: animation,
            child: widget,
          );
        },
        duration: Duration(milliseconds: 500),
      )),
    );
  }
}
