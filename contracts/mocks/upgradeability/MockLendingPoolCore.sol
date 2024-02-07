pragma solidity ^0.8.24;

import "openzeppelin-solidity/contracts/token/ERC20/utils/SafeERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/utils/Address.sol";
import "../../libraries/openzeppelin-upgradeability/VersionedInitializable.sol";

import "../../libraries/CoreLibrary.sol";
import "../../configuration/LendingPoolAddressesProvider.sol";
import "../../interfaces/ILendingRateOracle.sol";
import "../../interfaces/IReserveInterestRateStrategy.sol";
import "../../libraries/WadRayMath.sol";

import "../../lendingpool/LendingPoolCore.sol";

/*************************************************************************************
* @title MockLendingPoolCore contract
* @author Aave
* @notice This is a mock contract to test upgradeability of the AddressProvider
 *************************************************************************************/

contract MockLendingPoolCore is LendingPoolCore {

    event ReserveUpdatedFromMock(uint256 indexed revision);

    function getRevision() internal pure override returns(uint256) {
        return 0x5;
    }

    function initialize(LendingPoolAddressesProvider _addressesProvider) public override initializer {
        addressesProvider = _addressesProvider;
        refreshConfigInternal();
    }

    function updateReserveInterestRatesAndTimestampInternal(address _reserve, uint256 _liquidityAdded, uint256 _liquidityTaken)
        internal override
    {
        super.updateReserveInterestRatesAndTimestampInternal(_reserve, _liquidityAdded, _liquidityTaken);

        emit ReserveUpdatedFromMock(getRevision());

    }
}
