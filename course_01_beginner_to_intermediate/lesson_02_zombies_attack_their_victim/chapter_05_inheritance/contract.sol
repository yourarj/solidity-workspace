// The Following pragma specifies which solidity compiler to use
pragma solidity >=0.5.0 <0.6.0;

// ZombiFactory contract
contract ZombieFactory {
    // declare event
    event NewZombie(uint zombieId, string name, uint dna);

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

    // zombie to owner mapping
    mapping(uint => address) public zombieToOwner;

    // owner to number of zombies owned mapping
    mapping(address => uint) ownerZombieCount;

    // createZombie function declaration
    function _createZombie(string memory _name, uint _dna) private {
        // push zombie to array
        uint id = zombies.push(Zombie(_name, _dna));

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

// ZombiFeeding contract is inheriting from parent ZombiFactory
contract ZombieFeeding is ZombieFactory {

}
