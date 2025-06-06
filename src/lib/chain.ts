import { mainnet, standalone, testnet } from '@soroban-react/chains';

export const explorerLink = `https://stellar.expert/explorer/${
  process.env.NODE_ENV == "production" ? "public" : "testnet"
}`;
export const chains =
  process.env.NODE_ENV == "production"
    ? [testnet, mainnet]
    : [standalone, testnet, mainnet];
export const activeChainName = process.env.PUBLIC_STELLAR_NETWORK ?? "testnet";
export const activeChain = chains.find(
  (chain) => chain.id === activeChainName
)!;
