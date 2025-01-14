// Copyright (c) 2016 AzerothCore
// Author: mik1893 - kepler - yehonal
//
// This software is provided 'as-is', without any express or implied
// warranty.  In no event will the authors be held liable for any damages
// arising from the use of this software.

#include "CrossFaction.h"

void CrossFaction::DoForgetPlayersInBG(Battleground* pBattleGround, Player* player)
{
    if (player->isPossessedByPlayer()) // mind control issues
        return;

    for (Battleground::BattlegroundPlayerMap::const_iterator itr = pBattleGround->GetPlayers().begin(); itr != pBattleGround->GetPlayers().end(); ++itr)
    {
        sLog->outDebug(LOG_FILTER_CROSSFACTION, "player %s - Reset Cache", player->GetName().c_str());
        // Here we invalidate players in the bg to the added player
        WorldPacket data1(SMSG_INVALIDATE_PLAYER, 8);
        data1 << itr->first;
        player->GetSession()->SendPacket(&data1);
            
        if (Player* pPlayer = ObjectAccessor::FindPlayer(itr->first))
        {
            player->GetSession()->SendNameQueryOpcode(pPlayer->GetGUID()); // Send namequery answer instantly if player is available
                                // Here we invalidate the player added to players in the bg
            WorldPacket data2(SMSG_INVALIDATE_PLAYER, 8);
            data2 << player->GetGUID();
            pPlayer->GetSession()->SendPacket(&data2);
            pPlayer->GetSession()->SendNameQueryOpcode(player->GetGUID());
        }
    }
}

/// Crossfaction - race update functionalities
/// pre-save a fake race and morph for a player in case his faction is switched in BG.
void CrossFaction::SetFakeRaceAndMorph(Player* player)
{
    if (!player)
        return;

    if (player->getClass() == CLASS_DRUID) // separate case druid because of the morph
    {
        if (player->GetTeamId(true) == TEAM_ALLIANCE) // ALLT
        {
            m_FakeMorph[player->GetGUID()] = player->getGender() == GENDER_MALE ? FAKE_M_TAUREN : FAKE_F_TAUREN;
            m_FakeRace[player->GetGUID()] = RACE_TAUREN;
        }
        else // HORDE
        {
            m_FakeMorph[player->GetGUID()] = FAKE_M_NELF;
            m_FakeRace[player->GetGUID()] = RACE_NIGHTELF;
        }         
    }
    else
    {
        switch(player->getRace(true))
        {
            case RACE_BLOODELF:
                m_FakeRace[player->GetGUID()] = RACE_DRAENEI;
                m_FakeMorph[player->GetGUID()] = player->getGender() == GENDER_MALE ? FAKE_M_DRAENEI : FAKE_F_DRAENEI;
                break;
            case RACE_DRAENEI:
                m_FakeRace[player->GetGUID()] = RACE_BLOODELF;
                m_FakeMorph[player->GetGUID()] = player->getGender() == GENDER_MALE ? FAKE_M_BELF : FAKE_F_BELF;
                break;
            case RACE_DWARF:
                m_FakeRace[player->GetGUID()] = RACE_UNDEAD_PLAYER;
                m_FakeMorph[player->GetGUID()] = player->getGender() == GENDER_MALE ? FAKE_M_UNDEAD : FAKE_F_UNDEAD;
                break;
            case RACE_GNOME:
                m_FakeRace[player->GetGUID()] = RACE_TROLL;
                m_FakeMorph[player->GetGUID()] = player->getGender() == GENDER_MALE ? FAKE_M_TROLL : FAKE_F_TROLL;
                break;
            case RACE_HUMAN:
                m_FakeRace[player->GetGUID()] = RACE_ORC;
                m_FakeMorph[player->GetGUID()] = player->getGender() == GENDER_MALE ? FAKE_M_ORC : FAKE_F_ORC;
                break;
            case RACE_NIGHTELF:
                m_FakeRace[player->GetGUID()] = RACE_TAUREN;
                m_FakeMorph[player->GetGUID()] = player->getGender() == GENDER_MALE ? FAKE_M_TAUREN : FAKE_F_TAUREN;
            case RACE_ORC:
                m_FakeRace[player->GetGUID()] = RACE_HUMAN;
                m_FakeMorph[player->GetGUID()] = player->getGender() == GENDER_MALE ? FAKE_M_HUMAN : FAKE_F_HUMAN;
                break;
            case RACE_TAUREN:
                m_FakeRace[player->GetGUID()] = RACE_NIGHTELF;
                m_FakeMorph[player->GetGUID()] = player->getGender() == GENDER_MALE ? FAKE_M_NELF : FAKE_F_NELF;
                break;
            case RACE_TROLL:
                m_FakeRace[player->GetGUID()] = RACE_GNOME;
                m_FakeMorph[player->GetGUID()] = player->getGender() == GENDER_MALE ? FAKE_M_GNOME : FAKE_F_GNOME;
                break;
            case RACE_UNDEAD_PLAYER:
                m_FakeRace[player->GetGUID()] = RACE_DWARF;
                m_FakeMorph[player->GetGUID()] = player->getGender() == GENDER_MALE ? FAKE_M_DWARF : FAKE_F_DWARF;
                break;
            default:
                m_FakeRace[player->GetGUID()] = player->GetTeamId(true) == TEAM_ALLIANCE ? RACE_ORC : RACE_HUMAN;
                m_FakeMorph[player->GetGUID()] = player->GetTeamId(true) == TEAM_ALLIANCE ? FAKE_M_ORC : FAKE_M_HUMAN;
                break;
        }
    }
}

