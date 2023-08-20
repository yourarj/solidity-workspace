// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "./zombiehelper.sol";

contract ZombieAttack is ZombieHelper {
    // random nonce for the smart contract
    uint randNonce = 0;

    // get random number
    function randMod(uint _modulus) internal returns (uint) {
        randNonce++;
        return
            uint(
                keccak256(
                    abi.encodePacked(block.timestamp, msg.sender, randNonce)
                )
            ) % _modulus;
    }
}
