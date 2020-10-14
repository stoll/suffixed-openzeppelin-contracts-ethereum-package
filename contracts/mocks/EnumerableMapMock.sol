pragma solidity ^0.6.0;

import "../utils/EnumerableMap.sol";
import "../Initializable.sol";

contract EnumerableMapUpgradeSafeMockUpgradeSafe is Initializable {
    constructor() public  {
        __EnumerableMapUpgradeSafeMock_init();
    }

    function __EnumerableMapUpgradeSafeMock_init() internal initializer {
        __EnumerableMapUpgradeSafeMock_init_unchained();
    }

    function __EnumerableMapUpgradeSafeMock_init_unchained() internal initializer {


    }

    using EnumerableMapUpgradeSafe for EnumerableMapUpgradeSafe.UintToAddressMapUpgradeSafe;

    event OperationResult(bool result);

    EnumerableMapUpgradeSafe.UintToAddressMapUpgradeSafe private _map;

    function contains(uint256 key) public view returns (bool) {
        return _map.contains(key);
    }

    function set(uint256 key, address value) public {
        bool result = _map.set(key, value);
        emit OperationResult(result);
    }

    function remove(uint256 key) public {
        bool result = _map.remove(key);
        emit OperationResult(result);
    }

    function length() public view returns (uint256) {
        return _map.length();
    }

    function at(uint256 index) public view returns (uint256 key, address value) {
        return _map.at(index);
    }


    function get(uint256 key) public view returns (address) {
        return _map.get(key);
    }

    uint256[48] private __gap;
}
