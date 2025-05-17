// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract BasicBankV2 {
    /// @notice Tracks deposited ETH per user
    mapping(address => uint256) public balances;

    /// @notice Emitted on successful deposit
    event Deposited(address indexed user, uint256 amount);

    /// @notice Emitted on successful withdrawal
    event Withdrawn(address indexed user, uint256 amount);

    /// @notice Deposit ETH and update user balance
    /// @dev Requires non-zero ETH value
    function addEther() external payable {
        require(msg.value > 0, "Zero deposit not allowed");
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    /// @notice Withdraw specified ETH amount
    /// @dev Implements checks-effects-interactions pattern
    function removeEther(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient user balance");

        // Update balance before external call
        balances[msg.sender] -= amount;

        // Secure ETH transfer
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "ETH transfer reverted");

        emit Withdrawn(msg.sender, amount);
    }
}
