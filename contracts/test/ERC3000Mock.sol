/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.6.8;
pragma experimental ABIEncoderV2;

import "../ERC3000.sol";

contract ERC3000Mock is ERC3000 {
    function schedule(Action[] calldata, bytes calldata) override external payable returns (bytes32) {

    }

    function execute(bytes32, Action[] calldata) override external returns (bytes[] memory) {

    }

    function challenge(bytes32, bytes calldata) override external payable {

    }

    function veto(bytes32, bytes calldata) override external payable {

    }

    function interfaceID() external pure returns (bytes4) {
        return ERC3000_INTERFACE_ID;
    }
}
