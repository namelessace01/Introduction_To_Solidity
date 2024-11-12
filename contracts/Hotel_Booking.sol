// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Hotel {

    address payable tenant;
    address payable landlord;

    uint public room_no = 0;
    uint public agreement_no = 0;
    uint public rent_no = 0;

    struct Room {
        uint roomid;
        uint agreementid;
        uint monthly_rent;
        uint securityDeposit;
        uint timestamp;

        string roomname;
        string room_address;

        bool vacant;

        address payable currentTenant;
        address payable landlord;
    }

    mapping (uint => Room) public Room_by_No;

    struct RoomAgreement {
        uint roomid;
        uint agreementid;
        uint monthly_rent;
        uint securityDeposit;
        uint lockInPeriod;
        uint timestamp;

        string Roomname;
        string RoomAddress;

        address payable tenantAddress;
        address payable landlordAddress;
    }

    mapping (uint => RoomAgreement) public RoomAgreement_by_No;

    struct Rent {
        uint rentno;
        uint roomid;
        uint agreementid;
        uint monthly_rent;
        uint timestamp;

        string Roomname;
        string RoomAddress;

        address payable tenantAddress;
        address payable landlordAddress;
    }

    mapping (uint => Rent) public Rent_by_No;


    modifier onlyLandlord(uint _index) {
        require(msg.sender == Room_by_No[_index].landlord, "Only Accessible by the Landlord");
        _;
    }

    modifier notLandlord(uint _index) {
        require(msg.sender != Room_by_No[_index].landlord, "Only Accessible byt the Tenant");
        _;
    }

    modifier isRoomVacant(uint _index) {
        require(Room_by_No[_index].vacant == true, "Room is Currentl Occupied");
        _;
    }

    modifier enoughEther(uint _index) {
        require(msg.value >= uint(Room_by_No[_index].monthly_rent), "Not Enough Ether In Your Wallet");
        _;
    }

    modifier enoughAgreementfee(uint _index) {
        require(msg.value >= uint (
            uint(Room_by_No[_index].monthly_rent) + uint(Room_by_No[_index].securityDeposit)));
        _;
    }

}
