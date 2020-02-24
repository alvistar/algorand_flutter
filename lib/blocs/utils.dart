import 'package:dart_algorand/algod.dart' as algod;

List<String> getAssets(algod.Account account) {
  final assets = <String>[];

  account.thisassettotal.forEach((key, value) {
    assets.add(value.unitname);
  });

  return assets;
}

int getBalanceForAssetIndex({algod.Account account, int asset}) {
  final m = account.assets.asMap;
  return (m[asset.toString()]['amount']);
}

int getAssetIndex({algod.Account account, String asset}) {
  final key = account.thisassettotal.keys
      .firstWhere((k) => account.thisassettotal[k].unitname == asset);
  return int.parse(key);
}

int getBalance({algod.Account account,String asset}) {

  if (account == null) {
    return 0;
  }

  if (asset == 'algo') {
    return account.amount;
  }

  return getBalanceForAssetIndex(
      account: account,
      asset: getAssetIndex(account: account, asset: asset));
}