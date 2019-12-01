import 'package:flutter/material.dart';
import 'package:flutter_demo/bean/base_data_entity.dart';

class ItemView extends StatelessWidget {
  final BaseDataResult itemData;

  const ItemView({Key key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                itemData.desc,
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(itemData.type, style: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(itemData.who, style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("web_page", arguments: itemData.url);
                    },
                    child: Text(itemData.url,
                        style: TextStyle(color: Colors.blueAccent, fontSize: 15))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
