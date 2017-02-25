public Action Command_Class(int client, int args)
{
  if(IsValidClient(client))
  {
    Menu_ClassList(client);
  }
  return Plugin_Handled;
}
public Action Command_Vlastnosti(int client, int args)
{
  if(IsValidClient(client))
  {
    Menu_Attributes(client);
  }
  return Plugin_Handled;
}
public Action Command_Drop(int client, int args)
{
  if(IsValidClient(client))
  {
    int weapon = GetEntPropEnt(client, Prop_Send, "m_hActiveWeapon");
    int iWeaponIndex;
    if(IsValidEntity(weapon))
    {
      iWeaponIndex = GetEntProp(weapon, Prop_Send, "m_iItemDefinitionIndex");
    }
    if(iWeaponIndex == 49)
    {
      return Plugin_Continue;
    }
    else
    {
      if(i_gCurrentItem[client] != Item_None)
      {
        Client_RemoveItemEffect(client);
        PrintToChat(client, "%s Zahodil jsem item %s", CHAT_TAG, ItemNames[i_gCurrentItem[client]]);
        i_gCurrentItem[client] = Item_None;
      }
      else
      {
        PrintToChat(client, "%s Nemáš žádný item", CHAT_TAG);
      }
    }

  }
  return Plugin_Handled;
}
public Action Command_Cod(int client, int args)
{
  if(IsValidClient(client))
  {
    Menu_Cod(client);
  }
  return Plugin_Handled;
}
public Action Command_ClassInfo(int client, int args)
{
  if(IsValidClient(client))
  {
    Menu_ClassInfo(client);
  }
  return Plugin_Handled;
}
public Action Command_Item(int client, int args)
{
  if(IsValidClient(client))
  {
    switch(i_gCurrentItem[client])
    {
      case Item_None: PrintToChat(client, "%s %t", "You not have this item! Kill enemy to get on the item", CHAT_TAG);
      case Item_Boty: PrintToChat(client, "%s %t", "Shoes – your steps do not hear", CHAT_TAG);
      case Item_DoubleVesta: PrintToChat(client, "%s %t", "2x Vesta – you Get dual vest", CHAT_TAG);
      case Item_SpecialVesta: PrintToChat(client, "%s %t", "Special vest – more resistant to shells and explosions", CHAT_TAG);
      case Item_VeteranKnife: PrintToChat(client, "%s %t", "Veteran Knife – intervention with knife causes double damage", CHAT_TAG);
      case Item_ShockEnemy: PrintToChat(client, "%s %t", "Shock enemy - When you attack someone in the back, injuries are 2 times stronger", CHAT_TAG);
      case Item_NinjaCloak: PrintToChat(client, "%s %t", "Ninja Cloak - You're partially invisible", CHAT_TAG);
      case Item_Morfin: PrintToChat(client, "%s %t", "Morphine - 1/3 chance that you're born again after death", CHAT_TAG);
      case Item_UltraKnife: PrintToChat(client, "%s %t", "Ultra knife – any interference with knife kills enemy", CHAT_TAG);
      case Item_DeagleMaster: PrintToChat(client, "%s %t", "Deagle master – each hit with a knive causes 2 x damage", CHAT_TAG);
      case Item_BigGrenade: PrintToChat(client, "%s %t", "Big Grenade - instantly killing the enemy with HE grenade", CHAT_TAG);
      case Item_NinjaStep: PrintToChat(client, "%s %t", "Ninja step - by double jump", CHAT_TAG);
      case Item_SecretMil: PrintToChat(client, "%s %t", "Secret Mil - Your injuries are reduced by 1/3. Do you have a 1/3 chance of blinding enemy", CHAT_TAG);
      case Item_AwpSniper: PrintToChat(client, "%s %t", "AWP Sniper-Instant kills with AWP", CHAT_TAG);
      case Item_Adrenalin: PrintToChat(client, "%s %t", "Adrenalin – for each kill an opponent you get + 30HP", CHAT_TAG);
      case Item_Chuck: PrintToChat(client, "%s %t", "Chuck - For each kill an opponent you refill a + 20HP", CHAT_TAG);
      case Item_XPMaster: PrintToChat(client, "%s %t", "Master XP - For each kill an opponent you get 2x more XP", CHAT_TAG);
      case Item_NasaVesta: PrintToChat(client, "%s %t", "NASA Vest – your armor will increase to 250, you can stand more!", CHAT_TAG);
      case Item_Veteran: PrintToChat(client, "%s %t", "Veteran – you'll get each wheel + 50HP and slow running", CHAT_TAG);
      case Item_PrvniPomoc: PrintToChat(client, "%s %t", "First Aid - Press E immediately add HP", CHAT_TAG);
      case Item_TitanBox: PrintToChat(client, "%s %t", "Titan box - Each hit causes of + 10dmg more damage", CHAT_TAG);
      case Item_PlukSwitch: PrintToChat(client, "%s %t", "Pluk switch - Each hit causes of + 15dmg more damage", CHAT_TAG);
      case Item_Nanosuit: PrintToChat(client, "%s %t", "Nanosuit - Pressing E 4 seconds to complete invisibility", CHAT_TAG);
      case Item_Recruit: PrintToChat(client, "%s %t", "Recruit - Get to the beginning of the round + 50HP and run slower", CHAT_TAG);
      case Item_ReflectArm: PrintToChat(client, "%s %t", "Reflect Arm - 1/3 chances to repulse damage", CHAT_TAG);
      case Item_CptBook: PrintToChat(client, "%s %t", "CPT. book – immune to 3 enemy missiles", CHAT_TAG);
      case Item_FlyModul: PrintToChat(client, "%s %t", "Pressing E and SPACE you use Fly module with which you jump into the distance", CHAT_TAG);
      case Item_AntiGravity: PrintToChat(client, "%s %t", "AntiGravity - You have low gravity, high Pits", CHAT_TAG);
      case Item_Klobouk: PrintToChat(client, "%s %t", "Hat - After pressing E supplementation is completely HP to 250HP", CHAT_TAG);
      case Item_GhostHelm: PrintToChat(client, "%s %t", "Ghost Helm – you'll get immunity to 3 shots to the head", CHAT_TAG);
      case Item_BunnyHoper: PrintToChat(client, "%s %t", "BunnyHoper – you're jumping bunnyhop by holding the space bar", CHAT_TAG);
      case Item_M4Style: PrintToChat(client, "%s %t", "M4 Style - Get the figure for M4 (Activation via E)", CHAT_TAG);
    }
  }
  return Plugin_Handled;
}
public Action Command_Exp(int client, int args)
{
  /*char arg[10];
  GetCmdArg(args, arg, sizeof(arg));
  Client_AddClassExp(client);*/
  i_gCurrentItem[client] = Item_NinjaCloak;
  f_ClientItemStart[client] = GetGameTime();
  Client_CreateItemEffect(client);
  return Plugin_Handled;
}
public Action Command_Level(int client, int args)
{
  char arg[10];
  GetCmdArg(args, arg, sizeof(arg));
  int level = StringToInt(arg);
  i_gClientClassLvl[client][i_gCurrentClass[client]] = level;
  return Plugin_Handled;
}
public Action Command_GiveItem(int client, int args)
{
  if(IsValidClient(client))
  {
    Menu_PridatItem(client);
  }
  return Plugin_Handled;
}