uint8 CrossFaction::GetFakeRace(uint64 playerGuid)
{
    std::unordered_map<uint64, uint8>::iterator itr = m_FakeRace.find(playerGuid);
    if (itr != m_FakeRace.end())
        return itr->second;
    else
        return 0;
}

uint32 CrossFaction::GetFakeMorph(uint64 playerGuid)
{
    std::unordered_map<uint64, uint32>::iterator itr = m_FakeMorph.find(playerGuid);
    if (itr != m_FakeMorph.end())
        return itr->second;
    else
        return 0;
}

void CrossFaction::SetMorph(Player* player, bool value)
{
    if (player)
    {
        if (value)
        {
            if (GetFakeRace(player->GetGUID()) == 0 || GetFakeMorph(player->GetGUID()) == 0)
                SetFakeRaceAndMorph(player);

            player->setRace(GetFakeRace(player->GetGUID()));
            // player->SetDisplayId(GetFakeMorph(player->GetGUID()));
            // player->SetNativeDisplayId(GetFakeMorph(player->GetGUID()));
        }
        else
        {
            player->setRace(player->getRace(true));
            // player->SetDisplayId(player->GetNativeDisplayId());
            // player->InitDisplayIds();
        }
    }
}

void CrossFaction::ResetCacheWorker()
{
    for (std::unordered_map<uint64, bool>::iterator itr = m_resetCache.begin(); itr != m_resetCache.end(); itr++)
        if (itr->second)
            if (Player* player = ObjectAccessor::FindPlayer(itr->first))
                if (Battleground* bg = player->GetBattleground())
                    DoForgetPlayersInBG(bg, player);
}

