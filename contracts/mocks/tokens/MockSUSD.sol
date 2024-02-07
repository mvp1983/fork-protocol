pragma solidity ^0.8.24;


import "./MintableERC20.sol";


contract MockSUSD is MintableERC20 {

    constructor() ERC20("SUSD", "Synthetix USD") {}
    
    function decimals() public view override returns (uint8) {
        return 6;
    }
    
}