// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract WillThrow {

    // custom exceptions are defined at the begining of smart contract
    error NotAllowedError(string);

    function aFunction () public pure {
        // require(false, "Error in your code");
        // assert(false);
        revert NotAllowedError("You are not allowed");
    }
}

contract ErrorHandling {

    event ErrorLogging(string reason);
    event ErrorLogCode(uint reason);
    event ErrorLogBytes(bytes lowLevelData);

    function catchTheError() public {
        WillThrow will = new WillThrow();

        try will.aFunction() {
            // add code here if it works
        
        } catch Error(string memory reason) {
            emit ErrorLogging(reason); // require error will be catched here
        
        } catch Panic(uint errorCode) {
            emit ErrorLogCode(errorCode); // assert error will be catched here
        
        } catch (bytes memory lowLevelData) {
            emit ErrorLogBytes(lowLevelData);
        }

    }

}