// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

interface CallerContractInterface {
    function callback(uint256 _ethPrice, uint256 id) external;
}
