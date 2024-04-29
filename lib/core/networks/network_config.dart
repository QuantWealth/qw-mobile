class Network {
  final NetworkConfig mainNet;
  final NetworkConfig testNet;
  final String symbol;
  final String assetIcon;
  final String pngIcon;

  Network({
    required this.symbol,
    required this.mainNet,
    required this.testNet,
    required this.assetIcon,
    required this.pngIcon,
  });

  @override
  String toString() {
    return 'Network{mainNet: $mainNet, testNet: $testNet, symbol: $symbol, assetIcon: $assetIcon, pngIcon: $pngIcon}';
  }
}

class NetworkConfig {
  final String name;
  final int networkId;
  final String chainId;
  final String displayName;
  final String rpcUrl;
  final String explorerUrl;

  const NetworkConfig({
    required this.name,
    required this.networkId,
    required this.chainId,
    required this.displayName,
    required this.rpcUrl,
    required this.explorerUrl,
  });

  @override
  String toString() {
    return 'NetworkConfig{name: $name, networkId: $networkId, chainId: $chainId, displayName: $displayName, rpcUrl: $rpcUrl, explorerUrl: $explorerUrl}';
  }
}
