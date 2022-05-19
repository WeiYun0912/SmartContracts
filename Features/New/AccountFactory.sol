// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Account {
    address public bank;
    address public owner;

    constructor(address _owner) payable {
        bank = msg.sender;
        owner = _owner;
    }
}

contract AccountFactory {
    Account[] public accounts;

    function createAddressContract(address _owner) external payable {
        Account account = new Account{value: 0.1 ether}(_owner);
        accounts.push(account);
    }
}
