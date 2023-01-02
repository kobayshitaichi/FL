// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./Share_weight.sol";


contract RenewWeight is SendWeights {
    function getWeight() public view returns(Weight[] memory){
        return weights ;
    }

    function setNewWeight(string memory _address) public {
        now_weight_address = _address;
        nowiteration++;
        cnt = 0;
    }

    function getinfo() public view returns(uint iter,string memory weight_address,uint){
        return (nowiteration,now_weight_address,cnt);
    }

}