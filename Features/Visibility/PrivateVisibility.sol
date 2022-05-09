// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrivateVisbility {
    string private message;

    function setMessage(string memory _message) private {
        message = _message;
    }

    function usePrivateFunc() public {
        setMessage("Hello");
    }
}

// can't use
// contract ChildContract is PrivateVisbility {
//     function changeMessage(string memory _message) public{
//         PrivateVisbility.setMessage(_message);
//     }
// }

// can't use
// contract OutsideContract {
//     PrivateVisbility V;
//     constructor(address _privateVisbilityAddress) {
//         V = PrivateVisbility(_privateVisbilityAddress);
//         V.setMessage("Hello");
//     }
// }
