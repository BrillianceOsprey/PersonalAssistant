import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  Icon? itemIcon;
  String? itemName;
  bool? check;
  int? itemId;
  ItemWidget({
    Key? key,
    this.itemIcon,
    this.itemName,
    this.check,
    this.itemId,
  }) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    child: widget.itemIcon,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${widget.itemName}"),
                  ),
                ],
              ),
              Container(
                child: widget.check == true
                    ? Container(
                        child: const Icon(Icons.check),
                      )
                    : Container(),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0),
            color: Colors.black12,
            height: 1,
          )
        ],
      ),
    );
  }
}
