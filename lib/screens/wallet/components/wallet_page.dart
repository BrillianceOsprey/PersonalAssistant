import 'package:assist_queen/constant/note_theme.dart';
import 'package:assist_queen/database_helper/event_database.dart';
import 'package:assist_queen/database_helper/wallet_database.dart';
import 'package:assist_queen/model_class/wallet.dart';
import 'package:assist_queen/screens/wallet/components/edit_page.dart';
import 'package:assist_queen/screens/wallet/components/wallet_detail.dart';
import 'package:assist_queen/screens/wallet/widget/card.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  late List<Wallet>? wallets = [];
  bool isLoading = false;
  int axisCount = 2;

  @override
  void initState() {
    super.initState();
    refreshWaets();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshWaets() async {
    setState(() => isLoading = true);

    wallets = await WalletDatabase.instance.readAllWallets();

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Wallet',
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
                      print('Clicked Chart');
                    },
                    child: Icon(
                      Icons.pie_chart_rounded,
                      color: NoteTheme.mainIconColor,
                    ))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/rich.png',
                    width: 30,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Income',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          '1200000',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.greenAccentColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/expenses.png',
                    width: 30,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Expense',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          '1000000',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.redAccentColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/dollar.png',
                    width: 30,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Net Income',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          '200000',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
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
                child: SafeArea(
                    child: Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: ListView.builder(
                      itemCount: wallets!.length,
                      itemBuilder: (context, index) {
                        final wallet = wallets![index];

                        return GestureDetector(
                          onTap: () async {
                            await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  WalletDetails(walletId: wallet.id!),
                            ));

                            refreshWaets();
                          },
                          child: CardWidget(wallet: wallet, index: index),
                        );
                      }),
                )),
              ),
              Center(
                child: InkWell(
                  child: IconButton(
                      onPressed: () {
                        print('Click on add button');
                        Navigator.of(context).push(MaterialPageRoute(
                            // builder: (context) => const AddEditNotePage()));
                            builder: (context) => const EditPage()));
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
