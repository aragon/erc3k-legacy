/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.6.8;
pragma experimental ABIEncoderV2;

import "../ERC3000.sol";

contract ERC3000Mock is ERC3000 {
    function schedule(address, Action[] calldata, uint256, bytes calldata) override external returns (bytes32) {

    }

    function execute(bytes32, address, Action[] calldata, uint256) override external returns (bytes[] memory) {

    }

    function challenge(bytes32, bytes calldata) override external {

    }

    function veto(bytes32, bytes calldata) override external {

    }

    function interfaceID() external pure returns (bytes4) {
        return ERC3000_INTERFACE_ID;
    }
}
