// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Visbility {
    string public message;

    function setMessage(string memory _message) public {
        message = _message;
    }
}

contract ChildContract is Visbility {
    function changeMessage(string memory _message) public {
        Visbility.setMessage(_message);
    }
}

contract OutsideContract {
    Visbility V;

    constructor(address _visbilityAddress) {
        V = Visbility(_visbilityAddress);
        V.setMessage("Hello");
    }
}
