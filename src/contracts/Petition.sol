pragma solidity ^0.4.18;

import "./IdManage.sol";

contract Petition {

    mapping(address => bool) hasVoted;

    address idManager;
    string description;
    uint votesFor;
    uint votesAgainst;
    uint256 endEpoch;

    function Petition(string _description, address _idManager) {
        description = _description;
        idManager = _idManager;
    }

    function vote(bytes32 vote) {
        // check ID is valid
        require(IdManager(idManager).checkId(msg.sender));



        if (!hasVoted[msg.sender]) {
            if (vote == bytes32("for")) {
                votesFor++;
            } else if (vote == bytes32("against")) {
                votesAgainst++;
            } else {
                revert();
            }
        }
    }
}

// contract PetitionManager {
//     function VotingManager() {

//     }
// }