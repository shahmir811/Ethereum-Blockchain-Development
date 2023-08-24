// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract ExampleStruct {

    struct PaymentReceivedStruct {
        address from;
        uint amount;
    }

    PaymentReceivedStruct public payment;

    function payContract() public payable {
        payment.from = msg.sender;
        payment.amount = msg.value;
    }



}