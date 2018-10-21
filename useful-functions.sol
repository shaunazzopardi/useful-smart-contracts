contract UsefulFunctions{

//from https://openzeppelin.org/api/docs/AddressUtils.html
  function isContract(address addr) internal view returns (bool) {
    uint256 size;
    assembly { size := extcodesize(addr) }
    return size > 0;
  }


}
