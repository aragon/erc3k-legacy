pragma solidity ^0.6.8;
pragma experimental ABIEncoderV2;

// SPDX-License-Identifier: MIT

interface IERC3000 {
    struct Action {
        address to;
        uint256 value;
        bytes data;
    }

    function schedule(Action[] calldata actions, bytes calldata proof) external returns (bytes32 actionHash);
    event Scheduled(bytes32 indexed actionHash, Action[] actions, bytes proof);

    function execute(bytes32 actionHash, Action[] calldata actions) external returns (bytes[] memory execResults);
    event Executed(bytes32 indexed actionHash, bytes execResults);

    function challenge(bytes32 actionHash, bytes calldata reason) external;
    event Challenged(bytes32 indexed actionHash, bytes reason);

    function veto(bytes32 actionHash, bytes calldata reason) external;
    event Vetoed(bytes32 indexed actionHash, bytes reason);

    function dictatorExecute(Action[] calldata actions, bytes calldata reason) external returns (bytes[] memory execResults);
    event DictatorExecuted(Action[] actions, bytes reason, bytes execResults);
}

abstract contract ERC3000 is IERC3000 {
    function is3k() external pure returns (bool) {
        return true;
    }
}
