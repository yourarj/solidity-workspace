// SPDX-License-Identifier: MIT
// The Following pragma specifies which solidity compiler to use
pragma solidity 0.7.6;

// import ownable
import "./ownable.sol";

// ZombiFactory contract
contract ZombieFactory is Ownable {
    // declare event
    event NewZombie(uint zombieId, string name, uint dna);

    // following state variables dnaDigits will be permanently stored to blockchain
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    uint cooldownTime = 1 days;

    // defining custom type Zombie
    struct Zombie {
        string name;
        uint dna;
        uint32 level;
        uint32 readyTime;
        uint16 winCount;
        uint16 lossCount;
    }

    // zombie army
    // defining zombies public instructs solidity to create getter
    Zombie[] public zombies;

    // zombie to owner mapping
    mapping(uint => address) public zombieToOwner;

    // owner to number of zombies owned mapping
    mapping(address => uint) ownerZombieCount;

    // createZombie function declaration
    function _createZombie(string memory _name, uint _dna) internal {
        // push zombie to array
        uint id = zombies.push(
            Zombie(_name, _dna, 1, uint32(block.timestamp + cooldownTime), 0, 0)
        ) - 1;

        // add zombie id to owner mapping
        zombieToOwner[id] = msg.sender;

        // add owner count
        ownerZombieCount[msg.sender]++;

        // emit the event
        emit NewZombie(id, _name, _dna);
    }

    // view function
    function _generateRandomDna(
        string memory _str
    ) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    // a public function with which outer world can interact
    // to create a new random zombie
    function createRandomZombie(string memory _name) public {
        // only allow further execution if the invoker doesn't have any zombie yet
        require(ownerZombieCount[msg.sender] == 0);

        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}
