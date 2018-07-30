contract CourierService{
    
    address owner;
    
    mapping(uint => address) orderToCustomer;
    mapping(uint => address) orderToCourier;
    mapping(uint => address) confirmedBy;
    mapping(uint => bool) delivered;
    
    function CourierService(){
        owner = msg.sender;
    }
    
    modifier isOwner(){
        require(msg.sender == owner);
        _;
    }
    
    function addOrder(address customer, address courier, uint orderNo){
        orderToCustomer[orderNo] = customer;
        orderToCourier[orderNo] = courier;
    }
    
    function sign(uint orderNo){
        require(msg.sender == orderToCustomer[orderNo] || msg.sender == orderToCourier[orderNo]);
                    
        if(confirmedBy[orderNo] == 0 && !delivered[orderNo]){
            confirmedBy[orderNo] = msg.sender;
        }
        else{
            if(confirmedBy[orderNo] == orderToCustomer[orderNo]
                && msg.sender == orderToCourier[orderNo]){
                    delivered[orderNo] = true;
                }
                else if(confirmedBy[orderNo] == orderToCourier[orderNo]
                        && msg.sender == orderToCustomer[orderNo]){
                            delivered[orderNo] = true;
                        }
        }
    }
}
