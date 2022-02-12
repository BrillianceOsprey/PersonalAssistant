import 'package:assist_queen/constant/data_class.dart';
import 'package:assist_queen/database_helper/wallet_database.dart';
import 'package:assist_queen/model_class/wallet.dart';
import 'package:assist_queen/screens/home_page.dart';
import 'package:assist_queen/screens/wallet/components/wallet_page.dart';
import 'package:assist_queen/screens/wallet/widget/form.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final Wallet? wallet;

  const EditPage({
    Key? key,
    this.wallet,
  }) : super(key: key);
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  // late bool isImportant;
  late int number;
  late String title;
  late String description;

  late String numbers = number.toString();

  @override
  void initState() {
    super.initState();

    // isImportant = widget.note?.isImportant ?? false;
    number = widget.wallet?.number ?? 0;
    title = widget.wallet?.title ?? '';
    description = widget.wallet?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: FormWidget(
            //card in edit page

            number: numbers,
            title: title,
            description: description,

            onChangedNumber: (number) => setState(() => numbers = numbers),
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateWallet,
        child: const Text('Save'),
      ),
    );
  }

  void addOrUpdateWallet() async {
    // final isValid = _formKey.currentState!.validate();
    final FormState? formState = _formKey.currentState;
    formState!.save();

    if (formState.validate()) {
      final isUpdating = widget.wallet != null;

      if (isUpdating) {
        await updateWallet();
      } else {
        await addWallet();
      }

      Navigator.of(context).pop();
    }
  }

  // void addOrUpdateWallet() async {
  //   final isValid = _formKey.currentState!.validate();

  //   if (isValid) {
  //     final isUpdating = widget.wallet != null;
  //     if (isUpdating) {
  //       await updateWallet();
  //     } else {
  //       await addWallet();
  //     }
  //     Navigator.of(context).pop();
  //     // Navigator.of(context).pushReplacement(
  //     //     MaterialPageRoute(builder: (context) => const HomePage()));
  //   }
  // }

  Future updateWallet() async {
    final wallet = widget.wallet!.copy(
      number: number,
      title: title,
      description: description,
    );

    await WalletDatabase.instance.update(wallet);
  }

  Future addWallet() async {
    final wallet = Wallet(
      title: title,
      // isImportant: true,
      number: DataClass.myNumber,
      description: description,
      createdTime: DateTime.now(),
    );

    await WalletDatabase.instance.create(wallet);
    //print("Note Data ${DataClass.myNumber }");
  }
}
