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
  // Function Modifiers are used to modify the behaviour of a function.
  // The function body is inserted where the special symbol "_;" appears in the definition of a modifier.
  // So if condition of modifier is satisfied while calling this function, the function is executed and otherwise, an exception is thrown.
  modifier onlyAdmin {
    require(msg.sender == _productAdmin);
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
    _productAdmin = msg.sender;
    _numberOfBatchs = 1;
  }

  // Add production batch information
  function addBatch(string productBatch, string materialBatch, address TUCAddress) public onlyAuthorized(msg.sender) {

    require(_batchToAddress[productBatch] == address(0));
    require(bytes(_addressToBatch[TUCAddress]).length == 0);

    require(bytes(productBatch).length == 12);

    _batchs[_numberOfBatchs]._productBatch = productBatch;
    _batchs[_numberOfBatchs]._materialBatch = materialBatch;
    _batchs[_numberOfBatchs]._batchManager = msg.sender;
    _batchs[_numberOfBatchs]._TUCAddress = TUCAddress;
    _batchs[_numberOfBatchs]._addTime = now;
    _batchToAddress[productBatch] = TUCAddress;

    _numberOfBatchs++;

  }

  // Get batch information by id
  function getBatchOfId(uint id) constant public returns(string productBatch, string materialBatch, address batchManager, address TUCAddress, uint addTime) {

    productBatch = _batchs[id]._productBatch;
    materialBatch = _batchs[id]._materialBatch;
    batchManager = _batchs[id]._batchManager;
    TUCAddress = _batchs[id]._TUCAddress;
    addTime = _batchs[id]._addTime;

  }

  // Get the number of batches
  function getNumberOfBatchs() constant public returns(uint numberOfBatchs) {
    numberOfBatchs = _numberOfBatchs - 1;
  }

  function getAddressOfBatch(string productBatch) constant public returns(address addr) {
    addr = _batchToAddress[productBatch];
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
  function deleteContract() onlyAdmin public {
    selfdestruct(_productAdmin);
  }

}