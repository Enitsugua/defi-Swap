// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.3;
interface iROUTER {
   function swap(uint256 inputAmount, address fromToken, address toToken, uint256 minAmount) external payable;

}