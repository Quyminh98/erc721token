// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

library Address {
    function isContract(address account) internal view returns (bool) {
        return account.code.length > 0;
    }
}

interface ERC721TokenReceiver {
    function onERC721Received(address _operator, address _from, uint256 _tokenId, bytes calldata _data) external returns(bytes4);
}

interface ERC721 {
    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);

    event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);

    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);

    function balanceOf(address _owner) external view returns (uint256);

    function ownerOf(uint256 _tokenId) external view returns (address);

    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes calldata data) external payable;

    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable;

    function transferFrom(address _from, address _to, uint256 _tokenId) external payable;

    function approve(address _approved, uint256 _tokenId) external payable;

    function setApprovalForAll(address _operator, bool _approved) external;

    function getApproved(uint256 _tokenId) external view returns (address);

    function isApprovedForAll(address _owner, address _operator) external view returns (bool);
}

contract ERC721Token is ERC721 { 
    using Address for address;
    mapping(address => uint) private ownerToTokenCount;
    mapping(uint => address) private idToOwner;
    bytes4 internal constant MAGIC_ON_ERC721_RECEIVE = 0x150b7a02;

    function balanceOf(address _owner) external view returns (uint256) {
        return ownerToTokenCount[_owner];
    };

    function ownerOf(uint256 _tokenId) external view returns (address) {
        return idToOwner[_ownerId];
    };

     function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes calldata data) external payable {
         _safeTransferFrom(_from, _to, _tokenId, data);
    };

    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable {
         _safeTransferFrom(_from, _to, _tokenId, "");
    };

    function _safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes memory data) internal {
        require(msg.sender == _from, "Can't authorized the transfer token");
        require(_from == idToOwner[_tokenId], "Can't authorized the transfer token");
        ownerToTokenCount[_from] -= 1;
        ownerToTokenCount[_to] += 1;
        idToOwner[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
        if(_to. isContract()) {
            ERC721TokenReceiver(_to).onERC721Received(
                msg.sender, _from, _tokeId, _data
            );
            require(retvla = MAGIC_ON_ERC721_RECEIVE, "That is SC, so can't transfer token ");
        }
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) external payable {
        require(msg.sender == _from, "Can't authorized the transfer token");
        require(_from == idToOwner[_tokenId], "Can't authorized the transfer token");
        ownerToTokenCount[_from] -= 1;
        ownerToTokenCount[_to] += 1;
        idToOwner[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
    };

    function approve(address _approved, uint256 _tokenId) external payable {

    };

    function setApprovalForAll(address _operator, bool _approved) external {

    };

    function getApproved(uint256 _tokenId) external view returns (address) {

    };

    function isApprovedForAll(address _owner, address _operator) external view returns (bool) {

    };
    function onERC721Received(address _operator, address _from, uint256 _tokenId, bytes calldata _data) external returns(bytes4) {

    };

}