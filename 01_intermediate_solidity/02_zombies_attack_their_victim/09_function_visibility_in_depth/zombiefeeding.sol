// SPDX-License-Identifier: MIT
// The Following pragma specifies which solidity compiler to use
pragma solidity 0.7.6;

// import zombie factory
import "./zombiefactory.sol";

// ZombiFeeding contract is inheriting from parent ZombiFactory
contract ZombieFeeding is ZombieFactory {
    function feedAndMultiply(uint _zombieId, uint _targetDna) public {
        require(msg.sender == zombieToOwner[_zombieId]);

        // here we need to specify the storage location of the retrieved zombie
        // here we are specifying that it will be pointer to zombie on blockchain
        Zombie storage myZombie = zombies[_zombieId];
        _targetDna = _targetDna % dnaModulus;
        uint newDna = (myZombie.dna + _targetDna) / 2;

        // following function is not available as it's local to zombiefactory contract
        _createZombie("NoName", newDna);
    }
}
