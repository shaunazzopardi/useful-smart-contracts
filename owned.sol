contract Owned{
  address owner;
  
  function Owner(){
    owner = msg.sender;
  }
  
  modifier isOwner(){
    require(msg.sender == owner);
    _;
  }
  
}
