// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExternalVisbility {
    string public message;

    function setMessage(string memory _message) external {
        message = _message;
    }
    // can't use
    // function useExternalFunc() public {
    //     setMessage("Hello");
    // }
}

// can't use
// contract ChildContract is ExternalVisbility {
//     function changeMessage(string memory _message) public{
//         ExternalVisbility.setMessage(_message);
//     }
// }

contract OutsideContract {
    ExternalVisbility V;

    constructor(address _externalVisbilityAddress) {
        V = ExternalVisbility(_externalVisbilityAddress);
        V.setMessage("Hello");
    }
}
