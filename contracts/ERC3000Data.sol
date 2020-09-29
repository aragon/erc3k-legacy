/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.6.8;

library ERC3000Data {
    struct Action {
        address to;
        uint256 value;
        bytes data;
    }

    struct Collateral {
        address token;
        uint256 amount;
    }
}
