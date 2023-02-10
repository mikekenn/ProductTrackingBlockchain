pragma solidity ^ 0.4 .10;

contract TUC {

  // Mapping from user address to boolean type
  mapping(address => bool) isAuthorized;

  // Define struct
  struct tr {
    string _currentTx;
    string _previousTx;
    address _sender;
    string _receiver;
    uint _time;
  }

  mapping(uint => tr) trs;

  uint _numberOfTrs;

  address _batchAdmin;

  // As a prerequisite for some functions
  // Function Modifiers are used to modify the behaviour of a function.
  // The function body is inserted where the special symbol "_;" appears in the definition of a modifier.
  // So if condition of modifier is satisfied while calling this function, the function is executed and otherwise, an exception is thrown.
  modifier onlyAdmin {
    require(msg.sender == _batchAdmin);
    _;
  }

  modifier onlyAuthorized(address addr) {
    require(isAuthorized[addr] == true);
    _;
  }

  // Constructor function
  // Constructor is a special function declared using constructor keyword. 
  // It is an optional funtion and is used to initialize state variables of a contract. 
  // Following are the key characteristics of a constructor.
    // A contract can have only one constructor.
    // A constructor code is executed once when a contract is created and it is used to initialize contract state.
    // After a constructor code executed, the final code is deployed to blockchain. This code include public functions and code reachable through public functions. Constructor code or any internal method used only by constructor are not included in final code.
    // A constructor can be either public or internal.
    // A internal constructor marks the contract as abstract.
    // In case, no constructor is defined, a default constructor is present in the contract.
  constructor() public {
    _batchAdmin = msg.sender;
    _numberOfTrs = 1;
  }

  // Update transaction information
  function addTr(string currentTx, string previousTx, string re) public onlyAuthorized(msg.sender) {

    trs[_numberOfTrs]._currentTx = currentTx;
    trs[_numberOfTrs]._previousTx = previousTx;
    trs[_numberOfTrs]._sender = msg.sender;
    trs[_numberOfTrs]._receiver = re;
    trs[_numberOfTrs]._time = now;

    _numberOfTrs++;

  }

  // Get transaction information by id
  function getTrOfId(uint id) constant public returns(string currentTx, string previousTx, address se, string re, uint time) {
    currentTx = trs[id]._currentTx;
    previousTx = trs[id]._previousTx;
    se = trs[id]._sender;
    re = trs[id]._receiver;
    time = trs[id]._time;
  }

  // Get the number of transactions
  function getNumberOfTrs() constant public returns(uint numberOfTrs) {
    numberOfTrs = _numberOfTrs - 1;
  }

  // Add user to authorization list
  function addUser(address addr) public onlyAdmin {
    isAuthorized[addr] = true;
  }

  // Remove user
  function removeUser(address addr) public onlyAdmin {
    isAuthorized[addr] = false;
  }

  // Check if the user is authorized
  function checkUser(address addr) constant public returns(bool result) {
    result = isAuthorized[addr];
  }

  // Destroy the contract
  function deleteContract() public onlyAdmin {
    selfdestruct(_batchAdmin);
  }

}