# Returning multiple values from function with Object

We can return mutliple values from function with object

e.g.

```javascript
function myAwesomeFunction () {
  const one = '1'
  const two = '2'
  return { one, two }
}

// calling and unpacking object returned by function
const { one, two } = myAwesomeFunction()

```