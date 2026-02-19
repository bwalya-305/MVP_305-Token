// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/MvpToken.sol";

contract MvpTokenTest is Test {
    MvpToken token;
    address owner = address(this);
    address user1 = address(0x1);
    address user2 = address(0x2);

    uint256 constant INITIAL_SUPPLY = 1_000_000;

    function setUp() public {
        token = new MvpToken("Mvp Token", "MVP", INITIAL_SUPPLY);
    }

    /* DEPLOYMENT TESTS */
    function testInitialSupplyMintedToOwner() public {
        uint256 expectedSupply = INITIAL_SUPPLY * (10 ** token.decimals());
        assertEq(token.totalSupply(), expectedSupply);
        assertEq(token.balanceOf(owner), expectedSupply);
    }

    /* TRANSFERS TESTS */
    function testTransfer() public {
        uint256 transferAmount = 1_000 * (10 ** token.decimals());
        token.transfer(user1, transferAmount);
        assertEq(token.balanceOf(user1), transferAmount);
        assertEq(token.balanceOf(owner), (INITIAL_SUPPLY * (10 ** token.decimals())) - transferAmount);
    }

    /* MINTING TESTS */
    function testMinting() public {
        uint256 mintAmount = 500 * (10 ** token.decimals());
        token.mint(user1, mintAmount);
        assertEq(token.balanceOf(user1), mintAmount);
        assertEq(token.totalSupply(), (INITIAL_SUPPLY * (10 ** token.decimals())) + mintAmount);
    }

    /* NonOwner Minting Test */
    function testNonOwnerCannotMint() public {
        uint256 amount = 100 * (10 ** token.decimals());
        vm.prank(user1);
        vm.expectRevert(abi.encodeWithSignature("OwnableUnauthorizedAccount(address)", user1));
        token.mint(user1, amount);
    }

    /* PAUSING TESTS */
    function testPausing() public {
        uint256 amount = 100 * (10 ** token.decimals());
        token.pause();
        vm.expectRevert(abi.encodeWithSignature("EnforcedPause()"));
        token.transfer(user1, amount);
        token.unpause();
        token.transfer(user1, amount);
        assertEq(token.balanceOf(user1), amount);
    }

    /* Unpausing Test */
    function testUnpausing() public {
        uint256 amount = 100 * (10 ** token.decimals());
        token.pause();
        token.unpause();
        token.transfer(user1, amount);
        assertEq(token.balanceOf(user1), amount);
    }

    /* BURNING TESTS */
    function testBurning() public {
        uint256 burnAmount = 1_000 * (10 ** token.decimals());
        uint256 startingBalance = token.balanceOf(owner);
        token.burn(burnAmount);
        assertEq(token.balanceOf(owner), startingBalance - burnAmount);
        assertEq(token.totalSupply(), (INITIAL_SUPPLY * (10 ** token.decimals())) - burnAmount);
    }
}
