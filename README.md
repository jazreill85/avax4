# DegenToken Contract

## Description
The DegenToken contract is an ERC20 token contract named "Degen" with the symbol "DGN". It allows for minting, burning, transferring tokens, and redeeming items using tokens.

## License
This contract is licensed under the MIT License.

## Prerequisites
- Solidity version: ^0.8.18
- OpenZeppelin Contracts version: 4.9.0

## Features
- Minting tokens: Only the owner of the contract can mint tokens to any address.
- Burning tokens: Any address can burn their own tokens.
- Transferring tokens: Standard ERC20 transfer function.
- Redeeming items: Users can redeem items using their tokens. Items available for redemption include soldering wick, rosin, and solder suction.

## Item Prices
- Soldering Wick: 20 DGN
- Rosin: 50 DGN
- Solder Suction: 10 DGN

## Inventory
The contract maintains a mapping to store the inventory of each user. After redeeming an item, the corresponding inventory count for the user is incremented.

## Functions
- `mint(uint256 amount)`: Allows the owner to mint tokens to any address.
- `burn(uint256 amount)`: Allows any address to burn their own tokens.
- `transfer(address to, uint256 amount)`: Standard ERC20 transfer function.
- `redeem(string memory item)`: Allows users to redeem items using their tokens.

