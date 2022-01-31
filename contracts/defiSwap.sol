//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.3;
import "./iBASE.sol";
import "./iBEP20.sol";
import "./iROUTER.sol";
import "./SafeERC20.sol";
import "./Auth.sol";

contract defiSwap {
    address public protocolToken;
    Auth private _auth;
    uint256 public storeme;
    receive() external payable {}

    function init(address token) external {
        protocolToken = token; 
        storeme = 9;
        _auth = new Auth(msg.sender);
    }
    
    function getRouter() internal view returns(address){
        return iDAO(iBASE(protocolToken).DAO()).ROUTER();
    }
    function getme() public view returns (uint256){
        return storeme;
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
