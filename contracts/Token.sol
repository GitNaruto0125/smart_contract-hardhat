pragma solidity ^0.7.0;

contract Token {
    string public name = "My Hardhat Token";
    string public symbol = "MHT";

    unit256 public totalSupply = 1000000;

    address public owner;

    mapping(address => unit256) balances;

    constructor() {
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer(address to, unit256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough tokens");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function balanceOf(address account) external view returns (unit256) {
        return balances[account];
    }

}