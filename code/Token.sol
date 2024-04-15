// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.24;

// The list of methods that the ERC20 token must implement
contract ERC20Interface {
    // Returns the total balance of tokens that were first minted
    function totalSupply() public constant returns (uint);

   // Returns the balance of a specific address
    function balanceOf(address tokenOwner) public constant returns (uint balance);

    // Checks if a specific address has enough tokens to transfer
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);

    // Transfers tokens from the total supply to the address
    function transfer(address to, uint tokens) public returns (bool success);

    // Checks if the total supply has enough tokens to transfer
    function approve(address spender, uint tokens) public returns (bool success);

    // Transfers tokens from one address to another
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    // Emitted when value tokens are moved from one account (from) to another (to).
    event Transfer(address indexed from, address indexed to, uint tokens);

    //Emitted when the allowance of a spender for an owner is set by a call to approve. value is the new allowance.
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

//Contract function to receive approval and execute function in one call
contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes data) public;
}

contract TheAnswerCoin is ERC20Interface {
  string public symbol;
  string public name;
  uint8 public decimals;
  uint public _totalSupply;

  mapping(address => uint) balances;
  mapping(address => mapping(address => uint)) allowed;

  constructor() public {
    symbol = "TAC";
    name = "The Answer Coin";
    decimals = 18;
    //42 million and one tokens with 18 decimal places
    _totalSupply = 42000001000000000000000000;
    balances[0xe0B7739ddb2736Ba1c2BD6d15F06022e8FF6dFA9] = _totalSupply;
    // Send _totalSupply to owner address
    emit Transfer(address(0), 0xe0B7739ddb2736Ba1c2BD6d15F06022e8FF6dFA9, _totalSupply);
  }

    // Returns the total balance of tokens that were first minted
    function totalSupply() public constant returns (uint) {
      return _totalSupply  - balances[address(0)];
  }

   // Returns the balance of a specific address
    function balanceOf(address tokenOwner) public constant returns (uint balance) {
      return balances[tokenOwner];
  }

    // Transfers tokens from the total supply to the address
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender] - tokens;
        balances[to] = balances[to] + tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;
    }

    // Checks if the total supply has enough tokens to transfer
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    // Transfers tokens from one address to another
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
          balances[from] = balances[from] - tokens;
          allowed[from][msg.sender] = allowed[from][msg.sender] - tokens;
          balances[to] = balances[to] + tokens;
          emit Transfer(from, to, tokens);
          return true;
    }

    // Checks if a specific address has enough tokens to transfer
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
 
    function approveAndCall(address spender, uint tokens, bytes data) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, this, data);
        return true;
    }

}