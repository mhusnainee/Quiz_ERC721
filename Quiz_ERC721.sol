// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract QuizERC721 is ERC721, ERC721URIStorage, Ownable {
    constructor() ERC721("QuizERC721", "QERC") {}

    mapping (string => uint) private URIs;

    /**
    * @dev safeMint mints the ERC721 Token.
    * @param to - Will be the address of the receiver of minted token.
    * @param tokenId - Will be the unique Id of the minted token.
    * @param uri - Will be the metadata of the minted token.
    * 
    * Requirements:
    * Only owner can call this function
    */
    function safeMint(address to, uint256 tokenId, string memory uri)
        public
        onlyOwner
    {
        require(URIs[uri] != 1, "Can't mint at same uri");
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        URIs[uri] = 1;
        
    }

    

    /**
    * @dev _burn burns the ERC721 Token.
    * @param tokenId - Will be the unique Id of the token to burn.
    */
    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    
    /**
    * @dev tokenURI returns the URI of the ERC721 Token.
    * @param tokenId - Will be the unique Id of the token.
    */
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}
