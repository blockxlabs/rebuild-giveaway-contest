pragma solidity ^0.5.1;

contract winners {
    
    uint entries; 
    address owner;
    bytes32 hash;
    uint number; 
    
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    constructor () public { 
        owner = msg.sender; 
    }
    
    function setProof(bytes32 _hash) external onlyOwner  {
        hash = _hash;
    }
    
    function getProof() external view returns (bytes32) {
        return hash; 
    }
    function generateRandom() external onlyOwner {
        number = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) %entries;
    }
    
    function getNumber() external view returns (uint) {
        return number;
    }
    
    function setEntries(uint _entries) external onlyOwner {
        entries = _entries - 1;
    }
    
    function getEntries() external view returns (uint) {
        return entries;
    }

}