/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.6.8;
pragma experimental ABIEncoderV2;

interface IERC3000 {
    struct Action {
        address to;
        uint256 value;
        bytes data;
    }

    struct Collateral {
        address token;
        uint256 amount;
    }

    function schedule(Action[] calldata actions, bytes calldata proof) external payable returns (bytes32 actionHash);
    event Scheduled(bytes32 indexed actionHash, address actor, Action[] actions, bytes proof, uint256 executionTime, Collateral collateral);

    function execute(bytes32 actionHash, Action[] calldata actions) external returns (bytes[] memory execResults);
    event Executed(bytes32 indexed actionHash, address actor, bytes execResults);

    function challenge(bytes32 actionHash, bytes calldata reason) external payable;
    event Challenged(bytes32 indexed actionHash, address actor, bytes reason, Collateral collateral);

    function veto(bytes32 actionHash, bytes calldata reason) external payable;
    event Vetoed(bytes32 indexed actionHash, address actor, bytes reason, Collateral collateral);
}