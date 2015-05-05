//Here’s some basic dialogue and some flavor ideas. Use what you like and edit or discard the rest if any! Also note, I am developing a serious appreciation for the amount of effort you put into this stuff. It ain’t easy! Hehehehehehehe. Anyways, if anything else is needed, just let me know. 


//Since Yammi can be removed from the shop later, making this so I only have to change stuff once.
public function yammiShopDisplay():void
{
	if(flags["YAMMI_HAS_JOINED"] == undefined);
	{
		showName("\nYAMMI");
		showBust("YAMMI");
	}
	else
	{
		showName("\nSALIRE");
	}
	author("Lady Jenn");
}

public function yammiIsCrew():Boolean
{
	if(flags["YAMMI_HAS_JOINED"] == 1) return true;
	return false;
}

public function yammiIsNotCrew():Boolean
{
	if(flags["YAMMI_HAS_JOINED"] == undefined) return true;
	return false;
}

public function icedTeatsExteriorBonusFunc():Boolean
{
	author("Lady Jenn");
	output("\n\nTo the south, a colorful building boasts an illuminated signboard proudly displaying the title: Iced Teats Frozen Treats and Confectionery Company. Beneath it is the catch line: The number one supplier in female-based frozen sweets. All flavors harvested fresh from the breast, guaranteed safe for any humanoid or similar entity! Above all this is an image of a fetching pink skinned woman with bright crimson hair, dressed in barely enough clothing to contain her assets. She is reclined comfortably and holding a bowl of what appears to be ice cream, which is cleverly animated to cascade slowly through a number of appetizing colors.");
	if(flags["MET_YAMMI"] == undefined) output("\n\nWell, maybe it’s worth checking out! After all, if anyone deserves a cool treat it’s a brave space explorer, risking life and limb day after day!");
	return false;
}

public function icedTreatsInterior():Boolean
{
	yammiShopDisplay();
	showName("ICED\nTEATS");
	//First Chance to Hire Yammi
	if(flags["YAMMIS_BAD_DAY"] != undefined);
	{
		output("You stroll into Iced Teats looking for something tasty. You notice something's amiss when Yammi doesn't immediately greet you in her usual happy manner. Instead she is leaned on the counter looking glum, chin rested on her fist. You stroll over and inquire as to the source of her woes.");
		output("\n\n<i>“My bosses have decided that since I get so many fines, they're upping my shelter and food bills, in any moment. It's going to double the cost of me getting out of here.”</i> She sighs and stands up, then shakes her head. <i>“I've tried telling them it's not my fault but they don't care. This is the second time they've done this to me! I'm starting to wonder if I'll ever get out of here.”</i>");
		output("\n\nYou tell her to keep her hopes up, then ask how much she owes.");
		output("\n\n<i>“Right now I owe 5000 credits. As soon they mail me, it'll basically be twice that. And I was so close! I could have been out of here in seven standard pay-cycles!”</i>");
		processTime(3);
		clearMenu();
		addButton(0,"Sympathy",sympathizeWithYammi);
		if(pc.credits >= 5000) addButton(1,"BuyContract",payYammisContract);
		else addDisabledButton(1,"BuyContract","BuyContract","You can't afford to pay that much.");
	}
	if(flags["YAMMI_HAS_JOINED"] != undefined);
	{
		output("You head into the Iced Teats shop, looking to enjoy something cool and delicious. When you enter, a blue skinned woman with black hair smiles at you, her light blue vest barely holding her bulging d-cup breasts in place. She greets you with the familiar <i>“Welcome to Iced Teats!  My name is Salire, what can I get for you today?”</i> She has the eager happiness of someone new to their job and looking to make a good impression.");
		output("\n\n<i>“Cone, Bowl, or Feast?”</i> She inquires pleasantly.");
		processTime(1);
		clearMenu();
		if(pc.credits >= 10) addButton(0,"Cone",orderAYammiCone,undefined,"Cone","Order a cone for the low low price of 10 credits.");
		else addDisabledButton(0,"Cone","Cone","You can't afford the 10 credits for a cone.");
		if(pc.credits >= 20) addButton(1,"Bowl",orderAYammiBowl,undefined,"Bowl","Order a bowl for the not so low price of 20 credits.");
		else addDisabledButton(1,"Bowl","Bowl","You can't afford the 20 credit cost of a bowl of titty-milk icecream. How sad.");
		if(pc.credits >= 50) addButton(2,"Feast",orderAYammiFeast,undefined,"Feast","Order a veritable feast of icecream. It only costs 50 credits - a huge savings, according to the menu.")
		else addDisabledButton(2,"Feast","Feast","You can't afford the 50 credits a feast would cost.");
		addButton(14,"Back",mainGameMenu);
	}
	if(flags["MET_YAMMI"] == undefined);
	{
		flags["MET_YAMMI"] = 1;
		output("The shop interior is made up of row after row of clear plastic devices with trays in front for bowls, and handles to draw the ice cream treats. On taking a second look, you realize each one appears to be occupied by a female form! Before you can make much of this, your attention is called to the right, where the cashier calls to you.");
		output("\n\n<i>“Hello! Welcome to Iced Teats!”</i>");
		output("\n\nThis tall orange skinned woman has short lime green hair and bright red eyes. She wears a bright red miniskirt and vest combo that she must have to squeeze her C-cups into with a shoehorn. Her eye shadow, nail polish, and lipstick all share the hue of her hair. Her ears are bony fans, her fingers webbed, and she has gill slits on her neck, betraying an amphibious origin. Her smile is inviting and warm as you step up to the counter.");
		output("\n\n<i>“My name is Yammi! What can I get for you today?”</i> She chirps happily, indicating the large flavor list behind her. <i>“We have cones, bowls, or frozen feasts, in any combination of flavors you prefer!”</i>");
		processTime(1);
		//(Options include ‘Cone’, ‘Bowl’, ‘Feast’, ‘Questions’, and ‘Back’, with back leaving the store)
		yammiRepeatMenu(false);
		return true;
	}
	else
	{
		output("The shop interior is made up of row after row of clear plastic devices with trays in front for bowls, and handles to draw the ice cream treats. Just like last time, you spot women occupying the space inside the machinery. Yammi calls to you almost as soon as you step inside the door.");
		output("\n\n<i>“Welcome back to Iced Teats! When you'd like to order, just say the word.”</i> The orange-skinned alien is dressed the same as the last time you saw her, sporting a bright red miniskirt and vest combo that would threaten sensibilities on a more modest world. Her cheerful eyes watch you curiously as you make your way around the shop.");
		addButton(0,"Yammi",yammiRepeatMenu,true,"Yammi","Approach the aquatic alien behind the counter.");
		return false;
	}
}

public function yammiRepeatMenu(outputS:Boolean = true):void
{
	if(outputS)
	{
		clearOutput();
		yammiShopDisplay();
		output("You step up to brightly-colored alien. Do you order something or strike up some conversation?");
	}
	clearMenu();
	if(pc.credits >= 10) addButton(0,"Cone",orderAYammiCone,undefined,"Cone","Order a cone for the low low price of 10 credits.");
	else addDisabledButton(0,"Cone","Cone","You can't afford the 10 credits for a cone.");
	if(pc.credits >= 20) addButton(1,"Bowl",orderAYammiBowl,undefined,"Bowl","Order a bowl for the not so low price of 20 credits.");
	else addDisabledButton(1,"Bowl","Bowl","You can't afford the 20 credit cost of a bowl of titty-milk icecream. How sad.");
	if(pc.credits >= 50) addButton(2,"Feast",orderAYammiFeast,undefined,"Feast","Order a veritable feast of icecream. It only costs 50 credits - a huge savings, according to the menu.")
	else addDisabledButton(2,"Feast","Feast","You can't afford the 50 credits a feast would cost.");
	addButton(3,"Questions",questionsForYammi,undefined,"Questions","Strike up a conversation and ask her about some stuff.");
	if(flags ["YAMMI_SYMPATHYZED"] != undefined) addButton(4,"BuyContract",payYammisContract);
	addButton(14,"Back",mainGameMenu);
}

//Questions
public function questionsForYammi():void
{
	clearOutput();
	yammiShopDisplay();
	output("<i>“Of course! Anything you care to know!”</i> Yammi nods vigorously.");
	//(Select from ‘Ice Cream’, ‘Girls’, ‘Company’, ‘Yammi’, ‘Suggestions’, ‘Sex’, or ‘Back’)
	//9999
	clearMenu();
	addButton(0,"Ice Cream",askYammiAbootIceCream);
	addButton(1,"Girls",askYammiAbootZeGurls)
	addButton(2,"Company",askYammiAboutTheCompany);
	addButton(3,"Herself",askHerAboutHerself);
	addButton(5,"Sex",askyammiAboutSex);
	addButton(14,"Back",yammiRepeatMenu,false);
}

//Choose ‘Cone’
public function orderAYammiCone():void
{
	clearOutput();
	yammiShopDisplay();
	pc.credits -= 10;
	output("<i>“Just a taste today? Certainly! Here you are!”</i> With a flourish, ");
	if(flags["YAMMI_HAS_JOINED"] == undefined);
	{
		output("Yammi ");
	}
	if(flags["YAMMI_HAS_JOINED"] != undefined);
	{
		output("Salire ");
	}
	output("produces a deep cone made of red-brown wafer. <i>“Our cones are 100% natural nutrients healthy for any carbon based life form and easily digestible for silicates!”</i>");
	preparingToGetIceCream("cone");
}

