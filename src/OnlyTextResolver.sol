//SPDX-License-Identifier: MIT

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
        emit TextChanged(node, key);
    }
}
