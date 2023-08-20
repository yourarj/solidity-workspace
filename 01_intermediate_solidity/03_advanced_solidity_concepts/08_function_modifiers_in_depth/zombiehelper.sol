// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "./zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {
    // function helper modifier to check zombie level
    modifier aboveLevel(uint _level, uint _zombieId) {
        require(zombies[_zombieId].level >= _level);
        _;
    }
}
