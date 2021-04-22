pragma solidity ^0.5.13;

contract ExceptionSimple {
    
        mapping(address => uint) public balanceReceived;
        
        function receiveMoney() public payable {
            assert(balanceReceived[msg.sender] + uint64(msg.value) >= balanceReceived[msg.sender]);
            balanceReceived[msg.sender] += uint64(msg.value);
        }
        function withdrawMoney(address payable _to, uint _amount) public {
            require(_amount <= balanceReceived[msg.sender],"you don't have enough ether");
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
            
        }
        
}