//Choose Bowl
public function orderAYammiBowl():void
{
	clearOutput();
	yammiShopDisplay();
	pc.credits -= 20;
	output("\n\n<i>“A hearty appetite, I see!”</i> ");
	if(flags["YAMMI_HAS_JOINED"] == undefined);
	{
		output("Yammi ");
	}
	if(flags["YAMMI_HAS_JOINED"] != undefined);
	{
		output("Salire ");
	}
	output("smiles and hands you a black bowl and spoon. <i>“Here you are. When you’re done, just toss those out. They automatically break down to simple particles in 48 hours so they don’t pollute!”</i>");
	preparingToGetIceCream("bowl");
}

//Choose Feast
public function orderAYammiFeast():void
{
	clearOutput();
	yammiShopDisplay();
	pc.credits -= 50;
	output("<i>“As you wish! Here you go!”</i> ");
	if(flags["YAMMI_HAS_JOINED"] == undefined);
	{
		output("Yammi ");
	}
	if(flags["YAMMI_HAS_JOINED"] != undefined);
	{
		output("Salire ");
	}
	output("pulls a tray with three bowl-like depressions in it from beneath the counter. <i>“Mix and match to your heart’s content, and you can keep the tray for use at home! Careful you don’t get a headache though!”</i> She giggles.");
	preparingToGetIceCream("feast");
}

//Preparing to get ice cream
public function preparingToGetIceCream(servingType:String = "cone"):void
{
	yammiShopDisplay();
	output("\n\nYou examine the selection before you, each device containing a woman with her tits wrapped in a net of straps ready to surrender her flavored breast milk for your snacking pleasure. Various tubes and devices are in place to feed them, please them, and clean them. As you examine the flavor tags on each machine, the occupant watches you from inside; some are expectant, some a bit tired, and some look pleading, their massive melons overfull.");
	//(Flavors would be Gewinfruit, Yokto, Blitzaberry, Strawberry, Jumbijumbi, Darginut, Chocolate, and Flameberks)
	clearMenu();
	addButton(0,"Gewinfruit",gewinFruit,servingType,"Gewinfruit","Try some gewinfruit flavor. It's supposed to be quite rich.");
	addButton(1,"Yokto",getYokto,servingType,"Yokto","Try some Yokto flavor.");
	addButton(2,"Blitzaberry",blitzaberryCone,servingType,"Blitzaberry","Try some blitzaberry, a childhood favorite.");
	addButton(3,"Strawberry",strawberryIcedCream,servingType,"Strawberry","Try some strawberry. Who doesn't love strawberries?");
	addButton(4,"Jumbijumbi",JumbijumbiCream,servingType,"Jumbijumbi","You hear it's an acquired taste!");
	addButton(5,"Darginut",darginutIcedCream,servingType,"Darginut","Try some darginut, a hearty favorite of U.G.C. troops.");
	addButton(6,"Chocolate",chocolateIcedCream,servingType,"Chocolate","Who doesn't love chocolate?");
	addButton(7,"Flameberks",flameberksIcedCream,servingType,"Flameberks","Judging by the name alone, it has to be spicy.");
}

//Gewinfruit
public function gewinFruit(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Cone
	if(servingType == "cone")
	{
		if(flags["HAD_GEWINFRUIT"] == undefined)
		{
			output("You’ve heard of Gewinfruit. They’re supposed to be very rich in flavor, so you decide to try it while it’s just a cone-full. The grey-skinned woman inside looks a touch on the weary side as you set your cone in the holder. She must be one of the popular ones!");
			output("\n\nWhen you pull the lever, she closes her eyes slowly. It takes a couple seconds, but the machine quick-freezes and whips her fresh breast-juice into a kiwi-green ice cream. You can feel the vibration of the machine as it works pumps and motors inside, then your cone is full, leaving her visibly sighing and looking disappointed.");
			output("\n\nThe ice cream is very savory, and you take your time to finish it. It feels like it fills you more than maybe it should.");
		}
		//Repeat Cone
		else
		{
			output("You decide the Gewinfruit was worth a second go. The grey skinned dispenser girl watches you approach and you almost hear a groan. Clearly she gets a lot of small time cones and not as many bowls as she would like. While you sympathize, you’re only here for a treat. The cone is slow to fill again, proving her continued popularity. You leave her somewhat disappointed again, but enjoy your savory green ice cream anyways.");
		}
	}
	//Bowl/Feast
	else
	{
		if(flags["HAD_GEWINFRUIT"] == undefined)
		{
			output("Gewinfruit, you have been told, are quite flavor-rich. This sounds right up your alley! You set the bowl in place to fill, and the grey-skinned woman inside the machine perks up. She had looked a bit weary, probably a popular flavor, but the prospect of certain pleasure has her attention.");
			output("\n\nYou pull the lever, and her eyes close as the machinery hums to life. For several seconds you watch her squirm in her casing, then the machine begins to fill your bowl with freshly pumped, frozen, and whipped ice cream in a curious kiwi-green color. As your bowl fills with ice cream, her face continues to darken, until her eyes suddenly snap open in a look of sexual bliss you know well. It takes a couple seconds after that to finish filling your bowl.");
			output("\n\nYou stroll away, trying the first spoonful and finding a savory taste to your snack. This looks like something you’re going to enjoy, and it turns out to be pretty filling.");
		}
		//Repeat Bowl/Feast
		else
		{
			output("You return to the Gewinfruit flavor-girl, and she looks pleased to see you again. Obviously a woman that enjoys her work! As usual, she’s pretty tapped out, and it takes you almost half a minute to fill your bowl. Her deepening blush and look of ecstacy make it worthwhile. You then wink to her and head off to enjoy your filling, savory meal.");
		}
	}
	flags["HAD_GEWINFRUIT"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.HP(5);
	}
	else if(servingType == "bowl") 
	{
		processTime(8);
		pc.HP(15);
	}
	else 
	{
		processTime(12);
		pc.HP(50);
	}
	clearMenu();
	addButton(0,"Next",yammiRepeatMenu,true);
}

//Yokto
public function getYokto(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Cone
	if(servingType == "cone")
	{
		if(flags["HAD_YOKTO"] == undefined)
		{
			output("Yokto? You’ve never even heard of it. Well, you have a cone anyways, not like you’re committing too much. As you approach the machine, the gold scaled reptilian woman inside looks outright desperate, her bosoms bulging in their web of straps. Must not be a local favorite.");
			output("\n\nYou set up your cone and pull the lever, and instantly a pale yellow ice cream starts to fill it. Inside the machine, the woman’s face turns to an expression of relief. You’re sure if her mouth wasn’t taken up with a feed-tube she’d be thanking you!");
			output("\n\nAfter only a couple seconds, you have a heaping cone of Yokto-flavored ice cream. You take an experimental lick, and find it to be somewhere between an orange and a lemon in sourness, but with almost the flavor of a blueberry! You suspect it won’t be an unpopular taste for long.");
		}
		//Repeat Cone
		else
		{
			output("You come back to the golden scaled Yokto girl, and note that her breasts seem somewhat less swollen than last time. Clearly she’s seeing more customers lately! The cone still fills up lightning fast, but she looks pleased to have some more of her burden taken away. You feel happy to help her, especially since it nets you a tart treat!");
		}
	}
	//Bowl/Feast
	else
	{
		if(flags["HAD_YOKTO"] == undefined)
		{
			output("You haven’t heard of a Yokto before, but isn’t adventure your job description? You place the bowl down and reach for the lever. Inside the machine, a golden scaled reptilian looks absolutely ecstatic to have a customer. Her breasts are swollen inside the mesh that holds them, betraying a lack of clients. That makes you debate, but only for a second.");
			output("\n\nThe lever is pulled and immediately pale yellow ice cream begins flooding the bowl. The golden woman inside the machine bucks as much as her restraints allow, and achieves orgasm in moments. These devices are really something! Before your rapidly filling container is topped off entirely, she even manages a second! You feel happy to have given her such a good time as you collect your treat, hoping she’ll return the flavor... err, favor!");
			output("\n\nThe first spoonful hits you with an unexpected blueberry flavor with a sourness somewhere between a lemon and an orange. It’s very strong, but quite good. You suspect she won’t remain disused for long once people start to try her.");
		}
		//Repeat Bowl/Feast
		else output("You return to the golden Yokto-girl and place your bowl on the tray. She looks like she remembers you, and you can all but hear her thank you past her feed tube. Her tits still look full, but she’s obviously seeing more traffic since last time. A quick pull of her lever proves she’s still pouring out her milk with speed, as it only takes seconds for your bowl to fill, and her to climax. You wander away to munch on your ice cream and leave her to recover.");
	}
	flags["HAD_YOKTO"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.HP(2);
		pc.energy(2);
	}
	else if(servingType == "bowl") 
	{
		processTime(8);
		pc.HP(7);
		pc.energy(7);
	}
	else 
	{
		processTime(12);
		pc.HP(25);
		pc.energy(25);
	}
	clearMenu();
	if(flags["YAMMI_HAS_JOINED"] == undefined);
	{
		addButton(0,"Next",yammiRepeatMenu,true);
	}
	if(flags["YAMMI_HAS_JOINED"] != undefined);
	{
		addButton(0,"Next",icedTreatsInterior);
	}
}

