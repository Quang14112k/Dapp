pragma solidity ^0.5.13;
 contract MappingStruct {
     
     struct Payment {
         uint amount;
         uint timestamps;
     }
     
     struct balance{
         uint totalBalance;
         uint numPayment;
         mapping (uint => Payment) Payments;
     } 
     
     
     
     
     
     mapping(address => balance)public balanceReceived;
     
        function getBalance() public view returns(uint){
            return address(this).balance;
        }
        
        
        function sendMoney()public payable{
            balanceReceived[msg.sender].totalBalance += msg.value;
            
            Payment memory payment =  Payment(msg.value, now);
            balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
            balanceReceived[msg.sender].numPayments ++;
            
        }
        
        function withDrawMoney(address payable _to,uint _amount) public{
            require(balanceReceived[msg.sender] >= _amount,"not enough funds");
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
        }
        
        function withDrawAllMoney(address payable _to) public{
            uint balanceToSend = balanceReceived[msg.sender];
            balanceReceived[msg.sender]=0;
            _to.transfer(balanceToSend);
        }
        
 }
