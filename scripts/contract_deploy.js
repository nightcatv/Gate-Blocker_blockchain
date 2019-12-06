var authcontractAbi, authContract, authBinCode;
var deployTransactionObject, authInstance, authAddress, auth;

export function contractDefine(){
	/*
	Define the variable for the contract.
	*/
	
	// Define variables for the part of abi and bincode of contract.
	authContractAbi = authOutput.contracts['Auth.sol:GateBlockerAuth'].abi;
	authContract = eth.contract(JSON.parse(authContractAbi));
	authBinCode = "0x" + authOutput.contracts['Auth.sol:GateBlockerAuth'].bin;
}

export function contractDeploy(account, password){
    	/*
	Deploy the contract the corresponding account.

	:param account: <var> the user's account in blockchain
	:param password: <var> the corresponding password of the account
	*/

	// Unlock the account that can transact with contract.
	personal.unlockAccount(account, password);

	// New a object of contract instance through transaction.
	deployTransactionObject = {from: account, data: authBinCode, gas: 100000};
	authInstance = authContract.new(deployTransactionObject);
	mine();
	
	// After the transaction, define a variable to get the address fo contract.
	authAddress = eth.getTransactionReceipt(authInstance.transactionHash).contractAddress;
	auth = authContract.at(authAddress);
}

export function loginRecord(account, password, faceid){
    	/*
	Record the login time.

	:param account: <var> the user's account in blockchain
	:param password: <var> the corresponding password of the account
	:param faceid: <var> the user's face identification
	*/
	
	// Unlock the account that can transact with contract/
	personal.unlockAccount(account, password);

	// Transact with contract with datas of the user's face identication and the time when login.
	auth.setLog.sendTransaction(faceid, Date.now(), {from: account, gas: 100000});
	mine();
}

function mine(){
    	/*
	Mine the blockchain to make sure the transaction is processed.
	*/
	
	// Start mining with single processor and stop mining as soon as mined a block.
	miner.start(1);
    	admin.sleepBlocks(1);
    	miner.stop();
}

export function getResult(){
	auth.getTime.call();
	auth.getID.call();
	auth.getDoorStatus.call();
}

