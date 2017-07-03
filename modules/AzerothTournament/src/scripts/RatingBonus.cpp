/**
    This plugin can be used for common player customizations
 */

#include "ScriptMgr.h"
#include "RatingBonus.h"
#include "Battleground.h"

class RatingBonus : public FormulaScript{
public:

    RatingBonus() : FormulaScript("RatingBonus") { }

    void OnAfterArenaRatingCalculation(Battleground *const bg, int32 &winnerMatchmakerChange, int32 &loserMatchmakerChange, int32 &winnerChange, int32 &loserChange) override
    {
        std::vector<Bonus> currBonuses = sBonusRating->getRatingBonuses();

        // no bonuses right now
        if (currBonuses.size() == 0)
            return;

        for (int i = 0; i < currBonuses.size(); i++)
        {
            if (currBonuses[i].type == bg->GetArenaType())
            {
                winnerMatchmakerChange = winnerMatchmakerChange * currBonuses[i].multiplier;
                winnerChange = winnerChange * currBonuses[i].multiplier;
            }
        }
    }

	void OnBeforeUpdatingPersonalRating(int32 &mod, uint32 type)
	{
		std::vector<Bonus> currBonuses = sBonusRating->getRatingBonuses();

		// no bonuses right now
		if (currBonuses.size() == 0)
			return;

		for (int i = 0; i < currBonuses.size(); i++)
		{
			if (currBonuses[i].type == type)
			{
				mod = (int32)ceil(mod * currBonuses[i].multiplier);
			}
		}
	}

};

void BonusRating::addBonus(int bracket, float multiplier)
{
	// remove an existing same-type bonus if any
	removeBonus(bracket);

	Bonus bonus = {};
	bonus.type = bracket;
	bonus.multiplier = multiplier;
	//sLog->outString("Bonus added: bracket: %d mult: %.2f", bracket, multiplier);
	bonuses.push_back(bonus);
}

void BonusRating::removeBonus(int bracket)
{
	for (int i = 0; i < bonuses.size(); i++)
	{
		if (bonuses[i].type == bracket)
		{
			//sLog->outString("Bonus removed: %d", bracket);
			bonuses.erase(bonuses.begin() + i);
		}
	}
}

void BonusRating::printBonusesToPlayer(ChatHandler * handler, int bracket)
{
	for (int i = 0; i < bonuses.size(); i++)
	{
		if (bonuses[i].type == bracket || bracket == 0)
		{
			handler->PSendSysMessage("|CFF7BBEF7[Rating Bonus]|r: Active bonus on %s %.2fx.", brackets[bonuses[i].type - 1], bonuses[i].multiplier);
		}
	}
	if (bonuses.size() == 0)
	{
		handler->PSendSysMessage("|CFF7BBEF7[Rating Bonus]|r: There are no bonuses right now!.");
	}
}

std::vector<Bonus> BonusRating::getRatingBonuses()
{
    return bonuses;
}

void AddAzTournamentScripts() {
    new RatingBonus();
}
