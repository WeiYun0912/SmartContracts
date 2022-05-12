// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payable {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() public payable {}

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