/// Crossfaction team update functionalities
/// Update player team and update the map of the leaders
//  reset: used to force the reset to original player team
//  cache reset: used to avoid the battleground player cache reset (set to false to avoid, used to avoid spam of resets)
void CrossFaction::UpdatePlayerTeam(Group* group, uint64 guid, bool reset /* = false */, bool cacheReset /* = true */)
{
    Player* player = ObjectAccessor::FindPlayer(guid);

    if (player)
    {
        if (player->IsGameMaster())
            return;

        if (player->isPossessedByPlayer()) // mind control issues
            return;

        if (player->IsGameMaster()) // disable crossfaction system for player with GM flag enabled
            return;

        bool disable = true;

        // Check disables
        if (isMapEnabled(player->GetMapId()) && isZoneEnabled(player->GetZoneId()) && isAreaEnabled(player->GetAreaId()))
            disable = false;
        else
            sLog->outDebug(LOG_FILTER_CROSSFACTION, "Crossfaction: disabled for player %s", player->GetName().c_str());

        // if not reset or disable, check and change
        if (!reset && !disable)
        {
            // battleground group
            if (player->InBattleground())
            {
                if (Battleground * bg = player->GetBattleground())
                {
                    if (player->GetTeamId(true) != player->GetBgTeamId())
                    {
                        sLog->outDebug(LOG_FILTER_CROSSFACTION, "player %s switched faction!", player->GetName().c_str());

                        SetMorph(player, true); // setup the new display ID for the player, and the new race
                        player->setTeamId(player->GetBgTeamId());
                        player->setFaction(player->GetTeamId() == TEAM_ALLIANCE ? 1 : 2);
                        if(cacheReset)
                            DoForgetPlayersInBG(bg, player); // force to resend race information for this player
                        sLog->outDebug(LOG_FILTER_CROSSFACTION, "Crossfaction: Battleground team id set for player %s", player->GetName().c_str());
                    }
                }
                return;
            }

            SetMorph(player, false); // reset morph if not in bg

            sLog->outDebug(LOG_FILTER_CROSSFACTION, "reset morph for player %u", player->GetGUIDLow());

            // standard group
            uint64 leaderGuid = group ? group->GetLeaderGUID() : player->GetGUID();
            if (leaderGuid != player->GetGUID())
            {
                if (Player* leader = ObjectAccessor::FindPlayer(leaderGuid))
                {
                    player->setTeamId(leader->GetTeamId());
                    player->setFaction(leader->getFaction());
                    return;
                }
                else // if leader guid is offline, access is race from the leader map
                {
                    std::unordered_map<uint64, uint8>::iterator itr = LeaderRaceMap.find(leaderGuid);
                    if (itr != LeaderRaceMap.end())
                    {
                        uint8 raceid = itr->second;
                        ChrRacesEntry const* rEntry = sChrRacesStore.LookupEntry(raceid);
                        if (rEntry) 
                        {
                            player->setFaction(rEntry->FactionID);
                            player->setTeamId(Player::TeamIdForRace(raceid));
                            return;
                        }
                    }
                }
            }
        }

        // all the other cases: reset to the original faction
        player->setTeamId(player->GetTeamId(true));
        ChrRacesEntry const* rEntry = sChrRacesStore.LookupEntry(player->getRace(true));
        player->setFaction(rEntry ? rEntry->FactionID : 0);
        SetMorph(player, false); // reset morph if not in bg

        sLog->outDebug(LOG_FILTER_CROSSFACTION, "reset morph done for player %u", player->GetGUIDLow());

        sLog->outDebug(LOG_FILTER_CROSSFACTION, "Crossfaction: reset done for player %s", player->GetName().c_str());
    }
    else
        sLog->outDebug(LOG_FILTER_CROSSFACTION, "CrossFaction: tried to update faction of player %u but he's not online... ", GUID_LOPART(guid));
}

void CrossFaction::UpdateGroupLeaderMap(uint64 leaderGuid, bool remove)
{
    if (remove)
        LeaderRaceMap.erase(leaderGuid);
    else
        LeaderRaceMap[leaderGuid] = GetLeaderRace(leaderGuid);
}

void CrossFaction::UpdateAllGroups()
{
    for (std::unordered_map<uint64, uint8>::iterator itr = LeaderRaceMap.begin(); itr != LeaderRaceMap.end(); itr++)
        if (Player* leader = ObjectAccessor::FindPlayer(itr->first))
            if(Group* group = leader->GetGroup())
            {
                sLog->outDebug(LOG_FILTER_CROSSFACTION, "Updating faction for group of leader %s", leader->GetName().c_str());

                std::list<Group::MemberSlot> memberSlots = group->GetMemberSlots();
                for (std::list<Group::MemberSlot>::iterator membersIterator = memberSlots.begin(); membersIterator != memberSlots.end(); membersIterator++)
                    sCrossFaction->UpdatePlayerTeam(group, (*membersIterator).guid, false, false);     
            }
}

