// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Immutable.sol";

contract ContractImmutableTest is Test {
    ContractImmutable public contractImmutable;

    function setUp() public {}

    function testContractImmutable() external {
        uint256 startGas = gasleft();
        contractImmutable = new ContractImmutable(10);
        uint256 gasUsed = startGas - gasleft();

        assertEq(contractImmutable.value(), 10, "expected value to be 10");
        assertLt(gasUsed, 110000, "Gas used is too high");
    }

    function testContractImmutable2() external {
        uint256 startGas = gasleft();
        contractImmutable = new ContractImmutable(550);
        uint256 gasUsed = startGas - gasleft();

        assertEq(contractImmutable.value(), 550, "expected value to be 550");
        assertLt(gasUsed, 110000, "Gas used is too high");
    }
}
