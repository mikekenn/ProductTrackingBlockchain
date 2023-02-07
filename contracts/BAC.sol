pragma solidity ^ 0.4 .10;

contract BAC {

  // Mapping from user address to boolean type
  mapping(address => bool) isAuthorized;

  // Define struct
  struct batch {
    string _productBatch;
    string _materialBatch;
    address _batchManager;
    address _TUCAddress;
    uint _addTime;
  }
  
  mapping(uint => batch) _batchs;

  mapping(string => address) _batchToAddress;

  mapping(address => string) _addressToBatch;

  uint _numberOfBatchs;

  address _productAdmin;

  // As a prerequisite for some functions
  //modifier onlyAdmin {
  //}

  //modifier onlyAuthorized(address addr) {
  //}

  // Constructor function
  //constructor() public {
  //}

  // Add production batch information
  //function addBatch(string productBatch, string materialBatch, address TUCAddress) public onlyAuthorized(msg.sender) {
  //}

  // Get batch information by id
  //function getBatchOfId(uint id) constant public returns(string productBatch, string materialBatch, address batchManager, address TUCAddress, uint addTime) {
  //}

  // Get the number of batches
  //function getNumberOfBatchs() constant public returns(uint numberOfBatchs) {
  //}

  //function getAddressOfBatch(string productBatch) constant public returns(address addr) {
  //}

  // Add user to authorization list
  //function addUser(address addr) public onlyAdmin {
  //}

  // Remove user
  //function removeUser(address addr) public onlyAdmin {
  //}

  // Check if the user is authorized
  //function checkUser(address addr) constant public returns(bool result) {
  //}

  // Destroy the contract
  //function deleteContract() onlyAdmin public {
  //}

}
