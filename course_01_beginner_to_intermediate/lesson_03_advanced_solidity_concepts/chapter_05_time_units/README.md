# 05: time units

- The variable `now` will return the current *unix timestamp* of the latest block

- Solidity also contains the time units `seconds`, `minutes`, `hours`, `days`, `weeks` and `years`

- Note: Unix time is traditionally stored in a `32-bit` number. This will lead to the "**Year 2038**" problem, when 32-bit unix timestamps will overflow and break a lot of legacy systems. So if we wanted our DApp to keep running 20 years from now, we could use a 64-bit number instead.
