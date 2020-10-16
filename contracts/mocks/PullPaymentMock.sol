// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../payment/PullPayment.sol";
import "../Initializable.sol";

// mock class using PullPayment
contract PullPaymentMockUpgradeSafe is Initializable, PullPaymentUpgradeSafe {

    constructor() public payable {
        __PullPaymentMock_init();
    }

    function __PullPaymentMock_init() internal initializer {
        __PullPayment_init_unchained();
        __PullPaymentMock_init_unchained();
    }

    function __PullPaymentMock_init_unchained() internal initializer {


    }


    // test helper function to call asyncTransfer
    function callTransfer(address dest, uint256 amount) public {
        _asyncTransfer(dest, amount);
    }

    uint256[50] private __gap;
}