void CrossFaction::LoadConfig(bool reload)
{
    // clear fake race and morph map
    m_FakeRace.clear();
    m_FakeMorph.clear();
    m_resetCache.clear();

    sLog->outError("CROSSFACTION: Loading disable rules...");
    if (reload)
    {
        mapDisable.clear();
        zoneDisable.clear();
        areaDisable.clear();
    }

    QueryResult mapResult  = ExtraDatabase.PQuery("SELECT id FROM crossfaction_disable where type = 1");
    QueryResult zoneResult = ExtraDatabase.PQuery("SELECT id FROM crossfaction_disable where type = 2");
    QueryResult areaResult = ExtraDatabase.PQuery("SELECT id FROM crossfaction_disable where type = 3");

    // load in the vector the different types of disable
    uint32 mapcount = 0;
    uint32 zonecount = 0;
    uint32 areacount = 0;

    if (mapResult)
    {
        do
        {
            mapDisable.push_back((*mapResult)[0].GetUInt32());
            mapcount++;
        }
        while (mapResult->NextRow());
    }
    
    if (zoneResult)
    {
        do
        {
            zoneDisable.push_back((*zoneResult)[0].GetUInt32());
            zonecount++;
        } 
        while (zoneResult->NextRow());
    }

    if (areaResult)
    {
        do
        {
            areaDisable.push_back((*areaResult)[0].GetUInt32());
            areacount++;
        }   
        while (areaResult->NextRow());
    }

    sLog->outError("CROSSFACTION: %u maps, %u zones, %u areas have been disabled for crossfaction ", mapcount,zonecount,areacount);

    sLog->outError("CROSSFACTION: loading offline group leaders...");

    LeaderRaceMap.clear();
    QueryResult groupResult = CharacterDatabase.PQuery("SELECT c.guid, c.race from characters c, groups g where g.leaderguid = c.guid");

    uint32 leaderCount = 0;

    if (groupResult)
    {
        while (groupResult->NextRow())
        {
            LeaderRaceMap[(*groupResult)[0].GetUInt64()] = (*groupResult)[0].GetUInt8();
            leaderCount++;
        }
    }

    sLog->outError("CROSSFACTION: loaded %u  group leaders",leaderCount);

}

// This function is used to retrieve 
uint8 CrossFaction::GetLeaderRace(uint64 playerGuid)
{
    if (Player* player = ObjectAccessor::FindPlayer(playerGuid))
        return player->getRace(true);
    else
    {
        // Query informations from the DB
        PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_CHAR_PINFO);
        stmt->setUInt32(0, GUID_LOPART(playerGuid));
        PreparedQueryResult result = CharacterDatabase.Query(stmt);

        ASSERT(result); //you cannot have a player non-existing in db that is playing... / a group leader...

        Field* fields = result->Fetch();
        uint8 raceid = fields[4].GetUInt8();

        return raceid;
    }
}

// ALL THE SCRIPT FUNCTIONS AFTER THIS POINT: GROUPSCRIPT, PLAYERSCRIPT, WORLDSCRIPT
class CrossFactionGroup : public GroupScript
{
public:

    CrossFactionGroup() : GroupScript("CrossFactionGroup") { }

    void OnAddMember(Group* group, uint64 guid) override
    {
        if(group)
            sCrossFaction->UpdateGroupLeaderMap(group->GetLeaderGUID());

        sCrossFaction->UpdatePlayerTeam(group, guid);
    }

    // This script is called when a member is removed, but after a new leader has been already picked up - so it's valid to update in here.
    void OnRemoveMember(Group* group, uint64 guid, RemoveMethod /*method*/, uint64 /*kicker*/, const char* /*reason*/) override
    {
        if (group)
            sCrossFaction->UpdateGroupLeaderMap(group->GetLeaderGUID());

        sCrossFaction->UpdatePlayerTeam(group, guid, true);
    }

    // This script is called at the end of the leader change function - m_leader has already been set, we can use the group already (not the guids)
    void OnChangeLeader(Group* group, uint64 newLeaderGuid, uint64  /*oldLeaderGuid*/) override
    {
        sCrossFaction->UpdateGroupLeaderMap(newLeaderGuid);

        std::list<Group::MemberSlot> memberSlots = group->GetMemberSlots();
        for (std::list<Group::MemberSlot>::iterator membersIterator = memberSlots.begin(); membersIterator != memberSlots.end(); membersIterator++)
            sCrossFaction->UpdatePlayerTeam(group, (*membersIterator).guid);
    }

    // On disband, reset all the players to their default race
    void OnDisband(Group* group) override
    {
        if (group)
            sCrossFaction->UpdateGroupLeaderMap(group->GetLeaderGUID(),true);

        std::list<Group::MemberSlot> memberSlots = group->GetMemberSlots();
        for (std::list<Group::MemberSlot>::iterator membersIterator = memberSlots.begin(); membersIterator != memberSlots.end(); membersIterator++)
            sCrossFaction->UpdatePlayerTeam(group, (*membersIterator).guid, true);
    }
};

