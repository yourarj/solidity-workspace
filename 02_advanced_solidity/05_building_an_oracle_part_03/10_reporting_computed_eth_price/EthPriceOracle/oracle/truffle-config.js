const LoomTruffleProvider = require('loom-truffle-provider')

const path = require('path')
const fs = require('fs')

module.exports = {
  networks: {
    extdev: {
      networkCheckTimeout: 5000,
      provider: function () {
        const privateKey = fs.readFileSync(path.join(__dirname, 'oracle_private_key'), 'utf-8')
        const chainId = 'extdev-plasma-us1'
        const writeUrl = 'wss://extdev-basechain-us1.dappchains.com/websocket'
        const readUrl = 'wss://extdev-basechain-us1.dappchains.com/queryws'
        return new LoomTruffleProvider(chainId, writeUrl, readUrl, privateKey)
      },
      network_id: '9545242630824'
    }
  },
  compilers: {
    solc: {
      version: '0.7.6'
    }
  }
}
