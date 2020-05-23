// Generate Abstraction of the contract
var Election = artifacts.require("./Election.sol");

// The parameter accounts injects all the accounts in our development blockchain
contract("Election", function (accounts) {
    // so that we can reference the contract instance in the scope of the tests
    var electionInstance;

    it("initializes with two candidates", function () {
        // we create an instance of the contract, and get the candidate count
        return Election.deployed().then(function (instance) {
            return instance.candidatesCount();
            // After it, we chain the promise with another one to check if the number of candidates equal to 2
        }).then(function (count) {
            assert.equal(count, 2);
        });
    });

    it("initializes the candidates with the correct values", function () {
        return Election.deployed().then(function (instance) {
            // asign the contract instance to the var created before so we can access it on the promise chain.
            electionInstance = instance;
            return electionInstance.candidates(1);
        }).then(function (candidate) {
            assert.equal(candidate[0], 1, "Correct ID!");
            assert.equal(candidate[1], "Candidate 1", "Correct name!");
            assert.equal(candidate[2], 0, "Correct vote count!");
            return electionInstance.candidates(2);
        }).then(function(candidate){
            assert.equal(candidate[0], 2, "Correct ID!");
            assert.equal(candidate[1], "Candidate 2", "Correct name!");
            assert.equal(candidate[2], 0, "Correct vote count!");
        });
    });

});