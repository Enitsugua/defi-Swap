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
    receive() external payable {}

    function init(address token) external {
        protocolToken = token; 
        _auth = new Auth(msg.sender);
    }
    
    function getRouter() internal view returns(address){
        return iDAO(iBASE(protocolToken).DAO()).ROUTER();
    }
   
    function getX(uint256 a, address x) internal {
        TransferHelper.safeTransferFrom(x, msg.sender, address(this), a);
    }
    function getXBNB(uint256 a) internal {
        require((a == msg.value)); 
        TransferHelper.safeTransferBNB(address(this), a);
    }
    function giveY(uint256 b, address y) internal {
         TransferHelper.safeTransfer(y, msg.sender, b);
    }
    function giveYBNB(uint256 b) internal {
         TransferHelper.safeTransferBNB(msg.sender, b);
    }
    function swapX2Y(uint256 a, address x, address y, uint256 noFR) external payable {
        if(x == address(0)){
            getXBNB(a);
            address router = getRouter();
            iROUTER(router).swap(a, x, y, noFR);
            giveYBNB(address(this).balance);
        }else{
            getX(a, x);
            address router = getRouter();
            iROUTER(router).swap(a, x, y, noFR);
            giveY(iBEP20(y).balanceOf(address(this)), y);
        }
    }
}
