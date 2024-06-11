// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    // Item prices
    uint256 constant SOLDERING_WICK_COST = 20;
    uint256 constant ROSIN_COST = 50;
    uint256 constant SOLDER_SUCTION_COST = 10;

    // Mapping to store user inventory
    mapping(address => uint256) public inventory;

    constructor() ERC20("Degen", "DGN") {}

    function mint(uint256 amount) public onlyOwner {
        _mint(msg.sender, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), to, amount);
        return true;

    }

    function redeem(string memory item) public {
        uint256 cost;

        // Determine the cost of the item
        if (keccak256(abi.encodePacked(item)) == keccak256(abi.encodePacked("soldering wick"))) {
            cost = SOLDERING_WICK_COST;
        } else if (keccak256(abi.encodePacked(item)) == keccak256(abi.encodePacked("rosin"))) {
            cost = ROSIN_COST;
        } else if (keccak256(abi.encodePacked(item)) == keccak256(abi.encodePacked("solder suction"))) {
            cost = SOLDER_SUCTION_COST;
        } else {
            // If the item is not recognized, revert the transaction
            revert("Item not recognized");
        }

        // Ensure there are sufficient funds to redeem the item
        require(cost <= balanceOf(msg.sender), "Insufficient balance to redeem this item");

        // Deduct the cost from the sender's balance
        _burn(msg.sender, cost);

        // Add the item to the user's inventory
        inventory[msg.sender]++;
    }
}
