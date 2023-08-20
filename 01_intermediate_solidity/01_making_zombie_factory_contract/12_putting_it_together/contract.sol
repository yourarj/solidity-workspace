// SPDX-License-Identifier: MIT
// The Following pragma specifies which solidity compiler to use
pragma solidity 0.7.6;

// ZombiFactory contract
contract ZombieFactory {
    // following state variables dnaDigits will be permanently stored to blockchain
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    // defining custom type Zombie
    struct Zombie {
        string name;
        uint dna;
    }

    // zombie army
    // defining zombies public instructs solidity to create getter
    Zombie[] public zombies;

    // createZombie function declaration
    function _createZombie(string memory _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
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
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}
