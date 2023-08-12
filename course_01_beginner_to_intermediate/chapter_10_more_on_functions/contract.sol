// The Following pragma specifies which solidity compiler to use
pragma solidity >=0.5.0 <0.6.0;

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
    function createZombie(string memory _name, uint _dna) public {}

    // view function
    function _generateRandomDna(string memory _str) private view returns (uint) {}
}
