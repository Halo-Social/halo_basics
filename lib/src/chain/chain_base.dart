import 'chain_info.dart';

const assetBaseDir = "packages/halo_basics/assets";

/// 支持的链信息
final gChainList = [
  gEthChainInfo,
  gBnbChainInfo,
  gPolygonChainInfo,
  gKccChainInfo,
  gAVAXCChainInfo,
  gOptimismChainInfo,
  gArbitrumChainInfo,
  gFantomChainInfo,
  gCfxChainINfo,
  gZkSyncChainINfo,
  gBaseChainINfo
];

final gEthChainInfo = ChainInfo(
  name: "Ethereum",
  symbol: "ETH",
  chain: "ETH",
  chainOkx: "ethereum",
  decimal: 18,
  chainId: 1,
  coinTypeForBip32: 60,
  isEVM: true,
  useEip1559: true,
  switchOn: true,
  tokenProtocol: "ERC20",
  iconLight: "$assetBaseDir/svg/net-erc20.svg",
  iconDark: "$assetBaseDir/svg_dark/net-erc20.svg",
  iconLightColor: "$assetBaseDir/svg/net-erc20-color.svg",
  iconDarkColor: "$assetBaseDir/svg_dark/net-erc20-color.svg",
  browser: "https://etherscan.io/tx/",
  rpcList: [
    "https://eth-mainnet.nodereal.io/v1/1659dfb40aa24bbb8153a677b98064d7",
    "https://eth-mainnet.public.blastapi.io",
    "https://rpc.ankr.com/eth",
    "https://eth-mainnet.gateway.pokt.network/v1/5f3453978e354ab992c4da79",
    "https://eth-rpc.gateway.pokt.network",
    "https://ethereum.publicnode.com",
    "https://api.securerpc.com/v1"
  ],
);

final gBnbChainInfo = ChainInfo(
  name: "BNB Smart Chain",
  symbol: "BNB",
  chain: "BSC",
  chainOkx: "bnbchain",
  decimal: 18,
  chainId: 56,
  coinTypeForBip32: 60,
  isEVM: true,
  useEip1559: false,
  switchOn: true,
  tokenProtocol: "BEP20",
  iconLight: "$assetBaseDir/svg/net-bnb-chain.svg",
  iconDark: "$assetBaseDir/svg_dark/net-bnb-chain.svg",
  iconLightColor: "$assetBaseDir/svg/net-bnb-chain-color.svg",
  iconDarkColor: "$assetBaseDir/svg_dark/net-bnb-chain-color.svg",
  browser: "https://bscscan.com/tx/",
  rpcList: [
    "https://bsc-dataseed1.defibit.io",
    "https://bsc-dataseed2.defibit.io",
    "https://bsc-dataseed1.ninicoin.io",
    "https://bsc-dataseed4.ninicoin.io",
    "https://bsc-dataseed.binance.org",
    "https://bsc-dataseed3.binance.org"
  ],
);

final gPolygonChainInfo = ChainInfo(
  name: "Polygon",
  symbol: "MATIC",
  chain: "POLYGON",
  chainOkx: "polygon",
  decimal: 18,
  chainId: 137,
  coinTypeForBip32: 60,
  isEVM: true,
  useEip1559: true,
  switchOn: true,
  tokenProtocol: "Polygon(ERC20)",
  iconLight: "$assetBaseDir/svg/net-polygon(erc20).svg",
  iconDark: "$assetBaseDir/svg_dark/net-polygon(erc20).svg",
  iconLightColor: "$assetBaseDir/svg/net-polygon(erc20)-color.svg",
  iconDarkColor: "$assetBaseDir/svg_dark/net-polygon(erc20)-color.svg",
  browser: "https://polygonscan.com/tx/",
  rpcList: [
    "https://rpc-mainnet.matic.quiknode.pro",
    "https://poly-rpc.gateway.pokt.network",
    "https://polygon-mainnet.public.blastapi.io",
    "https://rpc-mainnet.matic.network",
    "https://rpc.ankr.com/polygon"
  ],
);

final gKccChainInfo = ChainInfo(
  name: "KuCoin Community Chain",
  symbol: "KCS",
  chain: "KCC",
  chainOkx: "kcc",
  decimal: 18,
  chainId: 321,
  coinTypeForBip32: 60,
  isEVM: true,
  useEip1559: false,
  switchOn: true,
  tokenProtocol: "KRC20",
  iconLight: "$assetBaseDir/svg/net-kcc.svg",
  iconDark: "$assetBaseDir/svg_dark/net-kcc.svg",
  iconLightColor: "$assetBaseDir/svg/net-kcc-color.svg",
  iconDarkColor: "$assetBaseDir/svg_dark/net-kcc-color.svg",
  browser: "https://explorer.kcc.io/tx/",
  rpcList: [
    "https://rpc-mainnet.kcc.network",
    "https://public-rpc.blockpi.io/http/kcc",
    "https://kcc.mytokenpocket.vip"
  ],
);

final gAVAXCChainInfo = ChainInfo(
  name: "Avalanche C-Chain",
  symbol: "AVAX",
  chain: "AVAX-C",
  chainOkx: "avalanchec",
  decimal: 18,
  chainId: 43114,
  coinTypeForBip32: 60,
  isEVM: true,
  useEip1559: true,
  switchOn: true,
  tokenProtocol: "Avalanche(ERC20)",
  browser: "https://snowtrace.io/tx/",
  iconLight: "$assetBaseDir/svg/net-avax.svg",
  iconDark: "$assetBaseDir/svg_dark/net-avax.svg",
  iconLightColor: "$assetBaseDir/svg/net-avax-color.svg",
  iconDarkColor: "$assetBaseDir/svg_dark/net-avax-color.svg",
  rpcList: [
    "https://rpc.ankr.com/avalanche",
    "https://1rpc.io/avax/c",
    "https://api.avax.network/ext/bc/C/rpc",
    "https://avalanche-evm.publicnode.com"
  ],
);

