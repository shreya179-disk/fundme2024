// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PriceConverter} from "./PriceConverter.sol";



contract FundMe {
    using PriceConverter for uint256;

    uint256 public myValue;
    uint256 public constant MINIMUM_USD = 5e18;
    address[] public funders;
    mapping(address => uint256) fundertoAmountFunded;
    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function fund(uint256 _myValue) public payable {
        myValue = _myValue + 2;
        require(msg.value.converter() >= MINIMUM_USD, "Didn't send enough eth");
        funders.push(msg.sender);
        fundertoAmountFunded[msg.sender] += msg.value;
    }

    function withdraw(uint256 funderIndex) public {
        require(msg.sender == i_owner, "not the owner");
        for (funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            fundertoAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        payable(msg.sender).transfer(address(this).balance);
    }
    
}
