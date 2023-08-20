// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "./zombieattack.sol";
import "./erc721.sol";
import "./safemath.sol";

/// @title A contract that manages Zombie ownership transfer
/// @author Arjun
/// @dev OpenZeppelin ERC721 impl sec compliant
contract ZombieOwnership is ZombieAttack, ERC721 {
    // extend uint256 with safemath
    using SafeMath for uint256;

    //zombie approvals
    mapping(uint => address) zombieApprovals;

    // erc721 method balanceOf
    function balanceOf(
        address _owner
    ) external view override returns (uint256) {
        return ownerZombieCount[_owner];
    }

    // erc721 method ownerOf
    function ownerOf(
        uint256 _tokenId
    ) external view override returns (address) {
        return zombieToOwner[_tokenId];
    }

    function _transfer(address _from, address _to, uint256 _tokenId) private {
        ownerZombieCount[_to] = ownerZombieCount[_to].add(1);
        ownerZombieCount[_from] = ownerZombieCount[_from].sub(1);
        zombieToOwner[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    ) external payable override {
        require(
            zombieToOwner[_tokenId] == msg.sender ||
                zombieApprovals[_tokenId] == msg.sender
        );
        _transfer(_from, _to, _tokenId);
    }

    function approve(
        address _approved,
        uint256 _tokenId
    ) external payable override onlyOwnerOf(_tokenId) {
        zombieApprovals[_tokenId] = _approved;
        emit Approval(msg.sender, _approved, _tokenId);
    }
}
