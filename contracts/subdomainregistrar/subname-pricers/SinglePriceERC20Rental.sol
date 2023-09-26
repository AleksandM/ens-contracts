//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import {ISubnamePricer} from "./ISubnamePricer.sol";

contract SinglePriceERC20Rental is ISubnamePricer {
    uint256 public registrationFee; // per second
    address public token;

    constructor(uint256 _registrationFee, address _erc20Token) {
        registrationFee = _registrationFee;
        token = _erc20Token;
    }

    function price(
        bytes32,
        string calldata,
        uint256 duration
    ) public view virtual returns (address erc20Token, uint256 price) {
        price = registrationFee * duration;
        erc20Token = token;
        return (erc20Token, price);
    }
}
