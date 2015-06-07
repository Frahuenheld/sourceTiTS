package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * Swapped in and out of Annos statblock to determine her state/type of dress.
	 * @author Gedan
	 */
	public class ZipPouch extends ItemSlotClass
	{
		
		public function ZipPouch() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			this.shortName = "Z.Pouch";
			
			this.longName = "zip pouch";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a sexy zip pouch jock strap";
			
			this.tooltip = "This jock strap is all kinds of alluring, made of black fabric and designed to hug one's junk and show it off. Running along the groin is a zip designed to entice potential onlookers. When wearing this garment the wearer's ass is brazenly exposed.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 1000;
			this.attack = -1;
			this.damage = 0;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 2;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = this._latestVersion;
		}
	}
}