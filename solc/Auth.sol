// Define the version of solidity that over 0.4.0 and below 0.7.0
pragma solidity >=0.4.0 <0.7.0;

contract GateBlockerAuth{
    	/*
	Ths contract that define the log record of "Gate Blocker - Face Recognition Access Control System Based on BlockChain".
	The whole contract record the two things, which is the user's face identication and the time that the user log in.
	
	:var userAccount: <address> the user's account in blockchain
	:var userID: <uint> the user's face identication
	:var logTime: <uint> the user's log in time
	:var doorOpened: <bool> to judge whether the door is opened or not
	*/

	address public userAccount;
	uint userID;
	uint logTime;
	bool doorOpened = false;

	constructor() public{
	    	/*
		The constructor of the contract, which initialize the contract.
		*/

	    	userAccount = msg.sender;
	}
	
	function setLog(uint faceid, uint timenow) public {
	    	/*
		To Record the log record.

		:param faceid: <uint> the user's faceid which is sent by the script
		:param timenow: <uint> the time that is sent by the script which takes from computer
		*/

		userID = faceid;
	    	logTime = timenow;
		if(!doorOpened){
		    	doorOpened = true;
		}
	}

	function getTime() public view returns (uint){
	    	// Return the log in time to the console

		return logTime;
	}

	function getID() public view returns (uint){
	    	// Return the user's face identication to the console
		return userID;
	}

	function getDoorStatus() public view returns (bool){
	    	// Return the status of the door to the console
	    	return doorOpened;
	}
}
