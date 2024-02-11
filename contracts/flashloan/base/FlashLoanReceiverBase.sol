pragma solidity ^0.8.24;

import "../../../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "../../../lib/openzeppelin-contracts/contracts/token/ERC20/utils/SafeERC20.sol";
import "../interfaces/IFlashLoanReceiver.sol";
import "../../interfaces/ILendingPoolAddressesProvider.sol";
import "../../libraries/EthAddressLib.sol";

abstract contract FlashLoanReceiverBase is IFlashLoanReceiver {

    using SafeERC20 for IERC20;

    ILendingPoolAddressesProvider public addressesProvider;

    constructor(ILendingPoolAddressesProvider _provider) {
        addressesProvider = _provider;
    }

    fallback () external payable {
    }

    function transferFundsBackToPoolInternal(address _reserve, uint256 _amount) internal {

        address payable core = addressesProvider.getLendingPoolCore();

        transferInternal(core,_reserve, _amount);
    }

    function transferInternal(address payable _destination, address _reserve, uint256  _amount) internal {
        if(_reserve == EthAddressLib.ethAddress()) {
            //solium-disable-next-line
            _destination.call{value: _amount}("");
            return;
        }

        IERC20(_reserve).safeTransfer(_destination, _amount);


    }

    function getBalanceInternal(address _target, address _reserve) internal view returns(uint256) {
        if(_reserve == EthAddressLib.ethAddress()) {

            return _target.balance;
        }

        return IERC20(_reserve).balanceOf(_target);

    }
}