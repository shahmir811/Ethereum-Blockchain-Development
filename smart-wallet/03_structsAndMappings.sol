// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract ExampleMappingStruct {

    // Remember Mapping doesn't have any default length (like arrays)
    
    // deposit money
    // withdraw
    // getting the money of the user

    // Struct
    // Current balance
    // number of deposits
    // The actual deposits.
    // Number of withdraws
    // The actual withdraws

    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numOfDeposits;
        mapping(uint => Transaction) deposits;
        uint numOfWithdrawals;
        mapping(uint => Transaction) withdrawals;
    }

    mapping(address => Balance) public balances;

    function getDepositNum (address _from, uint _numOfDeposits) public view returns (Transaction memory) {
        return balances[_from].deposits[_numOfDeposits];
    }


    function depositMoney () public payable {
        balances[msg.sender].totalBalance += msg.value;

        Transaction memory amountDeposited = Transaction(msg.value, block.timestamp);

        balances[msg.sender].deposits[balances[msg.sender].numOfDeposits] = amountDeposited;
        balances[msg.sender].numOfDeposits++;

    }

    function withdrawMoney (address payable _sendMoneyTo, uint _amount) public {
        balances[msg.sender].totalBalance -= _amount;

        Transaction memory amountWithdraw = Transaction(_amount, block.timestamp);
        balances[msg.sender].withdrawals[balances[msg.sender].numOfWithdrawals] = amountWithdraw;
        balances[msg.sender].numOfWithdrawals++;

        _sendMoneyTo.transfer(_amount);
    }



}