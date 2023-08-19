pragma solidity >=0.5.0 <0.6.0;

import "./zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {
    // define levelUpFee
    uint levelUpFee = 0.001 ether;

    // function helper modifier to check zombie level
    modifier aboveLevel(uint _level, uint _zombieId) {
        require(zombies[_zombieId].level >= _level);
        _;
    }

    // withdraw ether owneb by smart contract to owner account
    function withdraw() external onlyOwner {
        address payable _owner = address(uint160(owner()));
        _owner.transfer(address(this).balance);
    }

    // update levelUpFee
    function setLevelUpFee(uint _fee) external onlyOwner {
        levelUpFee = _fee;
    }

    // allow user to levelUp zombie by paying levelUp amount
    function levelUp(uint _zombieId) external payable {
        require(msg.value == levelUpFee);
        zombies[_zombieId].level++;
    }

    // cnageName function provided zombie level is > 2
    function changeName(
        uint _zombieId,
        string calldata _newName
    ) external aboveLevel(2, _zombieId) ownerOf(_zombieId) {
        zombies[_zombieId].name = _newName;
    }

    // changeDna function provided zombie level > 20
    function changeDna(
        uint _zombieId,
        uint _newDna
    ) external aboveLevel(20, _zombieId) ownerOf(_zombieId) {
        zombies[_zombieId].dna = _newDna;
    }

    // external view function
    function getZombiesByOwner(
        address _owner
    ) external view returns (uint[] memory) {
        // defining array in memory
        uint[] memory result = new uint[](ownerZombieCount[_owner]);
        uint counter = 0;
        for (uint i = 0; i < zombies.length; i++) {
            if (zombieToOwner[i] == _owner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }
}
