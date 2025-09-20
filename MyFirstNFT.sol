// SPDX-License-Identifier: MIT
  pragma solidity ^0.8.20;

  import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
  import "@openzeppelin/contracts/access/Ownable.sol";

  contract MyFirstNFT is ERC721, Ownable {
      uint256 private _tokenIdCounter;
      mapping(uint256 => string) private _tokenURIs;

      constructor() ERC721("ShanMao First NFT Collection", "MFN") Ownable(msg.sender) {}

      function mintNFT(address recipient, string memory uri)
          public onlyOwner returns (uint256) {
          uint256 tokenId = _tokenIdCounter;
          _tokenIdCounter++;

          _mint(recipient, tokenId);
          _tokenURIs[tokenId] = uri;

          return tokenId;
      }

      function tokenURI(uint256 tokenId) public view override returns (string memory) {
          require(_exists(tokenId), "Token does not exist");
          return _tokenURIs[tokenId];
      }

      function _exists(uint256 tokenId) internal view returns (bool) {
          return _ownerOf(tokenId) != address(0);
      }
  }