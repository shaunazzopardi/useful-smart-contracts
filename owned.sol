contract Owned{
  address owner;
  
  function Owner(){
    owner = this.address;
  }
  
  modifier isOwner(){
    require(msg.sender == owner);
    _;
  }
  
}
