pragma solidity >=0.5.1

contract SimpleBank{
	mapping(address => unit) private balances;
	address public owner;
	event LogDepositMode(address accountAddress, uint amount);

	function SimpleBank(){
	    	owner = msg.sender;
	}

	function deposit() payable public returns (uint){
	    	balance[msg.sender] += msg.value;
		LogDepositMade(msg.sender, msg.value);
		return balances[msg.sender];
	}

	function withdraw(uint withdrawAmount) public returns (uint remainingBal){
	    	if(balances[msg.sender] >= withdrawAmount){
		    	balance[msg.sender] -= withdrawAmount);
			if(!msg.sender.send(withdrawAmount)){
			    	balances[msg.sender] += withdrawAmount;
			}
		}
		return balances[msg.sender];
	}

	function balance() constant return (uint){
	    	return balances[msg.sender];
	}

	function payable (){
	    	throw;
	}
}
