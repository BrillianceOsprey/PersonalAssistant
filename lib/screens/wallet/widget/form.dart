import 'package:assist_queen/constant/data_class.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  // final bool? isImportant;
  final String? number;
  final String? title;
  final String? description;
  // final ValueChanged<bool> onChangedImportant;
  final ValueChanged<String> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  const FormWidget({
    Key? key,
    // this.isImportant = false,
    this.number = '',
    this.title = '',
    this.description = '',
    // required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        // widget for a edit page
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              const SizedBox(
                height: 8,
              ),
              buildNumber(),
              const SizedBox(height: 8),
              buildDescription(),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        style: const TextStyle(
          color: Color.fromARGB(179, 7, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Title',
            hintStyle: TextStyle(color: Color.fromARGB(179, 10, 0, 0)),
            prefixIcon: Icon(
              Icons.title,
              color: Colors.blue,
            )),
        validator: (title) =>
            title != null && title.isEmpty ? 'The title cannot be empty' : null,
        onChanged: onChangedTitle,
      );

  Widget buildNumber() => TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        initialValue: number,
        style: const TextStyle(
          color: Color.fromARGB(179, 17, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter Amount',
            hintStyle: TextStyle(color: Color.fromARGB(179, 10, 0, 0)),
            prefixIcon: Icon(
              Icons.money_rounded,
              color: Colors.blue,
            )),
        validator: (number) => number != null && number.isNotEmpty
            ? null
            : "The Amount cannot be empty",

        // onChanged: onChangedNumber
        onChanged: (number) {
          // onChangedNumber(number);
          if (number.isNotEmpty) {
            DataClass.myNumber = int.parse(number);
          }
        },
      );

  Widget buildDescription() => TextFormField(
        maxLines: null,
        initialValue: description,
        style:
            const TextStyle(color: Color.fromARGB(153, 8, 0, 0), fontSize: 18),
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Type something...',
            hintStyle: TextStyle(color: Color.fromARGB(153, 8, 0, 0)),
            prefixIcon: Icon(
              Icons.description,
              color: Colors.blue,
            )),
        validator: (description) => description != null && description.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedDescription,
      );
}
