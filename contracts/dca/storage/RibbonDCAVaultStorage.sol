// SPDX-License-Identifier: MIT
pragma solidity =0.8.4;

import {IRibbonVault} from "../../V2/interfaces/IRibbonVault.sol";

struct VaultWithdrawals {
    uint128 yieldVault;
    uint128 dcaVault;
}

abstract contract RibbonDCAVaultStorageV1 {
    // Ribbon V1 vault to earn yield in
    IRibbonVault public yieldVault;
    // Ribbon V2 vault to DCA accrued yield into
    IRibbonVault public dcaVault;
    // The underlying asset of the dcaVault
    address public dcaVaultAsset;
    // Path for swaps
    bytes public swapPath;
    // Dividend per share
    uint256 public magnifiedDividendPerShare;
    // Pending withdrawals from the yield and dca vaults
    VaultWithdrawals public pendingWithdrawals;
    // Updated whenever the token balance of a user changes
    mapping(address => int256) public magnifiedDividendCorrections;
    // Keeps track of users withdrawals from the yield and dca vaults
    mapping(address => VaultWithdrawals) public vaultWithdrawals;
}

// We are following Compound's method of upgrading new contract implementations
// When we need to add new storage variables, we create a new version of RibbonDCAVaultStorage
// e.g. RibbonDCAVaultStorage<versionNumber>, so finally it would look like
// contract RibbonDCAVaultStorage is RibbonDCAVaultStorageV1, RibbonDCAVaultStorageV2
abstract contract RibbonDCAVaultStorage is RibbonDCAVaultStorageV1 {

}
