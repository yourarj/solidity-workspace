pragma solidity >=0.5.0 <0.6.0;

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
            uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) %
            _modulus;
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
