// Copyright (c) 2009-2011 Satoshi Nakamoto & Bitcoin developers
// Distributed under the MIT/X11 software license, see the accompanying
// file license.txt or http://www.opensource.org/licenses/mit-license.php.

#include "headers.h"
#include "db.h"



//////////////////////////////////////////////////////////////////////////////
//
// mapKeys
//

std::vector<unsigned char> CKeyStore::GenerateNewKey()
{
    RandAddSeedPerfmon();
    CKey key;
    key.MakeNewKey();
/*  AddKey does not checking, and return value is meaningless,
    so don't check the return value for now, to stop meaningless logging
     change later if a meaninfull
    return value is added, or maybe just declare it a void function ?

    if (!AddKey(key))
        throw std::runtime_error("GenerateNewKey() : AddKey failed");
*/
    return key.GetPubKey();
}

bool CKeyStore::AddKey(const CKey& key)
{
    CRITICAL_BLOCK(cs_mapKeys)
    {
        mapKeys[key.GetPubKey()] = key.GetPrivKey();
        mapPubKeys[Hash160(key.GetPubKey())] = key.GetPubKey();
    }
}