class CrossFactionVehicle : public VehicleScript
{
public:

    CrossFactionVehicle() : VehicleScript("CrossFactionVehicle") { }

    void OnAddPassenger(Vehicle* veh, Unit* passenger, int8 /*seatId*/) override
    {
        if (!passenger)
            return;

        if (!veh || !veh->GetBase())
            return;

        veh->GetBase()->setFaction(passenger->getFaction());
    }
};

class CrossFactionPlayer : public PlayerScript
{
public:

    CrossFactionPlayer() : PlayerScript("CrossFactionPlayer") { }

    // Called when a player switches to a new zone
    void OnUpdateZone(Player* player, uint32  /*newZone*/, uint32  /*newArea*/) override
    {
        //sCrossFaction->UpdatePlayerTeam(player->GetGroup(), player->GetGUID());
        
        Map* map = player->FindMap();
        uint32 mapId = map->GetId();

        if (mapId == 0
        || mapId == 1
        || mapId == 530
        || mapId == 571)
        {
            player->setFactionForRace(player->getRace());
        }
    }

    // Called when a player changes to a new map (after moving to new map)
    void OnMapChanged(Player* player) override
    {
        if(player && player->GetBattleground())
            sCrossFaction->DoForgetPlayersInBG(player->GetBattleground(), player);

        sCrossFaction->UpdatePlayerTeam(player->GetGroup(), player->GetGUID());
    }

    void OnLogin(Player* player) override
    {
        sCrossFaction->UpdatePlayerTeam(player->GetGroup(), player->GetGUID());
        
        // do it again (?)
        player->setFactionForRace(player->getRace());
    }

    void OnUpdateFaction(Player* player) override
    {
        if (player->IsControlledByPlayer())
            return;

        sCrossFaction->SetFakeRaceAndMorph(player); // set fake race information
        sCrossFaction->UpdatePlayerTeam(player->GetGroup(), player->GetGUID());
    }

    void OnAddToBattleground(Player* player, Battleground* bg) override
    {
        if (player && bg)
        {
            sLog->outDebug(LOG_FILTER_CROSSFACTION, "adding player %lu to bg", player->GetGUID());

            sCrossFaction->SetFakeRaceAndMorph(player); // set (re-set) fake race information
            sCrossFaction->SetResetCache(player->GetGUID(), true);
            sCrossFaction->UpdatePlayerTeam(player->GetGroup(), player->GetGUID()); // this will morph player if he's in BG with switched faction
            sCrossFaction->DoForgetPlayersInBG(bg, player);
        }
    }

    void OnRemoveFromBattleground(Player* player, Battleground* bg) override
    {
        if (player && bg)
        {
            sLog->outDebug(LOG_FILTER_CROSSFACTION, "removing player %lu from bg", player->GetGUID());
            sCrossFaction->UpdatePlayerTeam(player->GetGroup(), player->GetGUID(), true);
            sCrossFaction->SetMorph(player, false); // force reset any morph, then forget players in BG.
            sCrossFaction->DoForgetPlayersInBG(bg, player);
            sCrossFaction->SetResetCache(player->GetGUID(), false);
        }
    }

    void OnLogout(Player* player) override
    {
        // force faction reset on logout to prevent issues with DB save
        sCrossFaction->UpdatePlayerTeam(player->GetGroup(), player->GetGUID(),true);
    }
};

class CrossFactionWorld : public WorldScript
{
public:
    CrossFactionWorld() : WorldScript("CrossFactionWorld") { m_crossfactionUpdateInterval = 10000; m_crossfactionDiff = 0; }

    void OnAfterConfigLoad(bool reload) override
    {
        sCrossFaction->LoadConfig(reload);
    }

    void OnUpdate(uint32 diff) override
    {
        m_crossfactionDiff += diff;
        if (m_crossfactionDiff > m_crossfactionUpdateInterval)
        {
            sCrossFaction->UpdateAllGroups(); // run full group update
            m_crossfactionDiff = 0;
        }
    }

private:
    uint32 m_crossfactionUpdateInterval;
    uint32 m_crossfactionDiff;

};

void AddSC_CrossFaction()
{
    /*new CrossFactionGroup();
    new CrossFactionPlayer();
    new CrossFactionWorld();
    new CrossFactionVehicle();*/
}


