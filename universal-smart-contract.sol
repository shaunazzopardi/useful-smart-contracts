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
