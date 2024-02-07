pragma solidity ^0.8.24;


import "./MintableERC20.sol";



contract MockBAT is MintableERC20 {

    constructor() ERC20("BAT", "Basic Attention Token") {}
}