// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

// real token contract

contract RealToken {
    
    mapping(address => uint) public balances;
    uint public totalSupply;
    uint public totalClaimed;
    mapping(address => bool) public claimed;

    constructor() {
        totalSupply = 1000000000;
    }

    function claim() public {

        require(totalClaimed < totalSupply, "All Tokens Claimed");
        require(!claimed[msg.sender], "Tokens Claimed");
        claimed[msg.sender] = true;
        balances[msg.sender] += 800;
        totalClaimed += 800;
    }

    function safeTransfer(address _to, uint _amount) public {

        require(_to != address(0), "UnsafeTransfer: zero address");
        require(balances[_to] > 0, "UnsafeTransfer: zero balance");
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }

    error UnsafeTransfer(address _address);
}
