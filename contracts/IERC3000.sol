/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.6.8;
pragma experimental ABIEncoderV2;

import "./ERC3000Data.sol";

abstract contract IERC3000 is ERC3000Data {
    function schedule(address executor, Action[] calldata actions, uint256 nonce, bytes calldata proof) virtual external returns (bytes32 actionHash);
    event Scheduled(bytes32 indexed actionHash, address indexed actor, address indexed executor, Action[] actions, bytes proof, uint256 executionTime, Collateral collateral);

    function execute(bytes32 actionHash, address executor, Action[] calldata actions, uint256 nonce) virtual external returns (bytes[] memory execResults);
    event Executed(bytes32 indexed actionHash, address indexed actor, address indexed executor, bytes execResults);

    function challenge(bytes32 actionHash, bytes calldata reason) virtual external;
    event Challenged(bytes32 indexed actionHash, address indexed actor, bytes reason, Collateral collateral);

    function veto(bytes32 actionHash, bytes calldata reason) virtual external;
    event Vetoed(bytes32 indexed actionHash, address indexed actor, bytes reason, Collateral collateral);
}