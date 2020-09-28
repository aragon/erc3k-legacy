/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.6.8;
pragma experimental ABIEncoderV2;

import "./ERC3000Data.sol";

abstract contract IERC3000 is ERC3000Data {
    function schedule(Action[] calldata actions, bytes calldata proof) virtual external payable returns (bytes32 actionHash);
    event Scheduled(bytes32 indexed actionHash, address actor, Action[] actions, bytes proof, uint256 executionTime, Collateral collateral);

    function execute(bytes32 actionHash, Action[] calldata actions) virtual external returns (bytes[] memory execResults);
    event Executed(bytes32 indexed actionHash, address actor, bytes execResults);

    function challenge(bytes32 actionHash, bytes calldata reason) virtual external payable;
    event Challenged(bytes32 indexed actionHash, address actor, bytes reason, Collateral collateral);

    function veto(bytes32 actionHash, bytes calldata reason) virtual external payable;
    event Vetoed(bytes32 indexed actionHash, address actor, bytes reason, Collateral collateral);
}