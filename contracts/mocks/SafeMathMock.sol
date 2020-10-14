pragma solidity ^0.6.0;

import "../math/SafeMath.sol";
import "../Initializable.sol";

contract SafeMathMockUpgradeSafe is Initializable {
    constructor() public  {
        __SafeMathMock_init();
    }

    function __SafeMathMock_init() internal initializer {
        __SafeMathMock_init_unchained();
    }

    function __SafeMathMock_init_unchained() internal initializer {


    }

    function mul(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMathUpgradeSafe.mul(a, b);
    }

    function div(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMathUpgradeSafe.div(a, b);
    }

    function sub(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMathUpgradeSafe.sub(a, b);
    }

    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMathUpgradeSafe.add(a, b);
    }

    function mod(uint256 a, uint256 b) public pure returns (uint256) {
        return SafeMathUpgradeSafe.mod(a, b);
    }

    uint256[50] private __gap;
}
