// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherStore {
    function sendEther() public {
        (bool success, ) = msg.sender.call{value: 1 ether}("");
        require(success, "Failed to send ether.");
    }

    function deposit() public payable {}
}

contract Dos {
    EtherStore store;

    constructor(EtherStore _store) {
        store = EtherStore(_store);
    }

    function callSendEther() public {
        store.sendEther();
    }

    // fallback() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
