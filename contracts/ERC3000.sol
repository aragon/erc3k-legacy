/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.6.8;
pragma experimental ABIEncoderV2;

import "./lib/erc165/ERC165.sol";

import "./IERC3000.sol";

abstract contract ERC3000 is IERC3000, ERC165 {
    bytes4 internal constant ERC3000_INTERFACE_ID =
        this.schedule.selector
        ^ this.execute.selector
        ^ this.challenge.selector
        ^ this.veto.selector
    ;

    function supportsInterface(bytes4 _interfaceId) override public pure returns (bool) {
        return _interfaceId == ERC3000_INTERFACE_ID || super.supportsInterface(_interfaceId);
    }
}
