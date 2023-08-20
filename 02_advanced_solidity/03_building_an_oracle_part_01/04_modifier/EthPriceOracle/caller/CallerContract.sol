// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;
import "./EthPriceOracleInterface.sol";
import "openzeppelin-solidity/contracts/access/Ownable.sol";
contract CallerContract is Ownable {
    EthPriceOracleInterface private oracleInstance;
    address private oracleAddress;
    event newOracleAddressEvent(address oracleAddress);
    function setOracleInstanceAddress (address _oracleInstanceAddress) public onlyOwner {
      oracleAddress = _oracleInstanceAddress;
      oracleInstance = EthPriceOracleInterface(oracleAddress);
      emit newOracleAddressEvent(oracleAddress);
    }
}
