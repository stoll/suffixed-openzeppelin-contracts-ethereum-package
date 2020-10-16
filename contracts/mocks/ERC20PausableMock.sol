// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../token/ERC20/ERC20Pausable.sol";
import "../Initializable.sol";

// mock class using ERC20Pausable
contract ERC20PausableMockUpgradeSafe is Initializable, ERC20PausableUpgradeSafe {

    constructor(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) public  {
        __ERC20PausableMock_init(name, symbol, initialAccount, initialBalance);
    }

    function __ERC20PausableMock_init(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) internal initializer {
        __Context_init_unchained();
        __ERC20_init_unchained(name, symbol);
        __Pausable_init_unchained();
        __ERC20Pausable_init_unchained();
        __ERC20PausableMock_init_unchained(name, symbol, initialAccount, initialBalance);
    }

    function __ERC20PausableMock_init_unchained(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) internal initializer {


        _mint(initialAccount, initialBalance);

    }


    function pause() external {
        _pause();
    }

    function unpause() external {
        _unpause();
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) public {
        _burn(from, amount);
    }

    uint256[50] private __gap;
}
