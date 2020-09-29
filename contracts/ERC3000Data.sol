/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.6.8;

import "./IERC3000Executor.sol";

library ERC3000Data {
    // TODO: come up with a non-shitty name
    struct Container {
        Payload payload;
        Config config;
    }

    struct Payload {
        uint256 nonce;
        address submitter;
        IERC3000Executor executor;
        Action[] actions;
    }

    struct Action {
        address to;
        uint256 value;
        bytes data;
    }

    struct Config {
        uint256 executionDelay;
        Collateral scheduleDeposit;
        Collateral challengeDeposit;
        Collateral vetoDeposit;
        bytes rules;
    }

    struct Collateral {
        address token;
        uint256 amount;
    }
}
