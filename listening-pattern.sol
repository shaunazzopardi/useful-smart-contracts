interface Listener{
    function notify();
}

contract Notifier{

  mapping(address => boolean) listening;
  address[] listeners;
  
  function funcName(){
      //some action
      
      for(uint i = 0; i < listeners.length; i++){
          if(listeners[i] > 0
                            && listening[listeners[i]]){
              (Listener(listeners[i])).notify();
          }
      }
  }
  
  function register(){
      listeners.push(msg.sender);
      listening[msg.sender] = true;
  }
  
  function deRegister(){
      listening[msg.sender] = false;
  }

}
