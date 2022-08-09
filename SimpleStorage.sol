// SPDX-License-Identifier: MIT
// required as header

pragma solidity 0.8.7;
// pragma solidity >=0.8.0 <0.9.0;
// different versions allow different functions/ options
// always make sure, version of multiple collaborating SmartContracts are similar


// after compiling and deploying this contract, remix ethereum will give us:
// - addPerson (orange)
// - store (orange)
  // these are dynamic functions which cost more and can edit something in the Blockchain

// - nameToFavoriteNumber (blue)
// - people (blue)
// - retrieve (blue)
  // these are static functions which cost less and only call something in the BC

contract SimpleStorage {

    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
