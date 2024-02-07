pragma solidity ^0.8.24;


import "./MintableERC20.sol";


contract MockUSDC is MintableERC20 {

    constructor() ERC20("USDC", "USD Coin") {}
    
    function decimals() public view override returns (uint8) {
        return 6;
    }

}