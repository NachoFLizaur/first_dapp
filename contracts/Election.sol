pragma solidity >=0.5.16;

contract Election {
    // Model candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Store accounts that voted
    mapping(address => bool) public voters;

    // Store candidate (key - value pair mapping)
    // Fetch candidate
    mapping(uint => Candidate) public candidates;

    // Store candidates count
    // in case of trying to fecht value for inexistent key
    // the mapping will return default value, that is why we need to keep count
    // default value for uint is 0
    uint public candidatesCount;

    // Constructor
    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    // AddCandidate function: the parameter _name begins w/ underscore because it is a local var
    // name parameter needs to be specified where it is going to be stored [storage | memory]
    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    // vote function: Based in a given candidateId, it will retrieve it from the candidates
    // mapping and increment the voteCount variable by one.
    // It is public so that it can be accessed by every user in the blockchain.
    // We can obtain the address of the account voting thanks to the metadata of the transaction
    function vote(uint _candidateId) public {
        
        // Record that voter has voted
        voters[msg.sender] = true;

        // Update candidate vote Count
        candidates[_candidateId].voteCount ++;

    }
}