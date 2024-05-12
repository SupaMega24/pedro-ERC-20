// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {PedroToken} from "../src/PedroToken.sol";

contract DeployPedroToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns (PedroToken) {
        vm.startBroadcast();
        PedroToken pt = new PedroToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return pt;
    }
}
