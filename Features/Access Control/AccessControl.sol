// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 使用者A -> ADMIN
//0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 使用者B -> USER

contract AccessControl {
    mapping(bytes32 => mapping(address => bool)) public roles;

    //0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    bytes32 public constant ADMIN = keccak256("ADMIN");

    //0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96
    bytes32 public constant USER = keccak256("USER");

    constructor(bytes32 _adminHash) {
        roles[_adminHash][msg.sender] = true;
    }

    modifier onlyAdmin(bytes32 _adminHash) {
        require(roles[_adminHash][msg.sender], "Not Authorzied");
        _;
    }

    function grantRole(bytes32 _roleHash, address _account)
        external
        onlyAdmin(ADMIN)
    {
        roles[_roleHash][_account] = true;
    }

    function revokeRole(bytes32 _roleHash, address _account)
        external
        onlyAdmin(ADMIN)
    {
        roles[_roleHash][_account] = false;
    }
}
