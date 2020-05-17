# first_dapp
My first decentralized application, based on the ethereum blockchain

## Guide - notes on the process

For smoke test:

        truffle console
        Election.deployed().then(function(instance) {app = instance})

this is the equivalent of

        var app = Election.deployed()

But thanks to javascript and its promises that's how things are...
More stuff:

        app.address

returns '0x7a20221c28afA552098d88684201BfE9f7272740'

        app.candidate()

returns 'Candidate 1', so it looks like things are working according to plan
Note that we use candidate() to access to the value of the **public string candidate**; this is because solidity kinda creates getters and setters for the variable contract. Such a nice guy this solidity language.