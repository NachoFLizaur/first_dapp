# First Dapp - Election

My first decentralized application, based on the ethereum blockchain

## Notes

Solidity migration files must be numbered in execution order:

        1_initial_migration.js
        2_deploy_contracts.js
        ...


### Testing

Testing is extremelly important in smart contract development, as every write action to the blockchain is going to cost the user ETH

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

---

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

To access the addresses in the blockchain:

        web3.eth.getAccounts()

Or individually:

        (await web3.eth.getAccounts())[0]

We can also assign them to a variable as an array with a promise:

        web3.eth.getAccounts().then(function(e){ accounts = e;})
        accounts[0]
        accounts[1]

### Testing for List Candidates

We can create an Election.js file on out test folder.
There we can code all our testings for our smart contract.

To run the tests we can just run:

        truffle test

Note that it always deploys the contracts before testing them.

## src directory

## Deploying app to client-side browser

In the package.json file we can see the dependancies.

Lite-server is used to build all of the client-side assets.

First, we want to migrate our contract with 

        truffle migrate --reset

after that we can run

        npm run dev

to initialize our lite-server.

Note: I had to install several npm packages in order to get lite-server to work.

The dependencies were:
- filename-regex
- object.omit
- parse-glob
- regex-cache

You can install them with:

        npm install [dep-name]

After this a browser opens and you can start using the client-side part of the dapp.

## Connecting to the blockchain

So, after initializing the lite-server, we still need to connect our browser to the blockchain (in our case local-blockchain). This is done with the Metamask extension, you can install it from the extension package manager of your browser of choice, and follow the initial onboarding to configure it, its quite easy.

Once that is done we must change fro mthe main ETH network to a new one, and configure it with the name you want, and the URL of the RPC server in Ganache (in my case HTTP://127.0.0.1:7545).

After that you should be able to see the correct information in the lite-server, instead of the loading... screen you saw before.

In case the account is displayed as *null*, you will need to log-in to metamask with one of the accounts present in Ganache:
1. Copy the private key of one of the accounts
2. Go to the metamask extension and select import account
3. Paste the private key you just copied
4. Reload page

If you still see *null*, you need to manually reconnect to localhost on your metamask plugin:
1. Go to metamask user configuration.
2. Go to connections.
3. In Add Site, type "localhost" and click connect.
4. Reload the page.