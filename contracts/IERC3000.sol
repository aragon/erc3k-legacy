/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.6.8;
pragma experimental ABIEncoderV2;

import "./ERC3000Data.sol";

abstract contract IERC3000 is ERC3000Data {
    function schedule(uint256 index, address executor, Action[] memory actions, bytes memory proof) virtual public returns (bytes32 actionHash);
    event Scheduled(bytes32 indexed actionHash, address indexed actor, address indexed executor, Action[] actions, bytes proof, uint256 index, uint256 executionTime, Collateral collateral);

    function execute(uint256 index, address executor, Action[] memory actions) virtual public returns (bytes[] memory execResults);
    event Executed(bytes32 indexed actionHash, address indexed actor, address indexed executor, bytes[] execResults, uint256 index);

    function challenge(bytes32 actionHash, bytes memory reason) virtual public;
    event Challenged(bytes32 indexed actionHash, address indexed actor, bytes reason, Collateral collateral);

    function veto(bytes32 actionHash, bytes memory reason) virtual public;
    event Vetoed(bytes32 indexed actionHash, address indexed actor, bytes reason, Collateral collateral);
}