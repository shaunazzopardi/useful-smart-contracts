interface Listener{
    function notify();
}

contract Notifier{

  address[] listeners;
  
  function funcName(){
      //some action
      
      for(uint i = 0; i < listeners.length; i++){
          if(listeners[i] > 0){
              (Listener(listeners[i])).notify();
          }
      }
  }
  
  function register(){
      listeners.push(msg.sender);
  }

}
