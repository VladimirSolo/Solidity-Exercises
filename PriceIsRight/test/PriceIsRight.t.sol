// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/PriceIsRight.sol";

contract PriceIsRightTest is Test {
    PriceIsRight public priceIsRight;

    function setUp() public {
        priceIsRight = new PriceIsRight();
    }

    function testBuy(uint256 amount) external {
        amount = bound(amount, 0, 2 ether);
        if (amount == 1 ether) amount = 2 ether;
        vm.deal(address(this), 10 ether);
        priceIsRight.buy{value: 1 ether}();

        vm.expectRevert();
        priceIsRight.buy{value: amount}();
    }
}
