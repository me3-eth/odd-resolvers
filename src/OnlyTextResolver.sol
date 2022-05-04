//SPDX-License-Identifier: MIT

//Twitter: @hodl_pcc
//
/* This code should work for most ERC-721 contracts. Please feel free to reuse

- Change IERC721Enumerable contract address in constructor
- Update domainLabel value
- Update nftImageBaseUri value to the base path of the images
- Set controller address of the parent domain to this deployed contract (in ENS web app)
*/

pragma solidity ^0.8.2;

contract OnlyTextResolver {
    mapping(bytes32 => mapping(string => string)) public texts;

    event TextChanged(bytes32 indexed node, string key);

    function supportsInterface(bytes4 interfaceID) public pure returns (bool) {
        return interfaceID == 0x59d1d43c || interfaceID == 0x01ffc9a7;
    }

    function text(bytes32 node, string calldata key) external view returns (string memory) {
      return texts[node][key];
    }

    /// @dev purposefully unauthorised
    function setText(bytes32 node, string calldata key, string calldata value) external {
        texts[node][key] = value;
        emit TextChanged(node, key, key);
    }
}
