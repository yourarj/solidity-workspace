// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "./zombiehelper.sol";

contract ZombieAttack is ZombieHelper {
    // attacker victory probability
    uint attackVictoryProbability = 70;

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

    // attack on target
    function attack(
        uint _zombieId,
        uint _targetId
    ) external ownerOf(_zombieId) {
        // fetch pointers to fighting zombies
        Zombie storage myZombie = zombies[_zombieId];
        Zombie storage enemyZombie = zombies[_targetId];

        uint rand = randMod(100);
    }
}
