// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract NotEnough {
    /* This exercise assumes you know how require statements works.
    The function below should only be called with a number greater than 10,
    else it reverts. */
    function largeEnough(uint256 _number) external pure {
        require(_number > 10, "Need more then 10!");
    }
}
