// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    string public message;

    constructor(string memory _message) {
        message = _message;
    }

    function sayHello() public pure virtual returns (string memory) {
        return "Hello";
    }

    function sayGoodbye() public pure returns (string memory) {
        return "Goodbye";
    }

    //.... more function
}

contract B is A("Wei") {
    function sayHelloWorld() public pure returns (string memory) {
        return "Hello World";
    }

    function sayHello() public pure override returns (string memory) {
        return "Hello Hello";
    }
}
