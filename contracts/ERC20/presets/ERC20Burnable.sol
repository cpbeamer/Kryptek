// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "contracts/ERC20/ERC20.sol";
import "utils/context.sol";

/**
 * Allows token holders to destroy both their own
 * tokens and those that they have an allowance
 */
abstract contract ERC20Burnable is Context, ERC20 {
    /**
     * Destroys `amount` tokens from the caller.
     *
     */
    function burn(uint256 amount) public virtual {
        _burn(_msgSender(), amount);
    }

    /**
     * Destroys `amount` tokens from `account`, deducting from the caller's
     * allowance.
     *
     *
     * Requirements:
     *
     * - the caller must have allowance for ``accounts``'s tokens of at least
     * `amount`.
     */
    function burnFrom(address account, uint256 amount) public virtual {
        uint256 currentAllowance = allowance(account, _msgSender());
        require(currentAllowance >= amount, "ERC20: burn amount exceeds allowance");
        _approve(account, _msgSender(), currentAllowance - amount);
        _burn(account, amount);
    }
}
