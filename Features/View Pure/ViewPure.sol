// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ViewPure {
    uint256 public num = 10;

    function viewFunction() external view returns (uint256) {
        return num;
    }

    function pureFunction() external pure returns (bool) {
        return true;
    }

    function addToNum(uint256 num2) external view returns (uint256) {
        return num + num2;
    }

    function add(uint256 x, uint256 y) external pure returns (uint256) {
        return x + y;
    }
}
