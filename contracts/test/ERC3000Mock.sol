/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.6.8;
pragma experimental ABIEncoderV2;

import "../ERC3000.sol";

contract ERC3000Mock is ERC3000 {
    function schedule(uint256, address, ERC3000Data.Action[] memory, bytes memory) override public returns (bytes32) {

    }

    function execute(uint256, address, ERC3000Data.Action[] memory) override public returns (bytes[] memory) {

    }

    function challenge(bytes32, bytes memory) override public {

    }

    function veto(bytes32, bytes memory) override public {

    }

    function interfaceID() public pure returns (bytes4) {
        return ERC3000_INTERFACE_ID;
    }
}
