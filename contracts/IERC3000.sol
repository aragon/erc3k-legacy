/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.6.8;
pragma experimental ABIEncoderV2;

import "./ERC3000Data.sol";
import "./IERC3000Executor.sol";

abstract contract IERC3000 {
    function schedule(uint256 index, IERC3000Executor executor, ERC3000Data.Action[] memory actions, bytes memory proof) virtual public returns (bytes32 actionHash);
    event Scheduled(bytes32 indexed actionHash, address indexed actor, IERC3000Executor indexed executor, ERC3000Data.Action[] actions, bytes proof, uint256 index, uint256 executionTime, ERC3000Data.Collateral collateral);

    function execute(uint256 index, IERC3000Executor executor, ERC3000Data.Action[] memory actions) virtual public returns (bytes[] memory execResults);
    event Executed(bytes32 indexed actionHash, address indexed actor, IERC3000Executor indexed executor, bytes[] execResults, uint256 index);

    function challenge(bytes32 actionHash, bytes memory reason) virtual public;
    event Challenged(bytes32 indexed actionHash, address indexed actor, bytes reason, ERC3000Data.Collateral collateral);

    function veto(bytes32 actionHash, bytes memory reason) virtual public;
    event Vetoed(bytes32 indexed actionHash, address indexed actor, bytes reason, ERC3000Data.Collateral collateral);
}