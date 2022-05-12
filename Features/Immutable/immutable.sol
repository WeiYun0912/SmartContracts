// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Immutable {
    address public immutable owner = msg.sender;
    int256 public number;

    function changeNumber() public {
        require(owner == msg.sender);
        number += 1;
    }

    // address public immutable admin;

    //or

    // constructor() {
    //     admin = msg.sender;
    // }

    // can't use
    // function setImmutableValue() public {
    //     admin = msg.sender;
    // }
}
