import 'package:flutter/material.dart';

class MineCard extends StatelessWidget {
  final String name;
  final String red;
  final String summary;

  const MineCard(this.name, this.red, this.summary);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Container(
          margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              red == null
                  ? Text(
                      summary,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  : RichText(
                      text: TextSpan(
                        text: red,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: summary,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal))
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
