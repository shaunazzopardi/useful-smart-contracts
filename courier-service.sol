contract CourierService{
    
    address owner;
    
    mapping(uint => address) orderToCustomer;
    mapping(uint => uint) orderETA;
    mapping(uint => uint) orderDeliveryTime;
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
    
    function addOrder(address customer, address courier, uint orderNo, uint eta){
        orderToCustomer[orderNo] = customer;
        orderToCourier[orderNo] = courier;
        orderETA[orderNo] = eta;
    }
    
    function customerSignature(uint orderNo){
        require(!delivered[orderNo]);
        
        confirmedBy[orderNo] = msg.sender;
        delivered[orderNo] = true;
        
        orderDeliveryTime[orderNo] = now;
    }
}
