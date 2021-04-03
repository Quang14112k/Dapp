pragma solidity ^0.5.13;

contract StartStopUpdate {
    
    address public owner;
    
    bool public paused;
    
    constructor() public{
        
        owner = msg.sender;
    }
        function sendMoney() public payable {
            
        }
        function setPaused(bool _paused) public{
            require(msg.sender == owner,"You are not owner");
            paused =_paused;
        }
    
        function withDrawAllMoney(address payable _to) public{
            require(msg.sender==owner,"You are not owner");
            require(!paused,"contract is paused");
            _to.transfer(address(this).balance);
    }
    function destroySmartContract(address payable _to) public{
        require(msg.sender == owner,"you are not owner");
        selfdestruct(_to);
    }
        
        
}