//Blitzaberry
public function blitzaberryCone(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Cone
	if(servingType == "cone")
	{
		if(flags["HAD_BLITZABERRY"] == undefined)
		{
			output("You remember Blitzaberries... you had some way back, and you remember the sugar rush fondly! It’s still a bit odd to imagine a connection between the small dark berries and the chalk-white, grey haired woman inside the machine, but you hope for the best. The woman almost appears to be napping as you approach.");
			output("\n\nYour cone sits in the holder, and the dark purple ice cream begins to flow. The woman’s expression hardly changes from the meditative expression she wore when you arrived. Even as you walk away, there’s no reaction. Must be nice to be able to do that with your tits in a literal vice, you decide.");
			output("\n\nThe cone surprises you by tasting exactly like fresh Blitzaberries! They’re so sickeningly sweet you almost can’t eat it, but fond childhood memories push you to devour the whole cone in only a handful of bites. In a few minutes you’re shaking slightly and suddenly want to do ANYTHING to burn off some energy!");
		}
		//Repeat Cone
		else output("You head back to the meditative Blitzaberry gal. What was good once is going to be great the second time! She opens her eyes slightly to note your presence as you place your cone and pull the lever, but you have to marvel at her serenity as you fill it. You doubt you’ll ever achieve the level of calm she has. Especially not after wolfing down your hyper-sugary ice cream again!");
	}
	//Bowl/Feast
	else
	{
		if(flags["HAD_BLITZABERRY"] == undefined)
		{
			output("When it comes to sugar rushes, you’ve never had anything like a Blitzaberry. You had them when you were much younger and you still recall them with fondness. The chalk-white skinned woman inside the machine has grey hair, neither of which exactly screams ‘blitzaberry’ to you since they’re very small and dark, but you’re sure she must be the right one... maybe?");
			output("\n\nYou set your bowl in place, noting her oddly serene and sleepy expression. When you crank the handle, the machine buzzes to life, and dark purple ice cream begins to steadily fill it up. Her expression hardly moves until almost the exact point that you release the handle, then she suddenly opens her eyes and reaches physical nirvana. As her expression changes to a dreamy one, you try a spoonful of your snack.");
			output("\n\nHey, they nailed it! Just as sweet as you remember, and by the time you’ve finished the bowl you’ll know it’s just as sugary too, since your spoon will be rattling around even when you’re trying to hold still. Ah, sugar!");
		}
		//Repeat Bowl/Feast
		else output("You return to the serene Blitzaberry woman for another helping of sweet sugary goodness. As you pump out a fresh batch, you note she hardly moves a muscle, and even after you finish it takes the machine several seconds of buzzing and chugging to make her reach orgasm. You marvel at her meditative skill, since these devices are custom set to make their occupant get off as swiftly as possible! You debate how she must do it as you begin shovelling sugary goodness into your mouth... you are heading for a belly-ache, but you don’t care!");
	}
	flags["HAD_BLITZABERRY"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.energy(7);
	}
	else if(servingType == "bowl") 
	{
		processTime(8)
		pc.energy(20);
	}
	else 
	{
		processTime(12);
		pc.energy(75);
	}
	clearMenu();
	if(flags["YAMMI_HAS_JOINED"] == undefined);
	{
		addButton(0,"Next",yammiRepeatMenu,true);
	}
	if(flags["YAMMI_HAS_JOINED"] != undefined);
	{
		addButton(0,"Next",icedTreatsInterior);
	}
}

//Strawberry
public function strawberryIcedCream(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Cone
	if(servingType == "cone")
	{
		if(flags["HAD_STRAWBERRY"] == undefined)
		{
			output("You double-take. Strawberry? It’s listed as a new flavor even! You haven’t had strawberries in quite a while. You’re impressed that the woman inside even has pink skin and darker hair. Being new, she’s seen use, but her tits aren’t empty yet. Far from it! She looks quite happy to see you, like the fresh faced saleswoman she might have been had her tits not come out just right.");
			output("\n\nYou pop the cone into place and pull the lever. She visibly tenses inside, her boobs not yet used to being squeezed of the goods. Lucky for her you’re just here for a cone, so she can relax after only a quick few seconds. The dark red ice cream looks very much like strawberry-color.");
			output("\n\nMmmm, it even tastes like actual fresh strawberries, not the artificial type of flavor!");
		}
		//Repeat Cone
		else
		{
			output("You head back to your strawberry machine. Why not? She still looks eager to serve! As you get a fresh cone, you note she looks more relaxed this time. Girls here must get used to their role as quick as she fills your cone! You give her a smile and a nod as you stroll off, enjoying your nice chill strawberry taste.");
		}
	}
	//Bowl/Feast
	else
	{
		if(flags["HAD_STRAWBERRY"] == undefined)
		{
			output("Strawberry! Really? You are shocked, but here it is, a ‘new’ flavor you’ve always enjoyed. You chuckle at how long things take to get around! You miss them, so you head over, noting the pink skinned, pink haired woman inside looking as inviting as she can. She is quite eager to sell her product, you can see. Her tits speak of considerable success, but they’re far from done.");
			output("\n\nYou pop your bowl in place and pull the lever, and she becomes tense, not used to her tits being juiced yet. The machinery sets to work helping her relax in the most direct way possible. Your bowl is three quarters full of dark red ice cream when she goes off like a rocket, and then visibly drains of all her tension. You smile at her, knowing she’ll be getting more used to this in no time.");
			output("\n\nWhat do you know? It tastes just like real strawberries, not even the artificial flavor! This bowl isn’t going to last you long at all!");
		}
		//Repeat Bowl/Feast
		else
		{
			output("You pop back in to see Miss Strawberry. She looks eager as ever, and nods a bit as you place your bowl. She’s getting better at both relaxing during the squeeze, and at holding off orgasm. It takes until you have a full bowl for her to reach a climax this time! You chuckle at her happy afterglow and head out to eat your strawberry snack.");
		}
	}
	flags["HAD_STRAWBERRY"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.HP(2);
		pc.energy(2);
	}
	else if(servingType == "bowl") 
	{
		processTime(8);
		pc.HP(7);
		pc.energy(7);
	}
	else 
	{
		processTime(12);
		pc.HP(25);
		pc.energy(25);
	}
	clearMenu();
	if(flags["YAMMI_HAS_JOINED"] == undefined);
	{
		addButton(0,"Next",yammiRepeatMenu,true);
	}
	if(flags["YAMMI_HAS_JOINED"] != undefined);
	{
		addButton(0,"Next",icedTreatsInterior);
	}
}

//Jumbijumbi
public function JumbijumbiCream(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Choose Cone
	if(servingType == "cone")
	{
		if(flags["HAD_JUMBIJUMBI"] == undefined)
		{
			output("Jumbijumbi is supposed to be one of those ‘acquired tastes’, so you decide to only risk it in small quantities for now. The presentation is normal enough: A mauve skinned woman with bright red insectile eyes watches you with a look of casual boredom. She doesn’t appear to be unused, but she isn’t as exhausted as some of the girls you’ve seen.");
			output("\n\nYou pop your cone in and pull the lever. The ice cream comes out very slowly, being black as tar and very thick. You debate about your choice, but decide to go ahead, especially given the almost disapproving look you’re getting from the woman you’re pumping from. You resolve to eat it and enjoy it if it’s even vaguely possible!");
			output("\n\nIn all honesty, it’s pretty horrible. It rakes your taste buds like razors, almost like you don’t have the proper equipment to taste it and your body is just guessing. To your astonishment, you soon find yourself popping the last of the cone into your mouth! How did you eat all that?!");
		}
		//Repeat Cone
		else output("\n\nYou approach the bored Jumbijumbi dispensing woman again, deciding to risk it once more. You still don’t know how you ate all the last batch you got, so you determine to pay more attention this time. While you fill your cone the lady looks somewhat more well disposed to you, maybe because you didn’t make a horrible face last time? You walk away and lick your awful tasting cone, debating about how much pride she must take in her terrible ice cream and..... oh, blast it, you’re done again?! How do you keep eating it so fast?");
	}
	//Choose Bowl/Feast
	else
	{
		if(flags["HAD_JUMBIJUMBI"] == undefined)
		{
			output("You hesitate at the Jumbijumbi machine. You’ve heard it’s a taste you really have to build yourself up to. Well, you didn’t get where you are by being timid! You stride up to the machine and decide to get yourself a good serving of it, no matter the flavor it hits you with!");
			output("\n\nThe woman inside has mauve skin and bright red insectile eyes, and when you approach she shifts from bored to curious. Her breasts are used but not much. Perhaps she doesn’t see many people coming for a full bowl. Either way you fearlessly place it on the tray and pull the lever. Thick black ice cream slowly oozes out, while she looks very surprised. It seems she’s not used to full on stimulation! Despite the efforts of the machine she still hasn’t achieved climax by the time your bowl is done filling, which is quite a feat given the pace it fills.");
			output("\n\nYou walk away and pop a spoonful in your mouth. It’s pretty gross, though you don’t know why. Maybe you just don’t have taste buds for this particular flavor of terrible? You debate just how they can turn a profit on such a godawful flavor. There must be some race that likes it, but..... wait a second, where did it all go? You feel very full. Did you honestly eat all of that?");
		}
		//Repeat Bowl/Feast
		else output("\n\nYou approach the Jumbijumbi machine again, still uncertain how you gulped down the last batch. Throwing caution to the wind, you set your bowl in place. Inside the machine, the insect eyed mauve woman looks pleased to see you again. She looks even more pleased as you pull the lever and the machinery sets to work on her. The ice cream is as dark and slow as it was before. You fill it up and take your gross tasting frozen snack, leaving her to her pleasures. Once again, the ice cream is virtually inedible. You can’t even imagine how you ate so much last time. It’s not an acquired taste, it’s an atrocity. How would anyone ever.... Oh, for crying out loud, where did it all go? Again? How do you do that and not notice?! Is it just so awful your brain doesn’t record it somehow or what?");
	}
	flags["HAD_JUMBIJUMBI"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.HP(1);
		pc.energy(1);
	}
	else if(servingType == "bowl") 
	{
		processTime(8);
		pc.HP(3);
		pc.energy(3);
	}
	else 
	{
		processTime(12);
		pc.HP(9);
		pc.energy(9);
	}
	clearMenu();
	if(flags["YAMMI_HAS_JOINED"] == undefined);
	{
		addButton(0,"Next",yammiRepeatMenu,true);
	}
	if(flags["YAMMI_HAS_JOINED"] != undefined);
	{
		addButton(0,"Next",icedTreatsInterior);
	}
}

