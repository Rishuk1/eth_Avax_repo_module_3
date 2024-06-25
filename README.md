

# TokenCreator Solidity Contract

This Solidity program defines a simple ERC-20-like token contract. The contract allows the owner to mint tokens to a specified address, transfer tokens, and burn tokens. The contract includes basic functionalities for managing token balances and supply.

## Description

The `TokenCreator` contract implements basic token functionalities using Solidity. It includes:

- Functions to mint new tokens to a specified address (owner only).
- Function to transfer tokens from one address to another.
- Function to burn tokens, removing them from circulation.
- A simple access control mechanism to restrict minting to the contract owner.

This contract serves as a simple introduction to creating and managing a basic token in Solidity.

## Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. Follow these steps:

1. Go to the [Remix website](https://remix.ethereum.org).
2. Create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `TokenCreator.sol`).
3. Copy and paste the provided code into the file.

    ```solidity
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
    ```

4. To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Ensure the "Compiler" option is set to a compatible version (e.g., `0.8.0`), and then click on the "Compile TokenCreator.sol" button.
5. Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the `TokenCreator` contract from the dropdown menu, and then click on the "Deploy" button.
6. Once the contract is deployed, you can interact with it by calling the `mint`, `transfer`, and `burn` functions. Use the interface provided by Remix to input the necessary parameters and execute the functions.

## Help

If you encounter any issues, ensure the following:

- The Solidity compiler version is set correctly.
- You are the contract owner when calling the `mint` function.
- You have sufficient balance when calling the `transfer` and `burn` functions.

For additional help, use the [Remix documentation](https://remix-ide.readthedocs.io/en/latest/) or community forums.

## Authors

Your Name

## License

This project is licensed under the MIT License.
