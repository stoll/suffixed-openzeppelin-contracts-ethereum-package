// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./SafeERC20.sol";
import "../../Initializable.sol";

/**
 * @dev A token holder contract that will allow a beneficiary to extract the
 * tokens after a given release time.
 *
 * Useful for simple vesting schedules like "advisors get all of their tokens
 * after 1 year".
 *
 * For a more complete vesting schedule, see {TokenVesting}.
 */
contract TokenTimelockUpgradeSafe is Initializable {
    using SafeERC20UpgradeSafe for IERC20UpgradeSafe;

    // ERC20 basic token contract being held
    IERC20UpgradeSafe private _token;

    // beneficiary of tokens after they are released
    address private _beneficiary;

    // timestamp when token release is enabled
    uint256 private _releaseTime;


    function __TokenTimelock_init(IERC20UpgradeSafe token, address beneficiary, uint256 releaseTime) internal initializer {
        __TokenTimelock_init_unchained(token, beneficiary, releaseTime);
    }

    function __TokenTimelock_init_unchained(IERC20UpgradeSafe token, address beneficiary, uint256 releaseTime) internal initializer {


        // solhint-disable-next-line not-rely-on-time
        require(releaseTime > block.timestamp, "TokenTimelock: release time is before current time");
        _token = token;
        _beneficiary = beneficiary;
        _releaseTime = releaseTime;

    }


    /**
     * @return the token being held.
     */
    function token() public view returns (IERC20UpgradeSafe) {
        return _token;
    }

    /**
     * @return the beneficiary of the tokens.
     */
    function beneficiary() public view returns (address) {
        return _beneficiary;
    }

    /**
     * @return the time when the tokens are released.
     */
    function releaseTime() public view returns (uint256) {
        return _releaseTime;
    }

    /**
     * @notice Transfers tokens held by timelock to beneficiary.
     */
    function release() public virtual {
        // solhint-disable-next-line not-rely-on-time
        require(block.timestamp >= _releaseTime, "TokenTimelock: current time is before release time");

        uint256 amount = _token.balanceOf(address(this));
        require(amount > 0, "TokenTimelock: no tokens to release");

        _token.safeTransfer(_beneficiary, amount);
    }

    uint256[47] private __gap;
}
