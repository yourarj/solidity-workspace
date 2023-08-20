// SPDX-License-Identifier: MIT
// The Following pragma specifies which solidity compiler to use
pragma solidity 0.7.6;

// import zombie factory
import "./zombiefactory.sol";

// following is an interface to interact with CryptoKitty contract
contract KittyInterface {
    function getKitty(
        uint256 _id
    )
        external
        view
        returns (
            bool isGestating,
            bool isReady,
            uint256 cooldownIndex,
            uint256 nextActionAt,
            uint256 siringWithId,
            uint256 birthTime,
            uint256 matronId,
            uint256 sireId,
            uint256 generation,
            uint256 genes
        );
}

// ZombiFeeding contract is inheriting from parent ZombiFactory
contract ZombieFeeding is ZombieFactory {
    // address of CryptoKitty Smart Contract
    address ckAddress = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;
    
    // initialize KittyInterface
    KittyInterface kittyContract = KittyInterface(ckAddress);

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
