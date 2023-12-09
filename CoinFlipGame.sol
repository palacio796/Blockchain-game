// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoinFlipGam{
    address public owner; // address of owner
    uint public lastFlipTimestamp; // timestamp of last coin flip
    uint public lastFlipResult; // result of coin flip 0 = heads,  1 = tails

    event CoinFliped(bool result); // event called when coin is flipped

    // mod that verfies that owner is executing certain fucntions
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this fucntion");
        _;
    }

    constructor(){
        owner = msg.sender;
    }

    // function that flips coin, only callable by the owner
    function flipCoin() external onlyOwner() {
        lastFlipResult = block.timestamp % 2; // determine 0 or 1
        lastFlipTimestamp = block.timestamp; // record timestamp
        emit CoinFliped((lastFlipResult == 0)); // emit result of flip
    }
}   
