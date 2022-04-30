// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Features {
    function underflow() public pure returns (uint256) {
        uint256 a = 0;
        a--;
        return a;
    }

    function uncheckedUnderflow() public pure returns (uint256) {
        uint256 a = 0;
        unchecked {
            a--;
        }
        return a;
    }
}
