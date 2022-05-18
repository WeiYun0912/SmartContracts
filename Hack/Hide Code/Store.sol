// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Store {
    event Log(string message);

    function deposit() public {
        emit Log("Store..");
    }
}

contract A {
    Store store;

    constructor(address _store) {
        store = Store(_store);
    }

    function callStore() public {
        store.deposit();
    }
}

// Fixed:
contract B {
    Store public store;

    constructor() {
        store = new Store();
    }

    function callStore() public {
        store.deposit();
    }
}