//Darginut
public function darginutIcedCream(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Choose Cone
	if(servingType == "cone")
	{
		if(flags["HAD_DARGINUT"] == undefined)
		{
			output("Darginuts, so you’ve heard, are a staple in military food packs. Apparently they are tasty and healthy little things, and a lot of soldiers like them as a taste of home since they’re widely grown. You’ve never had the good fortune, so you decide to give it a shot.");
			output("\n\nThe fur covered woman inside the machine is streaked light and dark brown, and her feeding leaves her with cute chipmunk-cheeks. You bet if you opened the machine you could find a bushy tail. You pop your cone in place and she watches you with excited curiosity. When you pull the lever, she virtually shakes with pleasure. Excitable type, isn’t she? The ice cream is a light beige-brown, and it comes out in shots, indicating she’s as often used as you assumed.");
			output("\n\nYou lick at your cone. What did you expect? It tastes very nutty, almost wood-like, and it sticks with you for almost an hour. You see why soldiers would like them, Darginut remains on your tongue long after you finish eating it.");
		}
		//Repeat Cone
		else
		{
			output("You saunter up to the Darginut machine again, eager for another long lasting taste. The fuzzy girl inside seems interested in what you do, and you suspect her attention span must be short indeed. Her ice cream flows a little more steadily this time, and she vibrates as much as her toys must in there. It must take a lot of feed to supply such a high-strung woman! You wander off with your cone, debating about perhaps buying bulk Darginuts to round out your ship’s rations. At least then you’d have something to munch on as you jump from planet to planet!");
		}
	}
	//Choose Bowl/Feast
	else
	{
		if(flags["HAD_DARGINUT"] == undefined)
		{
			output("You’ve heard that soldiers like Darginuts because they grow them everywhere, and they’re healthy and easy to munch on. You’ve never had the pleasure, but if it’s good enough for the military surely it’s good enough for you. The Darginut machine calls!");
			output("\n\nYou put your bowl on the tray and reach for the lever. The woman inside has striped light and dark brown fur and bright, curious eyes, her cheeks puffed out from feeding, and you bet there’s a big fluffy tail in there too. As you begin drawing your ice cream, she practically vibrates on her own from the machine’s stimulation. Boy, she’s an energetic one! Your ice cream comes in short spurts of beige-brown, displaying her popularity. It takes you a while, and her three very rapid climaxes, to fill the bowl.");
			output("\n\nIt’s woody, very nutty, and quite delicious! The flavor sticks with you a while too. You can see where they’re popular.... Maybe you should buy some to fill in the ‘cockpit munchies’ requirement.");
		}
		//Repeat Bowl/Feast
		else output("You head back to the Darginut dispenser, ready for another helping of nutty goodness. The woman inside seems attentive to your actions again, and you wonder if she recalls what happens when people stroll up to her each time. As you pull the lever, she begins shaking with pleasure, causing the machine to rattle quite a bit. The ice cream comes more steadily this time than it did before, allowing you to fill the bowl in only two of her climaxes. You shake your head and smile as you head out with your ice cream, glad to see someone enjoying her job so much!");
	}
	flags["HAD_DARGINUT"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.HP(5);
		pc.energy(1);
	}
	else if(servingType == "bowl") 
	{
		processTime(8);
		pc.HP(13);
		pc.energy(5);
	}
	else 
	{
		processTime(12);
		pc.HP(40);
		pc.energy(20);
	}
	clearMenu();
	if(flags["YAMMI_HAS_JOINED"] == undefined);
	{
		addButton(0,"Next",yammiRepeatMenu,true);
	}
	if(flags["YAMMI_HAS_JOINED"] != undefined);
	{
		addButton(0,"Next",icedTreatsInterior);
	}
}

//Chocolate
public function chocolateIcedCream(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Choose Cone
	if(servingType == "cone")
	{
		if(flags["HAD_CHOCOLATE"] == undefined)
		{
			output("You stroll past several machines, then you spot one with a banner you like: Chocolate! It seems some things never fall out of favor! You are pleased there’s at least something you know for certain you like in here.");
			output("\n\nThe woman in the machine is chocolate skinned herself, and despite her tits being almost half again the size of any other one you’ve seen in here, she looks tired and well used. Of course, she would be a popular flavor, wouldn’t she? You also note she’s blindfolded, probably to prevent people from getting a big dose of pleading eyes. You shrug and silently apologize as you draw your cone from her, which takes quite a while since she’s so tapped it only comes out at a drizzle.");
			output("\n\nOh, sweet chocolate! You hadn’t really expected to find this one here, but you’re very glad you did, and a little disappointed you only bought a cone.");
		}
		//Repeat Cone
		else
		{
			output("You head back to the sweet chocolate vendor, and she’s as well used as before. You set the cone in place to fill and note it’s just as slow as it was. Her popularity can’t be questioned. She seems to sigh as you collect your cone. Oh well, you’re sure they change the girl in the case at least daily if she’s that tuckered out! You head out with your delicious ice cream in hand.");
		}
	}
	//Choose Bowl/Feast
	else
	{
		if(flags["HAD_CHOCOLATE"] == undefined)
		{
			output("You walk around a little, when suddenly your eye catches something. Hello! Chocolate! The woman inside is as dark skinned as her flavor, and she looks very tired and well tapped, despite her tits being almost half again as big as anyone else’s in here. She’s also blindfolded, maybe to prevent guilt-inducing looks.");
			output("\n\nYou set your bowl on the tray and pull the lever. She tilts her head back in a groan as a drizzle of chocolate begins to fill the bowl. It takes a long time to fill, but you’re patient, and to your surprise the flow never actually stops. All the while she is clearly given a thorough workout by the machine she occupies. You are astonished that it still hasn’t gotten her to orgasm by the time you’re done. You move away with it still chugging on towards her reward.");
			output("\n\nMmmmm, sweet literally milk chocolate! You’re very pleased you spotted that one!");
		}
		//Repeat Bowl/Feast
		else
		{
			output("Time for more chocolate, you decide. When you reach her, she’s just as tired as before. You suppose that’s one of those hazards of fame you hear about. You get filling your bowl and she shudders as the pleasure inducing devices set to work. Of course, even slow as she tends to be, you’re done long before she is. You head out, happily spooning chocolate into your mouth and knowing she’ll appreciate the climax later.");
		}
	}
	flags["HAD_CHOCOLATE"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.HP(2);
		pc.energy(2);
	}
	else if(servingType == "bowl") 
	{
		processTime(8);
		pc.HP(7);
		pc.energy(7);
	}
	else 
	{
		processTime(12);
		pc.HP(25);
		pc.energy(25);
	}
	clearMenu();
	if(flags["YAMMI_HAS_JOINED"] == undefined);
	{
		addButton(0,"Next",yammiRepeatMenu,true);
	}
	if(flags["YAMMI_HAS_JOINED"] != undefined);
	{
		addButton(0,"Next",icedTreatsInterior);
	}
}

