// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VariableTypeGas {
    uint8 public a;
    uint256 public b;
    int8 public c;
    int256 public d;

    function changeValueForUint8() public {
        a = 1;
    }

    function changeValueForUint256() public {
        b = 1;
    }

    function changeValueForInt8() public {
        c = 1;
    }

    function changeValueForInt256() public {
        d = 1;
    }
}
