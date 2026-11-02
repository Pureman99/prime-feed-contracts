// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract RhPrimeFeed {
    uint256 public latestQuote;
    uint256 public updatedAtBlock;
    address public immutable feedPublisher;

    event PrimeQuotePushed(uint256 indexed quote, uint256 blockNumber);

    constructor(uint256 _initialQuote) {
        feedPublisher = msg.sender;
        latestQuote = _initialQuote;
        updatedAtBlock = block.number;
    }

    function pushPrimeQuote(uint256 _quote) external {
        latestQuote = _quote;
        updatedAtBlock = block.number;
        emit PrimeQuotePushed(_quote, block.number);
    }
}
