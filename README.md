# FlashToken Solidity Contract

This Solidity program defines a simple ERC-20 token contract. The contract allows the owner to mint tokens to a specified address, transfer tokens, and burn tokens. The contract includes basic functionalities for managing token balances and supply using OpenZeppelin's ERC20 standard implementation.

## Description

The `FlashToken` contract implements basic token functionalities using Solidity and inherits from OpenZeppelin's ERC20 contract. It includes:

- Functions to mint new tokens to a specified address (owner only).
- Function to transfer tokens from one address to another.
- Function to burn tokens, removing them from circulation.
- A simple access control mechanism to restrict minting to the contract owner.

This contract serves as a simple introduction to creating and managing a basic ERC-20 token in Solidity.

## Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. Follow these steps:

1. Go to the [Remix website](https://remix.ethereum.org).
2. Create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `FlashToken.sol`).
3. Copy and paste the provided code into the file.

    ```solidity
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;

    import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

    contract FlashToken is ERC20 {
        address public owner;

        constructor(uint initialSupply) ERC20("FlashToken", "FTK") {
            owner = msg.sender;
            _mint(owner, initialSupply);
        }

        modifier onlyOwner() {
            require(msg.sender == owner, "Not owner");
            _;
        }

        function mint(address to, uint amount) public onlyOwner {
            _mint(to, amount);
        }

        function burn(uint amount) public {
            _burn(msg.sender, amount);
        }

        function transferToken(address from, address to, uint amount) public {
            _transfer(from, to, amount);
        }
    }
    ```

4. To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Ensure the "Compiler" option is set to a compatible version (e.g., `0.8.0`), and then click on the "Compile FlashToken.sol" button.
5. Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the `FlashToken` contract from the dropdown menu, and then click on the "Deploy" button.
6. Once the contract is deployed, you can interact with it by calling the `mint`, `transferToken`, and `burn` functions. Use the interface provided by Remix to input the necessary parameters and execute the functions.

## Help

If you encounter any issues, ensure the following:

- The Solidity compiler version is set correctly.
- You are the contract owner when calling the `mint` function.
- You have sufficient balance when calling the `transferToken` and `burn` functions.

For additional help, use the [Remix documentation](https://remix-ide.readthedocs.io/en/latest/) or community forums.

## Authors

Rishav Kumar

## License

This project is licensed under the MIT License.
