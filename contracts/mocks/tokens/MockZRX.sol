pragma solidity ^0.8.24;


import "./MintableERC20.sol";


contract MockZRX is MintableERC20 {

    constructor() ERC20("0x Coin", "ZRX") {}
}