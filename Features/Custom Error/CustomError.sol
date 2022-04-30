// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomError {
    address payable owner = payable(msg.sender);

    error Unauthorized(address caller, string message);

    function withdraw() public {
        if (msg.sender != owner) {
            revert Unauthorized(msg.sender, "You are not owner!!!");
        }

        owner.transfer(address(this).balance);
    }
}
