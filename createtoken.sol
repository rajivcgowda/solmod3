// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MyToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    address public owner;

    constructor() {
        name = "Rajiv";
        symbol = "RJC";
        decimals = 5;
        totalSupply = 1000 * 10 ** decimals;
        balanceOf[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function mint(address _target, uint256 _value) public {
        require(msg.sender == owner, "Only the owner can mint");
        balanceOf[_target] += _value;
        totalSupply += _value;
    }
    
    function burn(uint256 _value) public {
        require(balanceOf[msg.sender] >= _value, "Balance is insufficient");
        balanceOf[msg.sender] -= _value;
        totalSupply -= _value;
    }
}