final gOptimismChainInfo = ChainInfo(
  name: "Optimism",
  symbol: "ETH",
  chain: "OPTIMISM",
  chainOkx: "optimism",
  decimal: 18,
  chainId: 10,
  coinTypeForBip32: 60,
  isEVM: true,
  useEip1559: true,
  switchOn: false,
  tokenProtocol: "Optimism(ERC20)",
  browser: "https://optimistic.etherscan.io/tx/",
  iconLight: "$assetBaseDir/svg/net-op.svg",
  iconDark: "$assetBaseDir/svg_dark/net-op.svg",
  iconLightColor: "$assetBaseDir/svg/net-op-color.svg",
  iconDarkColor: "$assetBaseDir/svg_dark/net-op-color.svg",
  rpcList: ["https://mainnet.optimism.io", "https://opt-mainnet.g.alchemy.com/v2/demo"],
);

final gArbitrumChainInfo = ChainInfo(
  name: "Arbitrum",
  symbol: "ETH",
  chain: "ARBITRUM",
  chainOkx: "arbitrumone",
  decimal: 18,
  chainId: 42161,
  coinTypeForBip32: 60,
  isEVM: true,
  useEip1559: true,
  switchOn: true,
  tokenProtocol: "Arbitrum(ERC20)",
  browser: "https://arbiscan.io/tx/",
  iconLight: "$assetBaseDir/svg/net-arbitrum.svg",
  iconDark: "$assetBaseDir/svg_dark/net-arbitrum.svg",
  iconLightColor: "$assetBaseDir/svg/net-arbitrum-color.svg",
  iconDarkColor: "$assetBaseDir/svg_dark/net-arbitrum-color.svg",
  rpcList: ["https://1rpc.io/arb", "https://arbitrum.blockpi.network/v1/rpc/public", "https://arb1.arbitrum.io/rpc"],
);

final gFantomChainInfo = ChainInfo(
    name: "Fantom",
    symbol: "FTM",
    chain: "FANTOM",
    chainOkx: "fantom",
    decimal: 18,
    chainId: 250,
    coinTypeForBip32: 60,
    isEVM: true,
    useEip1559: true,
    switchOn: true,
    tokenProtocol: "Fantom(ERC20)",
    browser: "https://ftmscan.com/tx/",
    iconLight: "$assetBaseDir/svg/net-fantom.svg",
    iconDark: "$assetBaseDir/svg_dark/net-fantom.svg",
    iconLightColor: "$assetBaseDir/svg/net-fantom-color.svg",
    iconDarkColor: "$assetBaseDir/svg_dark/net-fantom-color.svg",
    rpcList: [
      "https://fantom-mainnet.public.blastapi.io",
      "https://rpc.fantom.network",
      "https://rpc2.fantom.network",
      "https://rpc3.fantom.network",
      "https://fantom.blockpi.network/v1/rpc/public",
      "https://rpc.ankr.com/fantom"
    ]);

final gCfxChainINfo = ChainInfo(
  name: "Conflux eSpace",
  symbol: "CFX",
  chain: "CONFLUX",
  chainOkx: "conflux",
  decimal: 18,
  chainId: 1030,
  coinTypeForBip32: 60,
  isEVM: true,
  useEip1559: false,
  switchOn: true,
  tokenProtocol: "Conflux(ERC20)",
  browser: "https://evm.confluxscan.net/tx/",
  iconLight: "$assetBaseDir/svg/net-conflux.svg",
  iconDark: "$assetBaseDir/svg_dark/net-conflux.svg",
  iconLightColor: "$assetBaseDir/svg/net-conflux-color.svg",
  iconDarkColor: "$assetBaseDir/svg_dark/net-conflux-color.svg",
  rpcList: ["https://evm.confluxrpc.com"],
);

/// zkSync Era
final gZkSyncChainINfo = ChainInfo(
  name: "zkSync Era",
  symbol: "ETH",
  chain: "ZKSYNC",
  chainOkx: "zksyncera",
  decimal: 18,
  chainId: 324,
  coinTypeForBip32: 60,
  isEVM: true,
  useEip1559: false,
  switchOn: true,
  tokenProtocol: "zkSync Era(ERC20)",
  browser: "https://explorer.zksync.io/tx/",
  iconLight: "$assetBaseDir/svg/net-zksync.svg",
  iconDark: "$assetBaseDir/svg_dark/net-zksync.svg",
  iconLightColor: "$assetBaseDir/svg/net-zksync-color.svg",
  iconDarkColor: "$assetBaseDir/svg_dark/net-zksync-color.svg",
  rpcList: ["https://zksync-era.blockpi.network/v1/rpc/public", "https://mainnet.era.zksync.io"],
);

final gBaseChainINfo = ChainInfo(
  name: "Base",
  symbol: "ETH",
  chain: "BASE",
  chainOkx: "base",
  decimal: 18,
  chainId: 8453,
  coinTypeForBip32: 60,
  isEVM: true,
  useEip1559: true,
  switchOn: true,
  tokenProtocol: "Base(ERC20)",
  browser: "https://basescan.org/tx/",
  iconLight: "$assetBaseDir/svg/net-base.svg",
  iconDark: "$assetBaseDir/svg/net-base.svg",
  iconLightColor: "$assetBaseDir/svg/net-base-color.svg",
  iconDarkColor: "$assetBaseDir/svg_dark/net-base-color.svg",
  rpcList: [
    "https://mainnet.base.org	",
    "https://base.llamarpc.com",
    "https://base-rpc.publicnode.com",
    "https://1rpc.io/base"
  ],
);
