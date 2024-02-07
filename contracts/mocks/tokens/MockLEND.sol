pragma solidity ^0.8.24;


import "./MintableERC20.sol";



contract MockLEND is MintableERC20 {

    constructor() ERC20("LEND", "LEND") {}
}