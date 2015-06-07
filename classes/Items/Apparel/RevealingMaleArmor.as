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
	public class RevealingMaleArmor extends ItemSlotClass
	{
		
		public function RevealingMaleArmor() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "R.M.Armor";
			
			this.longName = "revealing male armor";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a revealing set of masculine plate armor";
			
			this.tooltip = "This set of fantasy style armor seems to leave a lot of areas exposed. While it completely covers one's arms and legs in fanciful fetish armor, it barely covers anywhere else. You recognise it is the hero's outfit from the 'Randy Crusade' series.\n\nThere's a set of chains that drape over the chest and connect to a solitary fearsome looking shoulder guard. Other than that there's no upper body covering or armor.\n\nFurther down the loins are 'protected' by an incredibly tight pair of black shiny shorts with a zip in front. Given the ample amount of armor for the limbs, it seems rather pointedly exposed. What an obvious weak spot!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 3000;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 2;
			this.shieldDefense = 0;
			this.sexiness = 4;
			this.critBonus = 0;
			this.evasion = 2;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = this._latestVersion;
		}
		
	}

}