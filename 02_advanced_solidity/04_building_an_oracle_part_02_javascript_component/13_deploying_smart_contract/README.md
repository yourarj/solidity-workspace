# Deploying smart contract

We will discuss about installing smart contracts and prerequisites

## Generating Private Keys
We need two private keys 
1. for `caller` contract
    
    `node scripts/gen-key-for-loom.js caller/caller_private_key`

2. for `oracle` contract
    
    `node scripts/gen-key-for-loom.js oracle/oracle_private_key`

## Confiugring Truffle
We need to make changes to `truffle-config.js` for respective chain and network

following is example truffle config for deploying to `loom`

```javascript
const LoomTruffleProvider = require('loom-truffle-provider')

const path = require('path')
const fs = require('fs')

module.exports = {
  networks: {
    extdev: {
      provider: function () {
        const privateKey = fs.readFileSync(path.join(__dirname, 'oracle_private_key'), 'utf-8')
        const chainId = 'extdev-plasma-us1'
        const writeUrl = 'wss://extdev-plasma-us1.dappchains.com/websocket'
        const readUrl = 'wss://extdev-plasma-us1.dappchains.com/queryws'
        return new LoomTruffleProvider(chainId, writeUrl, readUrl, privateKey)
      },
      network_id: '9545242630824'
    }
  },
  compilers: {
    solc: {
      version: '0.5.0'
    }
  }
}
```

## Creating migration files
Let's create migration inside `migration` folder

e.g. `01_deploy_eth_price_oracle.js`
```javascript
const EthPriceOracle = artifacts.require('EthPriceOracle')

module.exports = function (deployer) {
  deployer.deploy(EthPriceOracle)
}
```

## Hooking deployment script in Package.json

For easy interaction we will integration deployment script in `package.json`

```json
"scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "deploy:oracle": "cd oracle && npx truffle migrate --network extdev --reset -all && cd ..",
    "deploy:caller": "cd caller && npx truffle migrate --network extdev --reset -all && cd ..",
    "deploy:all": "npm run deploy:oracle && npm run deploy:caller"
  },
```