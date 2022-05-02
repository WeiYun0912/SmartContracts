// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionDestructor {
    function returnMany()
        public
        pure
        returns (
            uint256,
            address,
            bool
        )
    {
        return (100, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, true);
    }

    function calculation(uint256 x, uint256 y)
        public
        pure
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        uint256 z = x + y;
        return (x, y, z);
    }

    function getResult() public pure returns (uint256) {
        (, , uint256 result) = calculation(1, 2);
        return result;
    }

    function powerful() public pure returns (address) {
        (, address sender, ) = returnMany();
        return sender;
    }

    function destructingAssigments()
        public
        pure
        returns (
            uint256,
            address,
            bool
        )
    {
        (uint256 num, address sender, bool b) = returnMany();
        return (num, sender, b);
    }
}
