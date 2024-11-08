// SPDX-License-Identifier: MIT
// Software Package Data Exchange

pragma solidity ^0.8.26;

contract HelloWorld {
    
    string public Greeting = "Hello World";


    uint256 public count;
    // Function to get the current count
    function get() public view returns (uint256) {
        return count;
    }

    // Function to increment count by 1
    function inc() public {
        count += 1;
    }

    // Function to decrement count by 1
    function dec() public {
        count -= 1;
    }
}

contract Primitives {
    
}