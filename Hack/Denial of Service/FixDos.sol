pragma solidity ^0.8.0;

contract KingOfEther {
    address public king;
    uint256 public balance;
    mapping(address => uint256) public balances;

    function claimThrone() external payable {
        require(msg.value > balance, "Not enough ether.");

        balances[king] += balance;

        king = msg.sender;
        balance = msg.value;
    }

    function withdraw() public {
        require(msg.sender != king, "Current king cannot withdraw");

        uint256 amount = balances[msg.sender];
        balances[msg.sender] = 0;

        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");
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
