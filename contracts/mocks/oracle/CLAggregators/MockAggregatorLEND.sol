pragma solidity ^0.8.24;

import "./MockAggregatorBase.sol";

contract MockAggregatorLEND is MockAggregatorBase {
    constructor (int256 _initialAnswer) MockAggregatorBase(_initialAnswer) {}
}