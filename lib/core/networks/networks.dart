import 'package:quantwealth/core/networks/network_config.dart';

class Networks {
  static final zkEVM = Network(
    symbol: 'ETH',
    assetIcon: '',
    pngIcon: '',
    mainNet: const NetworkConfig(
      networkId: 1101,
      chainId: 'eip155:1101',
      name: 'zkEVM',
      displayName: 'Polygon zkEVM',
      rpcUrl: 'https://polygon-zkevm.drpc.org',
      explorerUrl: 'https://zkevm.polygonscan.com/',
    ),
    testNet: const NetworkConfig(
      networkId: 2442,
      chainId: 'eip155:2442',
      name: 'zkEVM Cardona',
      displayName: 'Polygon zkEVM Cardona',
      rpcUrl: 'https://polygon-zkevm-cardona.blockpi.network/v1/rpc/public',
      explorerUrl: 'https://cardona-zkevm.polygonscan.com/',
    ),
  );

  static final zkSync = Network(
    symbol: 'ETH',
    assetIcon: '',
    pngIcon: '',
    mainNet: const NetworkConfig(
      networkId: 324,
      chainId: 'eip155:324',
      name: 'zkSync',
      displayName: 'Polygon zksync',
      rpcUrl: 'https://mainnet.era.zksync.io	',
      explorerUrl: 'https://explorer.zksync.io/',
    ),
    testNet: const NetworkConfig(
      networkId: 300,
      chainId: 'eip155:300',
      name: 'zkSync Sepolia',
      displayName: 'Polygon zkSync Sepolia',
      rpcUrl: 'https://1rpc.io/zksync2-era',
      explorerUrl: 'https://sepolia.explorer.zksync.io/',
    ),
  );
}
