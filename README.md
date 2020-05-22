# first_dapp

My first decentralized application, based on the ethereum blockchain

## Notes

Solidity migration files must be numbered in execution order:

        1_initial_migration.js
        2_deploy_contracts.js
        ...

## Guide

### smoke test:

        truffle deploy | truffle migrate

        truffle console
        Election.deployed().then(function(instance) {app = instance})

this is the equivalent of

        var app = Election.deployed()

But thanks to javascript and its promises that's how things are...

More stuff:

        app.address

returns **'0x7a20221c28afA552098d88684201BfE9f7272740'**

        app.candidate()

returns 'Candidate 1', so it looks like things are working according to plan

Note that we use candidate() to access to the value of the **public string candidate**; this is because solidity kinda creates getters and setters for the variable contract. Such a nice guy this solidity language.

### List candidates:

Ok, so now we have added some more functionality to the Election contract.

To check if it works we need to redeploy our contract:

        truffle migrate --reset

After that, we can access the console, map the contract to a variable and start checking stuff:

        truffle console
        Election.deployed().then(function(i){app=i;})

For instance:

        app.candidates(1)

returns:

        Result {
          '0': BN {
            negative: 0,
            words: [ 1, <1 empty item> ],
            length: 1,
            red: null
          },
          '1': 'Candidate 1',
          '2': BN {
            negative: 0,
            words: [ 0, <1 empty item> ],
            length: 1,
            red: null
          },
          id: BN {
            negative: 0,
            words: [ 1, <1 empty item> ],
            length: 1,
            red: null
          },
          name: 'Candidate 1',
          voteCount: BN {
            negative: 0,
            words: [ 0, <1 empty item> ],
            length: 1,
            red: null
          }
        }

and

        app.candidatesCount()

returns

        BN { negative: 0, words: [ 2, <1 empty item> ], length: 1, red: null }

more things:

Assign app.candidates(1) to the variable candidate

        app.candidates(1).then(function(c){candidate = c;})

Access to attributes

        candidate.id
        candidate.name
        candidate[0]
        candidate[1]
        candidate.id.toNumber()