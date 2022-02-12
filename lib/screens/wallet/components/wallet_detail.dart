import 'package:assist_queen/database_helper/wallet_database.dart';
import 'package:assist_queen/model_class/wallet.dart';
import 'package:assist_queen/screens/wallet/components/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WalletDetails extends StatefulWidget {
  final int walletId;

  const WalletDetails({
    Key? key,
    required this.walletId,
  }) : super(key: key);

  @override
  _WalletDetailsState createState() => _WalletDetailsState();
}

class _WalletDetailsState extends State<WalletDetails> {
  late Wallet wallet;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    this.wallet = await WalletDatabase.instance.readNote(widget.walletId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  // padding: EdgeInsets.symmetric(vertical: 8),
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wallet.title,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 14, 0, 0),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      wallet.description,
                      style: const TextStyle(
                          color: Color.fromARGB(179, 12, 0, 0), fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      wallet.number.toString(),
                      style: const TextStyle(
                          color: Color.fromARGB(153, 12, 0, 0), fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      DateFormat.yMMMd().format(wallet.createdTime),
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 7, 10)),
                    ),
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: const Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditPage(wallet: wallet),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          await WalletDatabase.instance.delete(widget.walletId);

          Navigator.of(context).pop();
        },
      );
}
