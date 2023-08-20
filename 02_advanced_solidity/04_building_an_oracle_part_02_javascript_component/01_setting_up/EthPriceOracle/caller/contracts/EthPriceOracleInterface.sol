// SPDX-License-Identifier: MIT 
pragma solidity 0.7.6;

interface EthPriceOracleInterface {
    function getLatestEthPrice() external returns (uint256);
}
