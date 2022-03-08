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
   
    function inX(uint256 a, address x) internal {
        TransferHelper.safeTransferFrom(x, msg.sender, address(this), a);
    }
    function inXRaw(uint256 a) internal {
        require((a == msg.value)); 
        TransferHelper.safeTransferBNB(address(this), a);
    }
    function outY(uint256 b, address y) internal {
         TransferHelper.safeTransfer(y, msg.sender, b);
    }
    function outYRaw(uint256 b) internal {
         TransferHelper.safeTransferBNB(msg.sender, b);
    }
    function exchangeInForOut(uint256 a, address x, address y, uint256 noFR) external payable {
        if(x == address(0)){
            inXRaw(a);
            address router = getRouter();
            iROUTER(router).swap(a, x, y, noFR);
            outYRaw(address(this).balance);
        }else{
            inX(a, x);
            address router = getRouter();
            iBEP20(x).approve(router, a);
            iROUTER(router).swap(a, x, y, noFR);
            outY(iBEP20(y).balanceOf(address(this)), y);
        }
    }
}
