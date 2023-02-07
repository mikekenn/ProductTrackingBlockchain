pragma solidity ^ 0.4 .10;

contract PRC {

  // Mapping from user address to boolean type
  mapping(address => bool) isAuthorized;

  // Define struct
  struct product {
    string _productName;
    string _productCode;
    string _rawMaterials;
    address _productOwner;
    uint _timestamp;
    address _BACAddress;
  }
  
  mapping(uint => product) _products;

  mapping(string => uint) _productCodeToId;

  uint _numberOfProducts;

  address _admin;

  mapping(string => string) _productCodeToName;
  mapping(string => address) _productCodeToBACAddress;

  // As a prerequisite for some functions
  //modifier onlyAdmin {
  //}

  //modifier onlyAuthorized(address addr) {
  //}

  // Constructor function
  //constructor() public {
  //}

  // Register product information
  //function productRegister(string productName, string productCode, string rawMaterials, address BACAddress) public onlyAuthorized(msg.sender) {
  //}

  // Register raw material information
  //function materialRegister(string materialName, string materialCode, address BACAddress) public onlyAuthorized(msg.sender) {
  //}

  // Get the number of products
  //function getNumberOfProducts() constant public returns(uint numberOfProducts) {
  //}

  // Get product information by id
  //function getProductOfId(uint id) constant public returns(string productName, string productCode, string rawMaterials, address productOwner, uint timestamp, address BACAddress) {
  //}

  //function getIdOfCode(string productCode) constant public returns(uint id) {
  //}

  //function getAddressOfCode(string productCode) constant public returns(address addr) {
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
  //function deleteContract() public onlyAdmin {
  //}

}
