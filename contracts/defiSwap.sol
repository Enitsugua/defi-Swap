//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.3;
import "./iBASE.sol";
import "./iBEP20.sol";
import "./iROUTER.sol";
import "./SafeERC20.sol";
import "./Auth.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract defiSwap {
    using SafeERC20 for iBEP20;  
    address public protocolToken;
    Auth private _auth;

    constructor(address token) {
        protocolToken = token; 
        _auth = new Auth(msg.sender);
    }

    receive() external payable {}

    function getRouter() internal view returns(address){
        return iDAO(iBASE(protocolToken).DAO()).ROUTER();
    }
    function getNumber() external pure returns (uint256){
        return 6;
    }

    function getX(uint256 a, address x) internal {
        TransferHelper.safeTransferFrom(x, msg.sender, address(this), a);
    }
    function getXBNB(uint256 a) internal {
        TransferHelper.safeTransferBNB(address(this), a);
    }

    function giveY(uint256 b, address y) internal {
         TransferHelper.safeTransfer(y, msg.sender, b);
    }
    function giveYBNB(uint256 b, address y) internal {
         TransferHelper.safeTransfer(y, msg.sender, b);
    }

    function approve2() internal {

    }

    function swapX2Y(uint256 a, address x, address y, uint256 noFR) external payable {
        if(x == address(0)){
            getXBNB(a);
        }else{
            getX(a, x);
        }
             
    
        address router = getRouter();
        
        iROUTER(router).swap(a, x, y, noFR);
    }

  
}
