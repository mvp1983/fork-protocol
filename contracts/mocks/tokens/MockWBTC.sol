pragma solidity ^0.8.24;


import "./MintableERC20.sol";


contract MockWBTC is MintableERC20 {

    constructor() ERC20("WBTC Coin", "WBTC") {}
}