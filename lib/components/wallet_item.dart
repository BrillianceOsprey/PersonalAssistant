import 'package:assist_queen/constant/note_theme.dart';
import 'package:assist_queen/model_class/note.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];

class WalletItem extends StatelessWidget {
  const WalletItem({Key? key, required this.note, required this.index})
      : super(key: key);
  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    final color = _lightColors[index % _lightColors.length];
    var fullWidth = MediaQuery.of(context).size.width;
    var fullHeight = MediaQuery.of(context).size.height;
    final time = DateFormat.yMMMd().format(note.createdTime);
    return Container(
      margin: const EdgeInsets.all(2),
      child: Card(
        color: color,
        child: Container(
          // height: fullHeight / 8,
          constraints: BoxConstraints(minHeight: fullHeight / 8),
          decoration: BoxDecoration(boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.06),
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ], borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // 'Job ',
                          note.title,
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.textBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: fullWidth / 1.2,
                          child: Text(
                            // 'It is not possible to change default elevation color right now in Flutter. And in It is not possible to change default elevation color right now in Flutter. And in',
                            note.description,
                            style: TextStyle(
                              fontFamily: 'Argon',
                              color: NoteTheme.textBlackColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.timelapse_outlined,
                      size: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        // '07:30 AM',
                        time,
                        style: TextStyle(
                            fontSize: 12, color: NoteTheme.purpleAccentColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
