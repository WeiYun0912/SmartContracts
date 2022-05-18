// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Hack {
    event Log(string message);

    function deposit() public {
        emit Log("Hack..");
    }
}
