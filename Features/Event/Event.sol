// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Event {
    event Log(string message, uint256 value);
    event Transfer(address indexed sender, uint256 value);

    function triggerEvent() external {
        //do something...
        emit Log("Hello World", 912);
    }

    function sendSomeToken(uint256 _value) public {
        emit Transfer(msg.sender, _value);
    }
}
