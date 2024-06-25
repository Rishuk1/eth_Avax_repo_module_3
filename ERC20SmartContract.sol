// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenCreator {
    // Token details
    string public name = "FlashToken";
    string public symbol = "FTK";
    uint public decimals = 18;
    
    // Total supply and owner address
    uint public totalSupply;
    address public owner;
    
    // Balances mapping
    mapping(address => uint) public balanceOf;
    
    // Constructor: initializes the contract with the deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    // Function to mint new tokens (only accessible by the owner)
    function mint(address to, uint amount) public {
        require(msg.sender == owner, "Not owner");
        totalSupply += amount;
        balanceOf[to] += amount;
    }

    // Function to transfer tokens from sender's account to another account
    function transfer(address to, uint amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        return true;
    }

    // Function to burn tokens (remove them from circulation)
    function burn(uint amount) public {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
    }
}
