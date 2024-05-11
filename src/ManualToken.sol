// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract ManualToken {
    mapping(address => uint256) private s_balances;

    function name() public pure returns (string memory) {
        return "ManualToken";
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _amount) public {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _amount;
        s_balances[_to] += _amount;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
    }

    // function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {}

    // function approve(address _spender, uint256 _value) public returns (bool success) {}

    // function allowance(address _owner, address _spender) public view returns (uint256 remaining) {}
}
