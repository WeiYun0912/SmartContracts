// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallbackReceive {
    event Log(string funcName, address sender, uint256 value, bytes data);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }
}

contract sendEtherToFallbackReceive {
    FallbackReceive FR;

    constructor(address payable frAddress) {
        FR = FallbackReceive(frAddress);
    }

    function sendEther() public payable {
        (bool sent, ) = address(FR).call{value: 1 ether}(msg.data);
    }
}
