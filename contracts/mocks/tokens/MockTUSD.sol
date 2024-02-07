pragma solidity ^0.8.24;


import "./MintableERC20.sol";


contract MockTUSD is MintableERC20 {

    constructor() ERC20("TUSD", "TrueUSD") {}
}