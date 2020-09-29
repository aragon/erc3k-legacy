/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.6.8;
pragma experimental ABIEncoderV2;

import "./ERC3000Data.sol";
import "./IERC3000Executor.sol";

abstract contract IERC3000 {
    function schedule(ERC3000Data.Container memory container, bytes memory proof) virtual public returns (bytes32 actionHash);
    event Scheduled(bytes32 indexed containerHash, ERC3000Data.Payload payload, bytes proof, uint256 executionTime, ERC3000Data.Collateral collateral);

    function execute(ERC3000Data.Container memory container) virtual public returns (bytes[] memory execResults);
    event Executed(bytes32 indexed containerHash, address indexed actor, bytes[] execResults);

    function challenge(bytes32 payloadHash, ERC3000Data.Config memory config, bytes memory reason) virtual public;
    event Challenged(bytes32 indexed containerHash, address indexed actor, bytes reason, ERC3000Data.Collateral collateral);

    function veto(bytes32 payloadHash, ERC3000Data.Config memory config, bytes memory reason) virtual public;
    event Vetoed(bytes32 indexed containerHash, address indexed actor, bytes reason, ERC3000Data.Collateral collateral);

    function configure(ERC3000Data.Config memory config) virtual public returns (bytes32 configHash);
    event Configured(bytes32 indexed containerHash, address indexed actor, ERC3000Data.Config config);
}