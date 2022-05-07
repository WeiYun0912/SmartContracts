// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataLocation {
    struct User {
        string name;
        uint256 balance;
    }

    mapping(address => User) public users;

    function addUserBalance(uint256 _balance) public {
        User storage user = users[msg.sender];
        user.balance += _balance;
    }

    function checkUserBalance() public view returns (bool) {
        User memory user = users[msg.sender];
        if (user.balance > 0) {
            return true;
        }
        return false;
    }

    //51880 gas
    function changeUserNameMemory(string memory _name) public {
        User storage user = users[msg.sender];
        user.name = _name;
    }

    //51301 gas
    function changeUserNameCalldata(string calldata _name) public {
        User storage user = users[msg.sender];
        user.name = _name;
    }
}
