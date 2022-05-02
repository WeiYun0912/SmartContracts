// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Enum {
    enum Status {
        None,
        Pending,
        Shipped,
        Completed,
        Canceled
    }

    struct buyer {
        address buyerAddress;
        Status status;
    }

    mapping(address => buyer) buyerOrderInfo;

    function placeAnOrder(address buyerAddress) public {
        require(
            buyerOrderInfo[buyerAddress].status == Status.None,
            "Order Status Error"
        );
        buyerOrderInfo[buyerAddress].status = Status.Pending;
    }

    function orderShipping(address buyerAddress) public {
        require(
            buyerOrderInfo[buyerAddress].status == Status.Pending,
            "Order Status Error"
        );
        buyerOrderInfo[buyerAddress].status = Status.Shipped;
    }

    function orderCompleted(address buyerAddress) public {
        require(
            buyerOrderInfo[buyerAddress].status == Status.Shipped,
            "Order Status Error"
        );
        buyerOrderInfo[buyerAddress].status = Status.Completed;
    }

    function orderCanceled(address buyerAddress) public {
        require(
            buyerOrderInfo[buyerAddress].status == Status.Canceled,
            "Order Status Error"
        );
        buyerOrderInfo[buyerAddress].status = Status.Canceled;
    }
}
