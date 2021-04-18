pragma solidity ^0.6.0;


 // Set the name for display purposes
 // Set the symbol for display purposes
 // Give the creator all initial tokens
 // Amount of decimals for display purposes

contract BetaToken {
    string  public name = "Beta Token";                      
    string  public symbol = "BTA";                           
    uint256 public totalSupply_ = 1000000000000000000000000000000; 
    uint8   public decimals = 18; 

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowed;

    constructor() public {
        balances[msg.sender] = totalSupply_;
    }

    //Users can view the total supply of token to be created
    //Return total amount of tokens   

    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    // Parameter address_owner The address from which the balance will be retrieved
    // Return The balance

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }



    // Notice send `_value` token to `_to` from `msg.sender`
    // Parameter _to The address of the recipient
    // Parameter _value The amount of token to be transferred
    // Return Whether the transfer was successful or not

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Notice `msg.sender` approves `_spender` to spend `_value` tokens
    // Parameter _spender The address of the account able to transfer the tokens
    // Parameter _value The amount of wei to be approved for transfer
    // Return Whether the approval was successful or not   

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // Notice send `_value` token to `_to` from `_from` on the condition it is approved by `_from`
    // Prameter _from The address of the sender
    // Parameter _to The address of the recipient
    // Parameter _value The amount of token to be transferred
    // Return Whether the transfer was successful or not

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        balances[_from] -= _value;
        balances[_to] += _value;
        allowed[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
    // Parameter _owner The address of the account owning tokens
    // Parameter _spender The address of the account able to transfer the tokens
    // Return Amount of remaining tokens allowed to spent

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}