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

contract Variables {

    // State Variables are stored on the blockchain
    string public text = "Hello World";
    uint256 public num = 123;

    function doSomething() view public {
        // Local Variable are not stored on the blockchain
        uint256 i = 456;
        uint256 timestamp = block.timestamp;
        address sender = msg.sender;
        // They have a yellow underline because they are unused
    }
}

contract Constants {
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint256 public constant MY_UNIT = 123;
}