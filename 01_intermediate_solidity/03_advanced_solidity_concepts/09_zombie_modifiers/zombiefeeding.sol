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
    // KittyInterface declaration
    KittyInterface kittyContract;

    // onlyOwner modifier
    function setKittyContractAddress(address _address) external onlyOwner {
        kittyContract = KittyInterface(_address);
    }

    // trigger cooldown for specified zombie
    // here _zombie is reference to storage zombie
    function _triggerCooldown(Zombie storage _zombie) internal {
        _zombie.readyTime = uint32(block.timestamp + cooldownTime);
    }

    // check if zombie pointed by reference is ready
    function _isReady(Zombie storage _zombie) internal view returns (bool) {
        return (_zombie.readyTime <= block.timestamp);
    }

    // feedAndMultiply
    function feedAndMultiply(
        uint _zombieId,
        uint _targetDna,
        string memory _species
    ) internal {
        // make sure the caller is owner of contract
        require(msg.sender == zombieToOwner[_zombieId]);

        // here we need to specify the storage location of the retrieved zombie
        // here we are specifying that it will be pointer to zombie on blockchain
        Zombie storage myZombie = zombies[_zombieId];

        // make sure zombie is ready
        require(_isReady(myZombie));

        _targetDna = _targetDna % dnaModulus;
        uint newDna = (myZombie.dna + _targetDna) / 2;

        if (
            keccak256(abi.encodePacked(_species)) ==
            keccak256(abi.encodePacked("kitty"))
        ) {
            newDna = newDna - (newDna % 100) + 99;
        }
        // following function is not available as it's local to zombiefactory contract
        _createZombie("NoName", newDna);

        // trigger cooldown
        _triggerCooldown(myZombie);
    }

    function feedOnKitty(uint _zombieId, uint _kittyId) public {
        // declare val type you want
        uint kittyDna;
        // ignore everything else with blanks
        (, , , , , , , , , kittyDna) = kittyContract.getKitty(_kittyId);
        // And modify function call here:
        feedAndMultiply(_zombieId, kittyDna, "kitty");
    }
}
