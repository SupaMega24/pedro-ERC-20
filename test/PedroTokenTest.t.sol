// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployPedroToken} from "../script/DeployPedroToken.s.sol";
import {PedroToken} from "../src/PedroToken.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

contract PedroTokenTest is StdCheats, Test {
    PedroToken public pedroToken;
    DeployPedroToken public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployPedroToken();
        pedroToken = deployer.run();

        vm.prank(msg.sender);
        pedroToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public view {
        assertEq(STARTING_BALANCE, pedroToken.balanceOf(bob));
    }

    function testAllowancesWorks() public {
        uint256 initialAllowance = 1000;

        //Bob approves Alice
        vm.prank(bob);
        pedroToken.approve(alice, initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(alice);
        pedroToken.transferFrom(bob, alice, transferAmount);

        assertEq(pedroToken.balanceOf(alice), transferAmount);
        assertEq(pedroToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }
}
