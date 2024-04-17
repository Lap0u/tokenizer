    // SPDX-License-Identifier: GPL-3.0

    pragma solidity ^0.4.26;

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

    //require is a function that checks if the condition is true, otherwise it throws an exception
    contract uintMath {
    
        function uintAdd(uint a, uint b) public pure returns (uint c) {
            c = a + b;
            require(c >= a, "Not enough funds");
        }
    
        function uintSub(uint a, uint b) public pure returns (uint c) {
            require(b <= a, "Not enough funds");
            c = a - b;
        }
    
        function uintMul(uint a, uint b) public pure returns (uint c) {
            c = a * b;
            require(a == 0 || c / a == b, "Not enough funds");
        }
    
        function uintDiv(uint a, uint b) public pure returns (uint c) {
            require(b > 0, "Not enough funds");
            c = a / b;
        }
    }

    contract TheAnswerCoin is ERC20Interface, uintMath {

        //These are the default variables required by the ERC20 standard
        string public symbol;
        string public name;
        uint8 public decimals;
        uint public _totalSupply;

        //Arrays or maps according to the language you compare it to
        //This creates an array with all balances
        mapping(address => uint) balances;
        //This creates an array of array with all allowances
        mapping(address => mapping(address => uint)) allowed;

        constructor() public {
        symbol = "TAC";
        name = "42 The Answer Coin";
        decimals = 18;
        //42 million and one tokens with 18 decimal places
        _totalSupply = 42000001000000000000000000;
        balances[0xe0B7739ddb2736Ba1c2BD6d15F06022e8FF6dFA9] = _totalSupply;
        // Send _totalSupply to owner address (0 is the result of the minting process, which is not a real address)
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
            balances[msg.sender] = uintSub(balances[msg.sender], tokens);
            balances[to] = uintAdd(balances[to], tokens);
            emit Transfer(msg.sender, to, tokens);
            return true;
        }

        // Checks if the total supply has enough tokens to transfer to the spender
        function approve(address spender, uint tokens) public returns (bool success) {
            allowed[msg.sender][spender] = tokens;
            emit Approval(msg.sender, spender, tokens);
            return true;
        }

        // Transfers tokens from one address to another
        function transferFrom(address from, address to, uint tokens) public returns (bool success) {
            balances[from] = uintSub(balances[from], tokens);
            allowed[from][msg.sender] = uintSub(allowed[from][msg.sender], tokens);
            balances[to] = uintAdd(balances[to], tokens);
            emit Transfer(from, to, tokens);
            return true;
        }

        // Checks if a specific address has enough tokens to transfer to the spender
        function allowance(address tokenOwner, address spender) public constant returns (uint remaining) {
            return allowed[tokenOwner][spender];
        }
    }