//Flameberks
public function flameberksIcedCream(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Choose Cone
	if(servingType == "cone")
	{
		if(flags["HAD_FLAMEBERKS"] == undefined)
		{
			output("You come across a flavor you’ve never even heard of. Flameberks? What the heck is a Flameberk? You decide you have got to try this.");
			output("\n\nThe woman in the machine has flame-orange hair and skin of a molten-metal red. She looks pleased as you walk up, almost like she’s welcoming another victim. You decide to show no fear as you get your cone of the bright orange ice cream, hoping that her extremely full bosoms feel quite a squeeze as you do so. By the rate it comes out, you suspect she’s a flavor for only the brave.");
			output("\n\nYou’re right, although you manage to keep yourself from reacting near enough for her to see. This stuff is like licking the active end of a flame thrower! It’s only sheer guts that keeps you working at it until it’s done, and even then you require a fair bit of time between licks. That’s not a treat, that’s torture!");
		}
		//Repeat Cone
		else
		{
			output("Maybe you just hate yourself today, or maybe you’re becoming a masochist, but you decide to grab a cone of Flameberks flavor ice cream. The red woman inside the machine looks modestly impressed to see you again. You fill your cone and try not to sweat, but your body knows what’s coming up, and you don’t think you succeed. Still, you put on a brave front, and you’re well out of her sight before you take your first lick. It’s every bit as agonizing as you remember. Why did you get this stuff again?");
		}
	}
	//Bowl/Feast
	else
	{
		if(flags["HAD_FLAMEBERKS"] == undefined)
		{
			output("What in the world is a Flameberk? That’s what you ask yourself as you stroll up to the machine of that label. Well, as an intrepid space explorer, you feel duty bound to answer that question!");
			output("\n\nYou slide the bowl in place. The woman you’ll be juicing for this stuff has fire orange hair and molten metal red skin, and she looks pleased to see you. She seems to welcome her latest helpless victim. You look stern as you crank the lever down, and bright orange ice cream begins to fill the bowl. It comes quickly, and by how full her tits look you can tell she’s something of a specialty flavor. She also refuses to lose that half-taunting look, despite the fact you can feel the machine working her like a pro. You get well out of her view before you begin to chow down.");
			output("\n\nIt’s so hot! Why did you get so much!? You soldier on, taking long breaks between spoonfuls, but it’s sheer agony to finish. You think you’d rather drink lit napalm. By the time you’re done, your guts are very angry at you. You’re afraid they might decide to move out on you while you sleep! Right there you resolve never to try an actual Flameberk.");
		}
		//Repeat Bowl/Feast
		else
		{
			output("You don’t know why you do it, but here you are again, sliding your bowl onto the Flameberks tray. For what it’s worth the normally taunting woman seems genuinely impressed to see you, and that fills you with pride. She also seems less able to resist the forced orgasm she’s delivered, which makes you feel better too. You head off with a smug look, ice cream in one hand and spoon in the other. Of course that supremacy lasts only until your first spoonful of frozen breast milk based torture hits your tongue! Your stomach demands to know why you hate it so much.");
		}
	}
	flags["HAD_FLAMEBERKS"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.HP(1);
		pc.energy(1);
	}
	else if(servingType == "bowl") 
	{
		processTime(8);
		pc.HP(3);
		pc.energy(3);
	}
	else 
	{
		processTime(12);
		pc.HP(9);
		pc.energy(9);
	}
	clearMenu();
	if(flags["YAMMI_HAS_JOINED"] == undefined);
	{
		addButton(0,"Next",yammiRepeatMenu,true);
	}
	if(flags["YAMMI_HAS_JOINED"] != undefined);
	{
		addButton(0,"Next",icedTreatsInterior);
	}
}

public function askYammiAbootIceCream():void
{
	clearOutput();
	yammiShopDisplay();
	output("You have to admit you’re curious about the whole idea, so you ask about the ice cream. Yammi perks right up.");
	output("\n\n<i>“Oh, I hoped you’d ask! Iced Teats has been around for a very long time. Our founder Gelkenminah Broboskin Dravimilink the Eleventh supposedly came from a very hot world where drinkable moisture was reserved exclusively for breeding females. Everyone else just had to rely on their body absorbing what it could from the hot, dry world. Now, this may be apocryphal, since this was a very long time ago, but supposedly one day he got off his world and found a lover, and when they had children he was amazed to find that she lactated.”</i> She poses to display the best curve of her barely restrained mammaries. <i>“Discovering a source of sweet flavor and moisture got him to thinking, and it wasn’t long before he found ideal cooling-coil technology, a few genetic artists, and some 100% legal, legitimate indentured servants. The rest is history: he built the company and his descendants have made it a smash hit, moving from original flavors to carefully cultivated unique flavors over the company’s long lifespan!”</i>");
	output("\n\nYou express your doubts about the story, and Yammi looks distressed.");
	output("\n\n<i>“I assure you that it’s as accurate as historians have been able to verify!”</i> she notes.");
	output("\n\nIn an effort to move the conversation along, you go back to clarify the source of the desserts.");
	output("\n\n<i>“100% genuine female mammaries, or the nearest equivalent gland!”</i> she explains proudly, with a sweeping gesture around the store. <i>“Our girls have been exclusively selected and carefully bio-tweaked to provide the ultimate in cool refreshment, flavor, and nutrition to the sentient races of the cosmos!”</i>");
	output("\n\nWell, that explains the product fairly well, doesn’t it?");
	//(Select ‘Back’ to return to the Questions menu)
	processTime(6);
	clearMenu();
	addButton(0,"Next",questionsForYammi);
}

//Girls
public function askYammiAbootZeGurls():void
{
	clearOutput();
	yammiShopDisplay();
	output("You glance at the machines nearby, noting the shapes of women trapped inside, and inquire with Yammi about them. Surely that can’t be a comfortable job.");
	output("\n\n<i>“All production servants are fed, sheltered, and comfortably orgasmed well in excess of galactic minimum standards. Genetic engineering has been involved to bring each one to production output and produce appropriate flavoring. All indentured workers and servers are almost considered legal property of the Iced Teats Confectionery Company,”</i> she recites.");
	output("\n\nYou roll your eyes. Even ice cream stores have legal jargon these days! Calling her attention back to the point of your question, you indicate the discomfort they must feel in those machines.");
	output("\n\n<i>“It’s really hard for me to sympathize with them, actually. They get one day on, two days off, spa treatments, exercise, great food, entertainments.... It’s really not fair!”</i> Yammi’s expression turns somewhat sour. <i>“They’re indentured servants, almost all of them were bred specifically for this role, so they don’t know any other life. The machines are carefully made to be comfortable as can be, and they have massaging devices to keep them from getting stiff and achy. Plus every time they make more than a cone, they get an orgasm.”</i>");
	output("\n\nThat seems like not too bad of a job, except for the bit about being enslaved. You note as much to Yammi, and she rolls her eyes.");
	output("\n\n<i>“Just between us, I kind of wish I’d made the cut. I mean sure, I actually have the chance to buy out my own contract and get out of here eventually, but they get all the good things, you know?”</i>");
	output("\n\nYou let her know your curiosity is piqued by the ‘buying out contract’ comment. Sounds like there’s a loophole in this arrangement.");
	output("\n\n<i>“Well, indentured servants have to work to pay off all the food, shelter, and so on that their master has given to them. It’s like being in deep debt. Since I just have those bills to pay off, I just need to squirrel away enough tips and make a bit of credit on the side. Eventually I’ll be able to afford it!”</i> She smiles cheerfully at the idea. <i>“The producers though, their bills are huge and they only get more expensive. Spas and gyms aren’t cheap! They’re in it for life, so they should be happy that life is going to be mostly pleasant.”</i> Yammi seems to have a hint of jealousy in her voice.");
	output("\n\nWell, their situation could certainly be worse, you are forced to admit. Still, what a job. You imagine it must be a punishing task to make so much ice cream in a day.");
	output("\n\n<i>“It absolutely is. Some of our best selling flavors have to be switched out once a day, twice on some holidays! The extractor is also a little on the merciless side. The intense squeezing and suction occasionally bruises overused flavors a little. One or two of them that are adapted for hot environments also bitch endlessly about the ice coils being so close to their nipples.”</i> Yammi crosses her arms and shrugs. <i>“But really, they have hyper metabolisms as far as digesting food and making cream. I’ve never yet seen one run out! They just slow down a little bit. And the constant feed ensures they have ample fuel for the process. As for their aches and gripes, they should just be happy they don’t have to deal with screaming angry customers throwing things at them and cursing at them all the time.”</i> Realizing she just resorted to grousing about her job, Yammi’s cheeks flush a cute blood-orange color and she covers her mouth, then notes: <i>“I’m just going to stop talking now! Sorry!”</i>");
	output("\n\nYou chuckle and tell her it’s alright, to put her at ease. No point getting her in trouble.");
	//(Select ‘Back’ to return to the Questions menu)
	processTime(9);
	clearMenu();
	addButton(0,"Next",questionsForYammi);
}

//Company
public function askYammiAboutTheCompany():void
{
	clearOutput();
	yammiShopDisplay();
	output("You ask about the company. It sounds like a big one, you might trip over them somewhere down the line. It can’t hurt to know a thing or two about them.");
	output("\n\n<i>“Iced Teats is one of the oldest confections companies still in operation. They are careful to manage their recruitment programs and keep ample stocks of indentured workers on hand in case opportunities for expansion pop up. The males they use for breeding are also typically used for light labor or office work.”</i> She leans on her counter and looks thoughtful. <i>“The company prides itself on never retiring a flavor. They’re also proud to note that because of their stocks of indentured servants, no less than three species have been saved from extinction after galactic calamities wiped out every other viable genetic deposit. They are also on the leading edge of collecting new species, snatching up breeders as soon as they are legally able and rapidly expanding their stores.”</i>");
	output("\n\nWell, that sounds not terrible, given that it’s a giant soulless corporation. You then notice Yammi leaning closer, and suspect she has more to add.");
	output("\n\n<i>“Just between you, me, and the stars? I’m not entirely convinced that they have all that legality in mind. I’ve seen some new girls get hauled in and they weren’t all that cooperative. Others came in and I had only just heard of their species a month prior.”</i> She says hushedly. <i>“It doesn’t happen often, but in a company this big they could be kidnapping and enslaving thousands of new girls. Not at gunpoint, mind you. One I remember seeing came up in a newspaper as vanishing because of huge gambling debts, and another one was a sports player who lost them a huge amount of money after they funded her career.”</i>");
	output("\n\nWell, that’s pretty interesting. You make a mental note to keep your ears open for further news. When you ask Yammi if she has more details, she shakes her head.");
	output("\n\n<i>“I’m just a cashier. And look, these people raised me. They’ve given me everything I have. Not all of them are bad. But somewhere in the middle of the company, something’s gone a little rotten.”</i>");
	output("\n\nShe suddenly goes back to fiddling with her register, and you can’t get her to approach the topic any more. She must sense something extraordinary in you to have risked such a sensitive bit of information. You decide not to press further.");
	//(Select ‘Back’ to return to the Questions menu)
	processTime(5);
	clearMenu();
	addButton(0,"Next",questionsForYammi);
}

