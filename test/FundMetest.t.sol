// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import{FundMe} from "src/FundMe.sol";
import{PriceConverter} from "src/PriceConverter.sol";

contract FundMetest is Test{
     FundMe fundme;
    function setUp() external {
        fundme = new FundMe();
    }

    function testMinimumUsdisFive() external {
        assertEq(fundme.MINIMUM_USD(), 5e18);
    }

    function FundMeowner() public {
        assertEq(fundme.i_owner(), address(this));

    }

    function testFundMedecimals() external {
    uint256 decimals = PriceConverter.getdecimals();
    assertEq(decimals, 8);
    }
}