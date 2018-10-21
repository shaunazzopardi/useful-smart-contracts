interface Listener{
    function notify(string message);
}

contract Notifier{

  mapping(address => bool) listening;
  address[] listeners;
  
  function notifyListeners(string message){
  for(uint i = 0; i < listeners.length; i++){
          if(listeners[i] > 0
                            && listening[listeners[i]]){
              (Listener(listeners[i])).notify(message);
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
