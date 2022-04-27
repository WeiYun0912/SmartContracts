// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

contract game {
    mapping(address => uint8) rareTicket;

    function buyRareTicket(uint8 _amount) public {
        //spend 20 eth
        rareTicket[msg.sender] += _amount;
    }

    function useRareTicket(uint8 _amount) public {
        require(rareTicket[msg.sender] >= 1);
        rareTicket[msg.sender] -= _amount;
        //....
        //get rare treasure
    }

    function getRareTicketAmount() public view returns (uint8) {
        return rareTicket[msg.sender];
    }
}