//Yammi
public function askHerAboutHerself():void
{
	clearOutput();
	yammiShopDisplay();
	output("<i>“Eh? Me?”</i> Yammi blushes a darling blood-orange. <i>“I’m nobody special. Just an indentured servant who didn’t have the right genes for production use. I just work here as a cashier.”</i>");
	output("\n\nYou invite her to fill you in a little more. After all, everyone is someone, right?");
	output("\n\n<i>“Well, I am an amphibian, that’s pretty neat. I even sleep in a tub of water. Very comfortable!”</i> She wracks her brain to try and find anything interesting to say about herself. <i>“Nope. That’s about it. I was bred and raised by the company and I’ve worked for them my whole life. I’m hoping to buy out my contract and get out and about soon. Apparently my people live a looong time, so I should have plenty of opportunities.”</i>");
	output("\n\nYou see an opening and slip right in, inquiring about what she would do and where she’d go when she’s free of contractual obligations?");
	output("\n\n<i>“Well, think first I’d find some warm water-world and take a vacation. I get one day out of ten off around here. It’s terrible. I need a little unwinding time, you know?”</i> She looks off into the middle distance and sighs. <i>“Just somewhere nice and relaxing to spend some time, maybe get a job to pay my way and stay there longer. After that, maybe I’d try my hand at this space traveling stuff. I’m sure I could get on as a cook on some ship! Seems like there’s a lot out there to do and see, and so many meals to prepare. Cooking’s kind of a hobby of mine.”</i>");
	output("\n\nYou assure her there is a lot out there, and there’s no end to it in sight. She giggles and smiles.");
	output("\n\n<i>“Thanks! It’s sweet of you to say that. Of course, first I’ve got to finish here.”</i> She shrugs. <i>“One thing at a time, right?”</i>");
	//(Select ‘Back’ to return to the Questions menu)
	processTime(6);
	clearMenu();
	addButton(0,"Next",questionsForYammi);
}

//Sex
public function askyammiAboutSex():void
{
	clearOutput();
	yammiShopDisplay();
	output("You don’t feel shy mentioning that so many beauties around is pretty stimulating, not the least of which is Yammi herself. Her face goes blood-orange in blush.");
	output("\n\n<i>“Officially the company doesn’t condone unauthorized breeding and/or sexual interaction with our employees,”</i> she says calmly. When you inquire about unofficially, she smiles a little. <i>“Well, some of the girls are stored in back in case we need to switch flavors, and a friendly visit is possible, sometimes. They do enjoy warm flesh after all the cold machines. For a slight tip of course... a girl’s got to pay her way somehow!”</i> She taps the counter nervously. <i>“Not today though. The girls who would be up for that aren't in. But... maybe for a big enough tip, I might be convinced to put up the ‘Momentary Delay’ sign and lock the door for a little personal time. A woman has needs.”</i>");
	output("\n\n<b>Placeholder till some sex appears. Someone be a dear and write this for me. She doesn't need scenes for everybody.</b>");
	processTime(2);
	clearMenu();
	addButton(14,"Back",questionsForYammi);
}

