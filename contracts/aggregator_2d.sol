// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
pragma experimental ABIEncoderV2;
import "./Renew_weight.sol";


contract Aggregator_2d is RenewWeight{
    uint256 total;
    uint256 counter;
    uint256[][][] edges_params; 
    uint256[][] server_params; 
    uint32 public constant toFloat = 1E9;

    function averageLayer(uint256[][][] memory _layer_params)
        internal
        returns (uint256[][] memory)
    {
        uint256 n_clients = _layer_params.length;
        uint256 n_neurons = _layer_params[0].length;
        uint256 n_connections = _layer_params[0][0].length;
        uint256[][] memory newLayer = new uint256[][](n_neurons);

        for (uint256 i = 0; i < n_neurons; i++) {
            newLayer[i] = new uint256[](n_connections);

            for (uint256 j = 0; j < n_connections; j++) {
                resetCounters();

                for (uint256 k = 0; k < n_clients; k++) {
                    calcAverage(_layer_params[k][i][j]);
                }
                uint256 temp_average = getAverage();
                newLayer[i][j] = temp_average;
                emit displayParam(temp_average);
            }
        }
        return newLayer;
    }

    function store_params(uint256[][] memory _layer_params)
        public
        returns (uint256)
    {

        edges_params.push(_layer_params);
        return 1;
    }

    function getBalance() public pure returns (uint256) {
        return 123;
    }

    function run_agg() public returns (uint256) {
        for (uint256 i = 0; i < max_counts; i++) {
            store_params(weights[i].params);
        }
        server_params = averageLayer(edges_params);
        return 1;
    }

    function read_params() public view returns (uint256[][] memory) {
        return server_params;
    }

    function calcAverage(uint256 _newValue) internal {
        total += _newValue;
        counter++;
    }

    function getAverage() internal view returns (uint256) {
        return ((total * toFloat) / counter);
    }

    function resetCounters() internal {
        counter = 0;
        total = 0;
    }

    event displayParam(uint256 _param);
}