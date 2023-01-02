// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract SendWeights {

    struct Weight {
        uint iteration;
        uint ID;
        string ipfs_address;
        uint256[][] params;
    }

    Weight[] public weights;
    uint nowiteration = 0;
    string now_weight_address;

    uint max_counts = 3;
    uint cnt = 0;


    function sendWeights(string memory _ipfs_address, uint _iteration, uint256 [][] memory _params) 
        public 
        returns(uint){
        require(_iteration == nowiteration);
        require(cnt  < max_counts);
        weights.push(Weight(_iteration,uint(keccak256(abi.encode(msg.sender))),_ipfs_address,_params));

        cnt ++;

        return cnt;
    }

}