pragma solidity ^0.8.24;


import "./MintableERC20.sol";


contract MockKNC is MintableERC20 {

    constructor() ERC20("KNC", "Kyber Network") {}

}