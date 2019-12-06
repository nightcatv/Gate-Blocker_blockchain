import * from './login.js'
var blockchain_account = eth.account[0];
var blockchain_password = "000000";
var user_faceid = "123456789';

contractDefine();
contractDeploy(blockchain_account, blockchain_password);
loginRecord(blockchain_account, blockchain_password, user_faceid);
getResult();
