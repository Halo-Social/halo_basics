// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chain_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChainInfo _$ChainInfoFromJson(Map<String, dynamic> json) => ChainInfo(
  name: json['name'] as String,
  symbol: json['symbol'] as String,
  chain: json['chain'] as String,
  chainOkx: json['chainOkx'] as String,
  decimal: json['decimal'] as int,
  chainId: json['chainId'] as int,
  coinTypeForBip32: json['coinTypeForBip32'] as int,
  isEVM: json['isEVM'] as bool,
  useEip1559: json['useEip1559'] as bool,
  switchOn: json['switchOn'] as bool,
  tokenProtocol: json['tokenProtocol'] as String,
  browser: json['browser'] as String,
  iconDark: json['iconDark'] as String,
  iconDarkColor: json['iconDarkColor'] as String,
  iconLight: json['iconLight'] as String,
  iconLightColor: json['iconLightColor'] as String,
  rpcList:
  (json['rpcList'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$ChainInfoToJson(ChainInfo instance) => <String, dynamic>{
  'name': instance.name,
  'symbol': instance.symbol,
  'chain': instance.chain,
  'chainOkx': instance.chainOkx,
  'decimal': instance.decimal,
  'chainId': instance.chainId,
  'coinTypeForBip32': instance.coinTypeForBip32,
  'isEVM': instance.isEVM,
  'useEip1559': instance.useEip1559,
  'switchOn': instance.switchOn,
  'tokenProtocol': instance.tokenProtocol,
  'browser': instance.browser,
  'iconLight': instance.iconLight,
  'iconLightColor': instance.iconLightColor,
  'iconDark': instance.iconDark,
  'iconDarkColor': instance.iconDarkColor,
  'rpcList': instance.rpcList,
};

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
