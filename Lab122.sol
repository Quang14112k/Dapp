pragma solidity ^0.5.13;

    contract FunctionSimple{
         mapping(address => uint) public balanceReceived;
        
        address payable owner;
        
        constructor()public{
            owner = msg.sender;
            
        }
        function getOwner()public view returns(address){
            return owner;
            
        }
        function DestroySmartContract()public {
            require(msg.sender == owner, "You are not owner");
            selfdestruct(owner);
        }
        function converWeiToEther(uint _amountInWei)public pure returns(uint){
            return _amountInWei / 1 ether;
        }
        
        
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
