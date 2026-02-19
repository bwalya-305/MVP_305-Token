//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/MvpToken.sol";

contract DeployBwalyaToken is Script {
    function run() external {
        vm.startBroadcast();
        new MvpToken("Mvp Token", "MVP", 1_000_000);
        vm.stopBroadcast();
    }
}