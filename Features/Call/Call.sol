// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestCall {
    uint256 public number;

    function giveYouNumber(uint256 _number)
        external
        payable
        returns (bool, uint256)
    {
        number = _number;
        return (true, number);
    }
}

contract CallFunction {
    bytes public data;

    function callGiveYouNumber(address _test) external payable {
        (bool success, bytes memory _data) = _test.call{value: 111}(
            abi.encodeWithSignature("giveYouNumber(uint256)", 123)
        );
        require(success, "call failed");
        data = _data;
    }

    function callGiveYouNumberSelector(address _test) external payable {
        (bool success, bytes memory _data) = _test.call{value: 111}(
            abi.encodeWithSelector(TestCall.giveYouNumber.selector, 123)
        );
        require(success, "call failed");
        data = _data;
    }

    function decodeResult(bytes memory result)
        external
        pure
        returns (bool, uint256)
    {
        (bool success, uint256 number) = abi.decode(result, (bool, uint256));
        return (success, number);
    }
}

contract CallPayable {
    function giveEther(address _receive) external payable {
        (bool success, ) = _receive.call{value: msg.value}("");
        require(success, "Fail to send ether.");
    }
}
