pragma solidity ^0.6.0;

import "../math/SignedSafeMath.sol";
import "../Initializable.sol";

contract SignedSafeMathMockUpgradeSafe is Initializable {
    constructor() public  {
        __SignedSafeMathMock_init();
    }

    function __SignedSafeMathMock_init() internal initializer {
        __SignedSafeMathMock_init_unchained();
    }

    function __SignedSafeMathMock_init_unchained() internal initializer {


    }

    function mul(int256 a, int256 b) public pure returns (int256) {
        return SignedSafeMathUpgradeSafe.mul(a, b);
    }

    function div(int256 a, int256 b) public pure returns (int256) {
        return SignedSafeMathUpgradeSafe.div(a, b);
    }

    function sub(int256 a, int256 b) public pure returns (int256) {
        return SignedSafeMathUpgradeSafe.sub(a, b);
    }

    function add(int256 a, int256 b) public pure returns (int256) {
        return SignedSafeMathUpgradeSafe.add(a, b);
    }

    uint256[50] private __gap;
}
