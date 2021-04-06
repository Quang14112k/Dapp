pragma solidity ^0.5.13;

contract MappingStruct {
    
    struct Payment{
        uint amount;
        uint timestamps;
    }
    
    struct Balance{
        uint totaBalance;
        uint numPayments;
        mapping (uint => Payment) payments;
    }
    
    mapping (address => Balance) public balanceReceived;
    
    function getBlance() public view returns(uint){
        return address(this).balance;
    }
    function sendMoney()public payable{
        balanceReceived[msg.sender].totaBalance += msg.value;
        Payment memory payment =Payment(msg.value, now);
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments]=payment;
        balanceReceived[msg.sender].numPayments ++;
        
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender].totaBalance >= _amount,"Not enough funds");
        balanceReceived[msg.sender].totaBalance -= _amount;
        _to.transfer(_amount);
    }
    
    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender].totaBalance;
        balanceReceived[msg.sender].totaBalance = 0;
        _to.transfer(balanceToSend);
    }
    
}
