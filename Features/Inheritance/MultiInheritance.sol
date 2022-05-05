// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    string public message1;

    constructor(string memory _message1) {
        message1 = _message1;
    }
}

contract B {
    string public message2;

    constructor(string memory _message2) {
        message2 = _message2;
    }
}

contract C is A("Hello World"), B("GoodbyeWorld") {
    // ... more function
}
