// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.3;
import "./iDAO.sol";
interface iBASE {
    function DAO() external view returns (iDAO);
}