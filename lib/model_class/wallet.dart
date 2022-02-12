const String tableWallet = 'wallets';

class WalletFields {
  static final List<String> values = [
    /// Add all fields
    id,
    number, title, description, time
  ];

  static const String id = '_id';
  static const String number = 'number';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
}

class Wallet {
  final int? id;
  // shit
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Wallet({
    this.id,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });
// data a thit htae tr ko a pyoung a ll lote chin loz
  Wallet copy({
    int? id,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Wallet(
        id: id ?? this.id,
        // isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

// encoading
  static Wallet fromJson(Map<String, Object?> json) => Wallet(
        id: json[WalletFields.id] as int?,
        number: json[WalletFields.number] as int,
        title: json[WalletFields.title] as String,
        description: json[WalletFields.description] as String,
        createdTime: DateTime.parse(json[WalletFields.time] as String),
      );

// decoading
  Map<String, Object?> toJson() => {
        WalletFields.id: id,
        WalletFields.title: title,
        WalletFields.number: number,
        WalletFields.description: description,
        WalletFields.time: createdTime.toIso8601String(),
      };
}
