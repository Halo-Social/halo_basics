import 'package:json_annotation/json_annotation.dart';
import 'chain_base.dart';

part 'chain_info.g.dart';

@JsonSerializable()
class ChainInfo {
  /// chain name
  final String name;

  /// main token symbol
  final String symbol;

  /// main token decimal
  final int decimal;

  /// chain simple spell in halo
  final String chain;

  /// chain simple spell in okx
  final String chainOkx;

  /// evm chain id
  final int chainId;

  /// [coinTypeForBip32] https://github.com/satoshilabs/slips/blob/master/slip-0044.md
  /// evm 系列统一用eth的值'60'，业内的遗留问题
  final int coinTypeForBip32; // bip32 coin type
  final bool isEVM;

  bool _useEip1559 = false;

  bool get useEip1559 => _useEip1559;

  set useEip1559(support1559) => _useEip1559 = support1559;

  /// 默认配置该链是否是开着的
  final bool switchOn;
  final String tokenProtocol;
  final String browser;
  String iconLight;
  String iconLightColor;
  String iconDark;
  String iconDarkColor;
  List<String> rpcList;

  ChainInfo({
    required this.name,
    required this.symbol,
    required this.chain,
    required this.chainOkx,
    required this.decimal,
    required this.chainId,
    required this.coinTypeForBip32,
    required this.isEVM,
    required bool useEip1559,
    required this.switchOn,
    required this.tokenProtocol,
    required this.browser,
    required this.iconDark,
    required this.iconDarkColor,
    required this.iconLight,
    required this.iconLightColor,
    required this.rpcList,
  }) {
    this.useEip1559 = useEip1559;
  }

  factory ChainInfo.fromJson(Map<String, dynamic> json) => _$ChainInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ChainInfoToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isL2Chain => chain == gArbitrumChainInfo.chain || chain == gZkSyncChainINfo.chain;

  ///register for wallet connect
  String walletConnectChainId() {
    return 'eip155:$chainId';
  }
}
