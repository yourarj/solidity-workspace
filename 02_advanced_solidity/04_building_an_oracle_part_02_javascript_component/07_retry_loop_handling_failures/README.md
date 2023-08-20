# Handling failures

With `try-catch-finally` in javascript we can handle any possible failure while making a http request

`try-catch-finally` usually looks like

```javascript
try {
    // logic which might throw an error
} catch (error){
    // logic to handle error situation
} finally {
    // logic which will get executed irrespective of failure
}
```