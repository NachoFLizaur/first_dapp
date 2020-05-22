pragma solidity >=0.4.21 <0.7.0;

contract Election {
    // Model candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

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
}