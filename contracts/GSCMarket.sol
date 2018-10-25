pragma solidity ^0.4.23;

contract GSCMarket {
    struct Buyer {
        address buyerAddress;
        bytes32 name;

        uint age;
    }

    mapping (uint => Buyer) public buyerInfo;
    address public owner;
    address[11] public buyers;

    event LogBuyGSCMarket(
        address _buyer,
        uint _id
    );

    constructor() public {
        owner = msg.sender;
    }

    function buyGSCMarket(uint _id, bytes32 _name, uint _age) public payable {
        require(_id >= 0 && _id <= 9);
        buyers[_id] = msg.sender;
        buyerInfo[_id] = Buyer(msg.sender, _name, _age);

        owner.transfer(msg.value);
        emit LogBuyGSCMarket(msg.sender, _id);
    }

    function getBuyerInfo(uint _id) public view returns (address, bytes32, uint) {
        Buyer memory buyer = buyerInfo[_id];
        return (buyer.buyerAddress, buyer.name, buyer.age);
    }

    function getAllBuyers() public view returns (address[10]) {
        return buyers;
    }
}
