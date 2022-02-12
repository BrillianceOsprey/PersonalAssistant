import 'package:assist_queen/components/evt_item.dart';
import 'package:assist_queen/constant/note_theme.dart';
import 'package:assist_queen/components/edit_note_page.dart';
import 'package:assist_queen/database_helper/event_database.dart';
import 'package:assist_queen/model_class/note.dart';
import 'package:assist_queen/screens/details/details.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late List<Note>? notes = [];
  bool isLoading = false;
  int axisCount = 2;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    var fullWidth = MediaQuery.of(context).size.width;
    var fullHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Event',
                  style: TextStyle(
                      fontFamily: 'RobotoMono',
                      color: NoteTheme.mainTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 100,
                ),
                InkWell(
                    onTap: () {
                      print('Clicked Noti');
                    },
                    child: Icon(
                      Icons.notifications,
                      color: NoteTheme.mainIconColor,
                    ))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Today has no tasks',
                style: TextStyle(
                    fontFamily: 'RobotoMono',
                    color: NoteTheme.mainTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Card(
                elevation: 5,
                child: Container(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Text(
                      '0',
                      style: TextStyle(
                          fontFamily: 'RobotoMono',
                          color: NoteTheme.purpleAccentColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                child: Image.asset(
                  'assets/images/armicon.png',
                  width: 30,
                ),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: fullHeight / 1.45,
                // height: double.infinity,

                decoration: BoxDecoration(
                    color: NoteTheme.mainBgColor,
                    // color: Colors.deepPurple,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView.builder(
                    itemCount: notes!.length,
                    itemBuilder: (context, index) {
                      final note = notes![index];

                      return GestureDetector(
                        onTap: () async {
                          await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                NoteDetailPage(noteId: note.id!),
                          ));

                          refreshNotes();
                        },
                        child: EvtItem(note: note, index: index),
                      );
                    }),
              ),
              Center(
                child: InkWell(
                  child: IconButton(
                      onPressed: () {
                        print('Click on add button');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddEditNotePage()));
                      },
                      icon: const Icon(Icons.add)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
