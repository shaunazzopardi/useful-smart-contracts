//This contract can be used as the interface to (almost) any smart contract.
//Using this as an interface ensures that any dependencies on the address of this smart contract can be fulfilled.

contract UniversalSmartContract{
    address owner;
    address implementation;
    
    modifier isOwner(){
        require(msg.sender == owner);
        _;
    }
    
    function UniversalSmartContract(){
        owner = msg.sender;
    }
    
    function updateImplementation(address newImplementation) isOwner {
        implementation = newImplementation;
    }
    
    function () isOwner {
        implementation.delegatecall(msg.data);
    }
}
