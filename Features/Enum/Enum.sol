// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Enum{
    enum Status {
        None, // 0
        Pending, // 1
        Shipping, // 2
        Completed, // 3
        Canceled // 4
    }

    struct buyer {
        address buyerAddress;
        Status status;
    }

    mapping(address => buyer) public buyerOrderInfo;

    function placeAnOrder(address buyerAddress) public {
        require(buyerOrderInfo[buyerAddress].status == Status.None, "Order Status Error");
        buyerOrderInfo[buyerAddress].status = Status.Pending;
    }

    function orderShipping(address buyerAddress) public {
        require(buyerOrderInfo[buyerAddress].status == Status.Pending,"Order Status Error");
        buyerOrderInfo[buyerAddress].status = Status.Shipping;
    }

    function orderCompleted(address buyerAddress) public {
        require(buyerOrderInfo[buyerAddress].status == Status.Shipping, "Order Status Error");
        buyerOrderInfo[buyerAddress].status = Status.Completed;
    }

    function orderCanceled(address buyerAddress) public {
        require(buyerOrderInfo[buyerAddress].status == Status.Pending, "Order Status Error");
        buyerOrderInfo[buyerAddress].status = Status.Canceled;
    }
}
