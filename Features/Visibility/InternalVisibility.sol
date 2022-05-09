// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InternalVisbility {
    string public message;

    function setMessage(string memory _message) internal {
        message = _message;
    }

    function useExternalFunc() public {
        setMessage("Hello");
    }
}

contract ChildContract is InternalVisbility {
    function changeMessage(string memory _message) public {
        InternalVisbility.setMessage(_message);
    }
}

// can't use
// contract OutsideContract {
//     InternalVisbility V;
//     constructor(address _internalVisbilityAddress) {
//         V = InternalVisbility(_internalVisbilityAddress);
//         V.setMessage("Hello");
//     }
// }