//Yammi's Bad Day
public function yammisbadday():Boolean
{
	clearOutput();
	yammiShopDisplay();
	output("You head over to Iced Teats, hoping for a quick snack to fill in a little time. As you approach, a small gang of lowlifes storm out. Several look disgruntled, the rest are laughing. You wait until they're gone, then head inside. Immediately you catch the sound of Yammi sniffling, trying not to cry. She's standing behind her cash register and is covered in ice cream! They must have thrown half a dozen bowls at her.");
	output("\n\n<i>“I'm sorry. We're closed for the moment, I have to... Oh! It's you, hello…”</i> She chokes back a sob. <i>“Sorry, you kind of caught me at a bad moment.”</i>");
	if(pc.isAss()) output("\n\nAs if it wasn't obvious.");
	else output("\n\nYou can see that.");
	output("You ask what happened, flipping the sign on the door around to 'Momentary Delay'. You note you saw the gaggle of troublemakers.");
	output("\n\n<i>“Yeah, those guys are always a problem. They demand free stuff because they eat half their bowl and then decide they don't like that flavor, they scream and yell at me all the time... they're just really unpleasant people.”</i> She finally picks up a cloth and wipes her face off. <i>“Those are the kind of people that make me want to buy out my contract. Immediately. If it weren't for that kind of jerks, I'd probably be happy working here!”</i>");
	output("\n\nYou ask if they're really common, as you pick up a cloth to help her wipe the counter. She nods. <i>“There's quite a few. Mostly young hotshots who know I can't do anything so they get away with acting like jerks, but there's a lot of people who just think they should be accommodated no matter how stupid their gripe is or whose fault it is.”</i> She chuckles a little. <i>“This one Deditonian woman we get in here is always trying to get her ice cream free because it's too cold. Really! Ice Cream, from the Iced Teats company, is too cold? I can't imagine why it isn't warmer, you know? And she'll sit here and look down her nose at me for half an hour sometimes and inform me that it's my job to please the customer and blah blah blah.”</i>");
	output("\n\nYou ask her what she does? She smiles and hugs herself.");
	output("\n\n<i>“I put up with it, of course. What else can I do? With her I usually just listen until her ice cream starts to melt, then point out it's warmed up for her. She usually gets insulted and tells my boss, so I get hit with a small fine. Again.”</i>");
	output("\n\nYou offer to stick around and help clean up, but she shakes her head.");
	output("\n\n<i>“Thank you, I appreciate it, but I'll get it. I could use a little time without customers to clear my head. I think I might just have a good cry and then open up again after I change.”</i>");
	output("\n\nYou give her a reassuring smile, then head out, leaving her to catch her breath. You imagined customer service work could suck, but you didn't really think about how badly.");
	flags["YAMMIS_BAD_DAY"] = 1
	processTime(7);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sympathy
public function sympathizeWithYammi():void
{
	clearOutput();
	yammiShopDisplay();
	output("You agree that seems really bad. With a faint grin you do mention that they clearly can't afford to lose her!");
	output("\n\n<i>“Yeah... well yeah. I guess. Still, this is no good. I want to get out there and see something other than this shop. I mean... I owe them, that's fair, but if they keep pulling this whenever I get close, I'm seriously going to flip out at some point!”</i>");
	output("\n\nYou know it's not fair. Still, you assure her that it will all work out. After all, she has her faithful customers. You assure her that the tips won't stop from you at least.");
	output("\n\n<i>“That's true! Alright, enough of me feeling sorry for myself.”</i> She puts on a smile. <i>“So! Welcome to Iced Teats! What can I get you today?”</i>");
	output("\n\nSuddenly, her codex chirps announcing a new message. Poor girl.");
	flags["YAMMI_SYMPATHYZED"] = 1
	clearMenu();
	processTime(2);
	addButton(0,"Next",yammiRepeatMenu);
}

//Pay It
public function payYammisContract():void
{
	clearOutput();
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	output("You tell her to grab her bag and lock up. You're going to cover that contract of hers.");
	output("\n\n<i>“I appreciate the sentiment, but... wait, really?!”</i> She looks stunned when you nod. Speechless, she jumps the counter and hugs you tightly, then looks around at the shop. <i>“Okay um... just give me a moment! Help yourself to some ice cream, I have a couple things to shut down and a bag to grab and I'll be right back!”</i>");
	output("\n\nYou idly sample some flavors while she's gone, and you suspect the girls in the machines know she's leaving. Most look happy, some look a bit sad and many give you thankful looks. Only a few are upset, but you chalk that up to jealousy. Finally, Yammi comes back to the front, locking the back door behind her.");
	output("\n\n<i>“My ex-owners are really angry. I don't care though!”</i> She laughs, then hugs your arm. <i>“Okay! Where to, Boss? Your ship has a kitchen, right? Galley? Whatever it's called? I can cook; I promise you won't regret this!”</i>");
	output("\n\nYou inquire if she isn't perhaps interested in her freedom instead of latching onto you so quickly. She kisses you on the cheek.");
	output("\n\n<i>“You have a ship.  That means you're going all over the place. Don't tell me you couldn't use a fresh made hot meal! And don't worry, I have basic self defense training, in case of robbery! And If we get boarded, I'll just duck into my water tank and turn it really cold, it slows my life signs down to undetectable levels.”</i> She insists, picking up her bag of clothes and whatever personal effects she has. <i>“I won't be in your way and I won't charge you anything for the services. I promise! Besides, I can breathe underwater. I can be useful finding things!”</i>");
	output("\n\nYou shrug. If she wants to come with, you can't imagine it will hurt. And it might be nice to have an actual meal prepared for you once in a while. You agree.");
	output("\n\n<i>“You won't regret this! I promise! Let's go, Boss, I have to make sure the kitchen's all stocked up before we go anywhere!”</i> She locks the front door behind you and then slides the keycard back under the door.");
	clearMenu();
	if(flags ["YAMMI_SYMPATHYZED"] != undefined) pc.credits -= 2
	else pc.credits -= 1
	processTime(10);
	addButton(0,"Next",welcomeToHellsKitchen);
}

//Kitchen Intro
public function welcomeToHellsKitchen():void
{
	clearOutput();
	currentLocation = "SHIP INTERIOR";
	var map:* = mapper.generateMap(currentLocation);
	userInterface.setMapData(map);
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	output("You stroll into the galley to see what Yammi's up to. She's busy setting the place up as she needs it, organizing spices and ingredients and figuring out the layout for everything. To your surprise, she's planning it all out so that everything can be locked down in a few moments, obviously having thought ahead some and not wanting to pick up a mess every time you get into a dogfight or have a rough landing. Yammi's 'bed' is near the entrance, a giant tank of water with a hammock in it. She herself is moving around dressed in little more than a high-legged bikini bottom, an apron, some modest high heels, and a pair of gloves. She doesn't notice you at first, so you get to watch her merrily skip around her new domain. Finally she turns enough to see you, and blushes furiously.");
	output("\n\n<i>“Oh! Hi, Boss! I didn't see you there!”</i> She admits. <i>“I was just making sure everything's ready to go. We're all set up, and I've been coming up with a menu for you. Anything you need?”</i>");
	output("\n\nYou assure her you're just here to see to her getting settled in.  She smiles.");
	output("\n\n<i>“Yep, no problems here! We've got plenty of food, lots to drink, and I even made sure to squirrel away some snacks. Your utensils are okay for now, I'll pick more up as I need them.”</i>");
	output("\n\nYou tell her to be sure that she mentions anything she needs.");
	output("\n\n<i>“Sure thing, Boss! You just let me know if there's anything I can get for you!”</i> She manages an amateur salute, which");
	if(pc.isAss()) output("makes you raise an eyebrow.");
	if(pc.isMischievous()) output("makes you chuckle.");
	else output("you don't let hanging and salute back.");
	processTime(9);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Yammi in the Kitchen Main Menu
public function yammiMainMenu():void
{
	clearOutput();
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	output("The kitchen's a busy place, with steam rising from boiling soups and hot food hissing as it is fried. A stove in back seems to be baking something. In the center of this storm of culinary chaos is Yammi, humming to herself and stirring, flipping, and chopping various foodstuffs, wearing nothing but an apron, gloves, and a bikini bottom. She smiles when she sees you.");
	output("\n\n<i>“Heya, Boss! What's up?”</i> She inquires, setting down her spatula and turning the heat down so nothing burns. <i>“Can I get you anything?”</i>");
	clearMenu();
	addButton(0,"Talk",talkToYammi);
	addButton(1,"Menu",eatYammisCooking);
	addButton(2,"Help",helpYammi);
	addButton(5,"Sex",eatYammisPussyHahahaImSoFunny);
	addButton(14,"Leave",mainGameMenu);
}

//Talk Menu
public function talkToYammi():void
{
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	clearMenu();
	addButton(0,"HerSpecie",aboutHerSpecie);
	addButton(1,"HerChildhood",aboutHerChildhood);
	addButton(2,"Cooking",aboutCooking);
	addButton(14,"Back",yammiMainMenu);
}

//Helping Yammi
//Need more scenes !!!
public function helpYammi():void
{
	if(if(flags["HELPED_YAMMI"] == undefined) || if(flags["HELPED_YAMMI"] == 2));
	{
		flags["HELPED_YAMMI"] = 1;
		helpYammiOne();
	}
	else if(flags["HELPED_YAMMI"] == 1);
	{
		flags["HELPED_YAMMI"] = 2;
		helpYammiTwo();
	}
}

//Yammi's Menu
public function eatYammisCooking():void
{
	clearOutput();
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	output("<i>“Hungry, eh, Boss? Here ya go, this is what's on the skillet, so to speak!”</i> She hands you a menu and waits expectantly.");
	clearMenu();
	addButton(0,"Pepper Pie",orderPepperPie,"Pepper Pie","A special blend of hot and sweet peppers in a ground meat pie with fresh baked crust and rolls. Spicy!");
	addButton(1,"Steak",orderSteak,"Steak","A side-cut steak from a Fruldian Meat-Animal.");
	addButton(2,"Sweet Soup",orderSweetSoup,"Sweet Soup","A fruit and nut soup made in the milk of a coconut, chilled, and served as a drink.");
	addButton(3,"Nobblur",orderNobblur,"Nobblur","Pastry filled with mixed veggies and cheese, ground meat, spices, and gravy. Served in a bowl with grains to soak up the mess.");
	addButton(4,"Snack Tray",orderSnackTray,"Snack Tray","A big tray with finger foods of all sorts to munch on.");
	addButton(5,"Fried Tulpe",orderFriedTulpe,"Fried Tulpe","A fried fish, imported from Yammi's home world and cooked in citrus fruit pulp. Served with a side of tubers.");
	addButton(6,"Yammi's Sammich",orderYammisSammich,"Yammi's Sammich","A four foot long bread roll stuffed with a blend of spiced meat, seafood and cheese until it's about to explode, then baked.");
	addButton(14,"Back",yammiMainMenu);
}

//Talk - Her Species
public function aboutHerSpecie():void
{
	clearOutput();
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	output("You grab a seat and tell her you'd like to have a few words with her about herself. She nods and continues working. <i>“Of course, Boss! Ask me anything!”</i>");
	output("\n\nNaturally you start with her. Specifically, you ask what she can tell you about her kind.");
	output("\n\n<i>“Oh, right! I never filled you in about us. Keep in mind I was raised apart from my kin, but I did a lot of research. I'm a Sparadat. We're from a hot world with all sorts of shallow-water stretches and rocky terrain. I think I mentioned we're amphibians?”</i> She glances over to you, and you nod for her to continue. <i>“My race have live births like most humanoids. We also have a highly developed sense of smell and taste; I think that's why I became such a fussy cook!”</i> She laughs.");
	output("\n\nMakes sense. She pauses to get a few things moved around in their pans, then starts cutting up some vegetables.");
	output("\n\n<i>“So, we live for a long while, but nobody's sure how long. Our world doesn't have enough on it to really catch most people's interest. No major wealth, just us. So we've kind of slipped through the cracks of the galaxy, and I think most Sparadat are pretty good with that. Still, someone had use for a couple of us, or I wouldn't be out here. I just hope my ancestors were adventurous, not captured specimens!”</i>");
	output("\n\nYou decide to switch topics before she thinks too hard on that, and ask about how her people fare on their world.");
	output("\n\n<i>“Oh, they're top of the food chain. Most of the water is only as deep as about twice my height. The few places it gets really deep have big fish, but since my kind are poisonous to most native critters, they don't bother us. I think that's why we have such bright colors, to alert other creatures we're dangerous to eat.”</i> She scoops the cut veggies into a pot and stirs it for a second. Then a flash of realization crosses her face and she hurries to add: <i>“By the way, just for your peace of mind and all, we're not poisonous to humanoids! You know, so you're not worried I might kill you while cooking or anything!”</i>");
	output("\n\nYou breathe out a sigh of relief. The thought had crossed your mind. You both have a quick nervous laugh, then she hands you a small plate with several fresh buns on it.");
	output("\n\n<i>“Not to tell you your job, but hadn't you better make sure everything's good at the helm from time to time? Besides, I'm really going to be cranking up the heat in here in a minute.”</i>");
	output("\n\nYou thank her for the warning and take your snack to go.");
	processTime(12);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Talk - Childhood
public function aboutHerChildhood():void
{
	clearOutput();
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	output("\n\nYou lean on the edge of the counter and ask Yammi if she's got a minute. She nods and runs something through a blender. When the noise cuts out, you inquire about how she was raised.");
	output("\n\n<i>“Hm? Well, I guess not much different from most people. I mean, there was a lot more focus on company loyalty and all that, but we got a decent education about how things work. I learned the bare bones of galactic navigation and stuff in case I got used as a server on a ship, picked up a bunch of basic chatter in several languages, there was a ton of phys-ed…”</i> She sighs as she mixes something with the blended substance. <i>“It was a nice time. Then they got into training us and we started getting all rebellious and adolescent, and boy! I earned myself more than a few wallops across the arse.”</i>");
	output("\n\nYou express some disbelief that she could be a troublemaker, considering the things you've seen her put up with. She just laughs.");
	output("\n\n<i>“Oh, you wouldn't believe the things I did! Cooking and chemistry are related and I used to find all sorts of ways to blow things up or stain things. I only got caught once in a while though. Lucky me! They weren't above locking us in little boxes to force us to think about how terrible we were, if they felt we needed a time out.”</i>");
	output("\n\nYou assure her that she's safe from that kind of treatment around here. She smiles to you and finishes mixing whatever she's been making.");
	output("\n\n<i>“Thanks, Boss! Here, taste this, see what you think.”</i>");
	output("\n\nShe feeds you a spoonful of what appears to be red scrambled eggs. The taste isn't bad... for a second. Then, your stomach heaves and you grab the trash can. Alarmed, she holds ");
	if(pc.hairLenght < 4) output("your head up ");
	else output("your hair out of your face ");
	output("and waits for you to finish clearing out your lunch. When you can, you ask her what was that");
	if(pc.isAss()) output(" shit");
	output(".");
	output("\n\n<i>“That");
	if(pc.isAss()) output("...");
	output(" was the last time I listen to an article saying something very, very healthy is 'a little bit unappealing to some', Boss. I'm so sorry!”</i> She hugs you gently, then helps you upright. <i>“Tell you what, you go sit down a minute, and I'll get you something to settle your stomach!”</i>");
	output("\n\nYou catch your breath, then with a chuckle you note that if she doesn't want you asking about her school days, just has to say so!");
	output("\n\n<i>“Har-Dee-Har-Har, Boss.”</i> She shakes her head and points, sending you from her kitchen. At least the milkshake she sends you later settles your stomach nicely!");
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Talk - Cooking
public function aboutCooking():void
{
	clearOutput();
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	output("You stroll into the kitchen to find your cook finishing the latest batch of dishes. She glances over to you and smiles. You give her a hand putting some things away, noting that she loves to cook way more than you really thought possible.");
	output("\n\n<i>“I guess. Never really thought about it. I just like to cook! It's something I'm good at, and with all the flavors I got to try around the ice cream shop it just made sense to look for more. What can I say, I'm glad my metabolism is insanely fast compared to most species', or I'd be a blimp!”</i>");
	output("\n\nYou note you're not complaining, since you're getting most of the benefit. It does dawn on you to inquire about how she got to learn so much about culinary arts as a cashier.");
	output("\n\n<i>“Oh, that. Yeah, they didn't have a lot to throw at me at first, so I saved up tips and bought access to some awesome info-casts about cooking. Just ran them through the store receiver and listened to them when there were no customers. Then they got the idea to maybe open a company restaurant, so I volunteered to work there and studied like a madwoman.”</i> She sighs heavily and shrugs. </i>“The idea went blooey, but I got my hands on more recipes and the like. The other girls I occasionally worked with were happy to try my experiments, and when there was nobody else I'd feed it to the spare ice cream girls.”</i>");
	output("\n\nYou chuckle at the mental image of the girls trapped in the ice cream machines, being spoon-fed her latest experiment. Rather mad-scientist like! Yammi's face goes a deeper orange as she huffs out a peevish breath.");
	output("\n\n<i>“I'll have you know those girls appreciated something with a little flavor as often as they could get it!”</i> She snaps in irritation. <i>“Evidently a little more than a certain wise-cracking captain does!”</i>");
	output("\n\nWorried that you might lose snacking privileges, ");
	if(pc.isNice()) output("you hug and kiss her on the cheek, ");
	if(pc.isMischievous()) output("you throw her into a quick headlock and tousle her hair, ");
	else output("you raise your hands and apologize, ");
	output("reminding her you're very happy to have her and letting her know you're just kidding around. She rolls her eyes.");
	output("\n\n<i>“Yeah yeah. If you really appreciate the effort, maybe you could get me a new set of knives, or some new dishes. Ooooh, how about a Kazimsta Roast-pit? They use collected solar radiation to flash-cook things; it'd be really quick. They're not too expensive!”</i>");
	output("\n\nYou swallow a lump in your throat and note that you've seen those things before, and that the phrase <i>not too expensive</i> needs to drop the first word. Last time you saw one it was priced at something like half a ship.");
	output("\n\n<i>“Fine!”</i> She sticks her tongue out like a little kid. <i>“You could at least show up before I finish the dishes next time!”</i>");
	output("\n\nYou make no promises as something alerts you that you should be on the bridge. Hopefully just some stellar debris, but it's a good way to duck out of dishpan hands!");
	processTime(9);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Pepper Pie
public function orderPepperPie():void
{
	clearOutput();
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	pc.energy(15);
	output("The pie is about as big around as the plate it's served on, three inches tall, and smells plenty spicy.  There are four rolls to go with it. Yammi watches you from nearby as you dig in, taking an experimental bite. It's exploding with strong flavors, mostly bold hot ones with an undertone of sweetness. You finish the first quarter before the slow-building heat catches up to you. You wolf down one of the buns and gesture to Yammi, who quickly hands you a mixed drink of something creamy. It quenches the burn down to a light throb.");
	output("\n\n<i>“You okay, Boss?”</i> Yammi inquires, worried. <i>“I didn't make it too hot, did I?”</i>");
	output("\n\nYou answer her with a grin and immediately begin to chow down again. It's absolutely fantastic, you just have to indulge in a drink from time to time to control the burn! It takes you about ten minutes to wolf down the whole thing, then you decide you'd better get back to work. Yammi seems pleased you liked it.");
	output("\n\nOddly, you feel like the meal digests away quickly.  It seems Yammi's got your weight on her mind.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Steak
public function orderSteak():void
{
	clearOutput();
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	pc.energy(20);
	pc.thickness += (2);
	output("Who doesn't love a good steak? You take your seat and wait. A few minutes later Yammi rolls out the biggest hunk of meat you've ever laid eyes on. It's more than two feet across and over an inch thick, marbled with enough fat to make sure the meat is tender and juicy. She has to bring it out on a cart, still sizzling.");
	output("\n\n<i>“Here ya go, Boss! Take what you like and I'll use the rest for steaks and sandwiches later!”</i> She giggles, and you slice yourself a big hunk off to enjoy.");
	output("\n\nIt tastes an awful lot like beef. Well, what can you say? It's about the best steak you've had in a long time! You can tell it was grilled on an open flame, and it's been given just a hint of spice. You consider yourself one lucky explorer to be getting fresh barbecued steaks in the middle of space!");
	processTime(9);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sweet Soup
public function orderSweetSoup():void
{
	clearOutput();
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	pc.energy(10);
	pc.thickness += (1);
	output("You decide on something sweet. Yammi pours you a frothy white liquid from a pitcher and tops it with a couple flakes of shaved nuts, then presents it to you with a big straw. The drink is served in a glass that sits on the floor and stands over three feet tall, but is very narrow.");
	output("\n\n<i>“Traditional serving glass.”</i> Yammi explains as you sip at it. <i>“The race that made the recipe are really tall but very skinny so they don't eat much. I had to modify the mix a lot since their foods tend to be deadly to most life, but I think I got the essence of it!”</i>");
	output("\n\nWell, it's certainly sweet! A nutty-creamy blend of taste that would be perfect for any dessert. You're not complaining, until you realize you've downed it so fast that you're getting a headache. Yammi giggles and hugs you, chiding you for being such an overeager little kid with the sugary stuff. On the upside, she informs you that all the sugars are natural and so they won't make you fat as long as you exercise.");
	processTime(7);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Nobblur
public function orderNobblur():void
{
	clearOutput();
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	pc.energy(15);
	pc.thickness += (3);
	output("Yammi puts a big bowl in front of you, and there it is, a pastry dome full of greatness. You pick it up, take a bite, and immediately spill warm gravy back into the bowl where dark grains are waiting to soak it up. It's a wave of different flavors with every bite, and you enjoy each one. It's also a very heavy meal, and you have to pause halfway through. Yammi chuckles to herself as she watches you power through it, then she grabs a spoon.");
	output("\n\n<i>“Don't worry, Boss, I'll snack on the grains.”</i> She offers, helping you to your feet. <i>“You go have a sit down and let that settle!”</i>");
	output("\n\nYou agree that after a nobblur, it's probably best to take things slow. You go to put your feet up in your favorite chair.");
	processTime(12);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Snack Tray
public function orderSnackTray():void
{
	clearOutput();
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	pc.energy(15);
	output("Yammi takes about ten minutes to put together a sampler from all the things she's got on the go. You are amazed at the tray's layout, snacks spiraling out from the dip trays in the middle. Cut fruit, fresh veggies, nuts, pastries, pasta, finger sized meat cuts, small fish samples, chips, and more. It's less a meal than a munch-fest, and you and Yammi both contribute to the demise of the mighty snack tray. Fifteen minutes later you excuse yourself with a smaller tray of leftovers to go do your rounds. There's just so many things to eat!");
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fried Tulpe
public function orderFriedTulpe():void
{
	clearOutput();
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	pc.energy(25);
	output("Yammi presents to you a specialty of her species. It's a golden-brown fried fish fillet. It's also almost a foot long. The spud-like tubers served with it are an appetizing baked red. You dig in, and find that it's a little bland but very filling. The tubers are nice and soft.  It's very much a proper home-cooked meal, in space, far from home. You feel pretty good about your mission, as a little twinge of homesickness you were unaware of goes away for a while.");
	output("\n\n<i>“Hope you enjoyed it, Boss. It's one of my favorite, for obvious reasons.”</i> She smiles. <i>“I stock quite a few tulpe. I know, plain, but they're quite healthy, I assure you!”</i>");
	processTime(8);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Yammi's Sammich
public function orderYammisSammich():void
{
	clearOutput();
	showName("\nYAMMI");
	showBust("YAMMI");
	author("Lady Jenn");
	pc.energy(20);
	pc.thickness += (3);
	output("Yammi rolls out a trolley with a four foot long monster of a sandwich on it. It smells of cooked meat and fish, and practically oozes with cheese. You're stunned at the sight of this monster.");
	output("\n\n<i>“My favorite!”</i> She giggles. <i>“Of course I usually eat one over the entire day, but it's not like I can't just hack a piece off and eat on the run, which is what makes it so nice.”</i>");
	output("\n\nYou measure out a good chunk to slice off and dig in. The meat and seafood don't blend as smoothly as you might have thought, but they complement each other well at least, and the cheese she used is different from others you've tried before. You greedily devour the whole thing in a couple minutes, to Yammi's delight.");
	output("\n\n<i>“Now, don't eat too many of these! They're a bit heavy for your kind, Boss!”</i> She cautions you, rolling the rest back to its storage space.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Help 1
public function helpYammiOne():void
{
	clearOutput();
	output("I still have to do this because I'm a lazy bitch.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Help 2
public function helpYammiTwo():void
{
	clearOutput();
	output("I still have to do this because I'm a lazy bitch.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
