pragma solidity ^ 0.4 .10;

contract TUC {

  // Mapping from user address to boolean type
  //mapping(address => bool) isAuthorized;

  // Define struct
  struct tr {
    TODO
    //Team: To Create attributs/Define structure of Transaction Update Contract.
  }

  // As a prerequisite for some functions
  modifier onlyAdmin {
  }

  modifier onlyAuthorized(address addr) {
  }

  // Constructor function
  constructor() public {
  }

  // Update transaction information
  function addTr(string currentTx, string previousTx, string re) public onlyAuthorized(msg.sender) {
  }

  // Get transaction information by id
  function getTrOfId(uint id) constant public returns(string currentTx, string previousTx, address se, string re, uint time) {
  }

  // Get the number of transactions
  function getNumberOfTrs() constant public returns(uint numberOfTrs) {
  }

  // Add user to authorization list
  function addUser(address addr) public onlyAdmin {
  }

  // Remove user
  function removeUser(address addr) public onlyAdmin {
  }

  // Check if the user is authorized
  function checkUser(address addr) constant public returns(bool result) {
  }

  // Destroy the contract
  function deleteContract() public onlyAdmin {
  }

}