// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "lib/chainlink-brownie-contracts/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getdecimals() internal view returns (uint256) {
    return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).decimals();
    }


    function getprice() internal view returns (uint256) {
        AggregatorV3Interface PriceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        // address = 0x694AA1769357215DE4FAC081bf1f309aDC325306

        (, int256 answer,,,) = PriceFeed.latestRoundData(); //price of eth in terms of usd
        return uint256(answer * 1e10);
    }

    function converter(uint256 ethamount) internal view returns (uint256) {
        uint256 ethprice = getprice();
        uint256 EthAmountInUsd = (ethprice * ethamount) / 1e18;
        return EthAmountInUsd;
    }
    function getversion() view external returns(uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();

    }
}
