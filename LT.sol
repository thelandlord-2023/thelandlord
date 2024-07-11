pragma solidity ^0.6.0;

import "./ERC20Burnable.sol";
import './Operator.sol';


contract LT is ERC20Burnable, Operator {
    
    /**
     * @notice Constructs the LT ERC-20 contract.
     */
    constructor() public ERC20('LT', 'LT') {
        _mint(msg.sender, 1 * 10**18);
    }


    /**
     * @notice Operator mints LT to a recipient
     * @param recipient_ The address of recipient
     * @param amount_ The amount of LT to mint to
     * @return whether the process has been done
     */
    function mint(address recipient_, uint256 amount_)
        public
        onlyOperator
        returns (bool)
    {
        uint256 balanceBefore = balanceOf(recipient_);
        _mint(recipient_, amount_);
        uint256 balanceAfter = balanceOf(recipient_);

        return balanceAfter > balanceBefore;
    }

    function burn(uint256 amount) public override onlyOperator {
        super.burn(amount);
    }

    function burnFrom(address account, uint256 amount)
        public
        override
        onlyOperator
    {
        super.burnFrom(account, amount);
    }
}
