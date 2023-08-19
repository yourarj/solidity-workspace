# 05: Metamask & Accounts

- Metamask allows user to manage multiple accounts.
- To find current active acount in metamask
```javascript
var userAccount = web3.eth.accounts[0]
```
- As user can change active account at any time better to keep a watch on this.
e.g. 
```javascript
var accountInterval = setInterval(function() {
  // Check if account has changed
  if (web3.eth.accounts[0] !== userAccount) {
    userAccount = web3.eth.accounts[0];
    // Call some function to update the UI with the new account
    updateInterface();
  }
}, 100);
```