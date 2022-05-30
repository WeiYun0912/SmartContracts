// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestDelegateCall {
    address public owner;
    uint256 public num;
    address public sender;

    function setVars(uint256 _num) public {
        num = _num * 2;
        sender = msg.sender;
    }
}

contract DelegateCall {
    uint256 public num;
    address public sender;

    function callSetVars(address _contract, uint256 _num) public {
        (bool success, ) = _contract.delegatecall(
            abi.encodeWithSelector(TestDelegateCall.setVars.selector, _num)
        );
        require(success, "Fail to execute delegatecall");
    }
}
