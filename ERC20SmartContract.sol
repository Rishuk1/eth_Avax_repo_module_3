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

   
    function transferToken(address from, address to, uint amount) public  {
        _transfer(from, to, amount);
    }
}
