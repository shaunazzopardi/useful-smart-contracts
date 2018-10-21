contract Storage is Owned{
  <type> <name>;
  
  function set<name>(<type> new) isOwner{
      <name> = new;
  }
  
  function get<name>(<type> new) returns(<type>) isOwner{
      return <name>;
  }
}
