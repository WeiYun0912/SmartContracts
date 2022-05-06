// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestCall {
    uint public number;

    function giveYouNumber(uint _number) external payable returns(bool,uint){
        number = _number;
        return(true,number);
    }
}

contract CallFunction{
    bytes public data;
    function callGiveYouNumber(address _test) external payable {
        (bool success,bytes memory _data) = _test.call{value : 111}(abi.encodeWithSignature(
            "giveYouNumber(uint256)",123
        ));
        require(success, "call failed");
        data = _data;
    }
    
    function decodeResult(bytes memory result) external pure returns(bool,uint){
        (bool success,uint256 number) = abi.decode(result,(bool,uint));
        return (success,number);
    }
}

