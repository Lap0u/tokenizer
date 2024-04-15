# The Answer Coin Documentation

## Introduction

The Answer Coin (TAC) is an ERC20 token implemented on the Ethereum blockchain. It follows the ERC20 standard and provides a set of methods for token management.

## ERC20Interface

The `ERC20Interface` contract defines the methods that the ERC20 token must implement. These methods include:

- `totalSupply()`: Returns the total balance of tokens that were first minted.
- `balanceOf(address tokenOwner)`: Returns the balance of a specific address.
- `allowance(address tokenOwner, address spender)`: Checks if a specific address has enough tokens to transfer.
- `transfer(address to, uint tokens)`: Transfers tokens from the total supply to the address.
- `approve(address spender, uint tokens)`: Checks if the total supply has enough tokens to transfer.
- `transferFrom(address from, address to, uint tokens)`: Transfers tokens from one address to another.

The `ERC20Interface` contract also defines two events:

- `Transfer(address indexed from, address indexed to, uint tokens)`: Emitted when value tokens are moved from one account (from) to another (to).
- `Approval(address indexed tokenOwner, address indexed spender, uint tokens)`: Emitted when the allowance of a spender for an owner is set by a call to approve. The value is the new allowance.

## TheAnswerCoin

The `TheAnswerCoin` contract is the implementation of the ERC20 token. It inherits from the `ERC20Interface` contract and implements all the required methods.

### Constructor

The constructor of `TheAnswerCoin` initializes the token symbol, name, decimals, and total supply. It also assigns the total supply to the owner's address.

### Token Management Methods

The `TheAnswerCoin` contract provides the following token management methods:

- `totalSupply()`: Returns the total balance of tokens that were first minted.
- `balanceOf(address tokenOwner)`: Returns the balance of a specific address.
- `transfer(address to, uint tokens)`: Transfers tokens from the sender's address to the specified address.
- `approve(address spender, uint tokens)`: Approves the specified address to spend the sender's tokens.
- `transferFrom(address from, address to, uint tokens)`: Transfers tokens from one address to another.
- `allowance(address tokenOwner, address spender)`: Returns the remaining allowance of tokens for a specific address.
