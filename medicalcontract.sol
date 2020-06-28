pragma solidity ^0.4.24;

contract record{
    
    address Owner;
    
    // This will be patient data
    struct patient{
        bool isuidgenerated;
        string name;
        uint age;
        string condition;
        bool istreated;
    }

    mapping(address => patient) public patientmapping;
    mapping(address => bool) public doctormapping;
    
    constructor(){
        Owner = msg.sender;
    }
    // This modifier ensures no one else can access patient data
    modifier onlyOwner(){
        require(Owner == msg.sender);
        _;
    }
    
    // This assigns a doctor to the patient
    function setDoctor(address _address) onlyOwner{
        require(!doctormapping[_address]);
        doctormapping[_address] = true;
    }
    
    // The patient data is added into the smart contract using this function
    function setPatientData(string _name, uint _age, string _condition) onlyOwner returns (address){
        address uniqueID = address(sha256(msg.sender, now)); //uniqueID of patient is generated using timestamp
        require(!patientmapping[uniqueID].isuidgenerated);
        patientmapping[uniqueID].isuidgenerated = true;
        patientmapping[uniqueID].name = _name;
        patientmapping[uniqueID].age = _age;
        patientmapping[uniqueID].condition = _condition;
        patientmapping[uniqueID].istreated = false;  
        
        return uniqueID;
    }
    
    // The doctor can update the patient's status from not treated to treated or vice versa using this function
    function updateRecord(address _uniqueID, bool _istreated) returns (string){
        require(doctormapping[msg.sender]);
        patientmapping[_uniqueID].istreated = _istreated;
     
        if(_istreated)
            return "Patient is treated!";
        return "Patient not treated!";
    }

}





