pragma solidity >=0.4.21 <0.7.0;

contract Election {
    // Store candidate
    // Read candidate
    string public candidate;
    // Constructor
    constructor () public {
        candidate = "Candidate 1";
    }
}