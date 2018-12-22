pragma solidity ^0.5.2;

/*
* Title: Book Store
* Author: Chris Ragobeer
* Description: Sample Book Store shop to test out latest Solidity library
*/
contract BookStore {
    
    address owner;
    uint public books;
    uint constant price = 1 ether;
    mapping(address => uint) public consumer;
    
   constructor() public payable {
        owner = msg.sender;
        books = 20;
    }
    
    modifier preBuy() {
        require(books > 0);
        _;     
    }
    
    function buyBooks(uint amount) public payable preBuy {
        if (msg.value != (amount * price) || amount > books) {
            revert();
        }
        
        consumer[msg.sender] += amount;
        books -= amount;
    }
    
    function refundBooks(uint amount) public payable {
         if (msg.value != (amount * price) || amount > books) {
            revert();
        }
        
        consumer[msg.sender] -= amount;
        books += amount;
    }
    
}

