**MySwap Protocol Contracts v0.1 (beta)**

Overview
--------

The solidity version of the MySwap smart contracts is composed of many
different components that work together to create the (Uniswap-like)
MySwap deployment.

The main contracts are the 1. ERC20 Token contract, an entry point to
the system to deploy the token, the 2. Factory Contract, and an 3.
Exchange contract (implementation of liquidity pools and their
reserves).

![](media/image1.jpg){width="6.268055555555556in"
height="2.6902777777777778in"}

In this process, an ERC-20 token is created be as the exchange token.
The 2. Factory Contract manages the 3. Exchange contracts, creates new
Exchange Contracts and maintains a mapping from token contract address
to its exchange contract address. Each 1. ERC-20 Token contract has its
own 3. Exchange Contract, which executes the transaction to swap tokens.

IERC-20 is has been created to assist interaction with the 3. Exchange
Contract for tis demonstration. When an ERC20 token holder interacts
with another contract using the token, two transactions are required:
The token holder calls approve to set an allowance of tokens that the
contract can use. Secondly, the token holder calls the contract to
perform an action and the contract can transferFrom an amount of tokens
within the set allowance. The receiving contract can use the IERC-20 to
interact with the tokens ERC20 functions.

Upgradeability
--------------

All smart contract functions are public and all upgrades are opt-in. If
significant improvements are made to the system a new version will be
released. Token owners can choose between moving to the new system or
staying in the old one. If possible, new versions will be backwards
compatible and able to interact with the old versions.

Deployed Contracts
------------------

Add testnet link here
---------------------

Docs
----

[Business](https://github.com/sushiswap/sushiswap/blob/master/docs/DEVELOPMENT.md)
Plan

Code Documentation

Warning
-------

MySwap is a work in progress. Make sure you understand the risks before
using it.

Testing
-------

-   

Collaborators
-------------

-   Majid Kareem

-   Ghost

-   Chike Maputu

-   Brendon L Cloete

-   Eclipse

-   Fariz

-   Peter Ndiritu

License
-------

MySwap Protocol is open source.
