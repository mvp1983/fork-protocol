pragma solidity ^0.8.24;


import "./MintableERC20.sol";


contract MockUSDT is MintableERC20 {

    constructor() ERC20("USDT", "USDT Coin") {}

    function decimals() public pure override returns (uint8) {
        return 6;
    }
}